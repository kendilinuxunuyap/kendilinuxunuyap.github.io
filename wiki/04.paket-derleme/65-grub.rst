grub
++++

GRUB (GRand Unified Bootloader), çoklu işletim sistemlerini destekleyen ve kullanıcıların sistemlerini başlatmalarını sağlayan bir önyükleyici yazılımıdır. Linux tabanlı sistemlerde yaygın olarak kullanılan GRUB, sistem açılışında gerekli olan çekirdek dosyalarını yükleyerek işletim sisteminin çalışmasını başlatır. GRUB, kullanıcıların farklı işletim sistemleri arasında seçim yapmalarına olanak tanırken, aynı zamanda gelişmiş yapılandırma seçenekleri sunar.

GRUB'un temel özellikleri arasında, çoklu çekirdek desteği, ağ üzerinden önyükleme yapabilme yeteneği ve kullanıcı dostu bir arayüz bulunmaktadır. Örneğin, GRUB yapılandırma dosyası genellikle /boot/grub/grub.cfg konumunda bulunur ve burada önyükleme seçenekleri tanımlanır. 

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="grub"
	version="2.12"
	description="GNU GRand Unified Bootloader"
	source="https://ftp.gnu.org/gnu/grub/grub-$version.tar.xz"
	depends="glibc,readline,ncurses,xz-utils,efibootmgr"
	builddepend="rsync,freetype,ttf-dejavu"
	group="sys.boot"
	uses=(efi bios)
	uses_extra=(ia32)
	dontstrip=1
	efi_dp=(efibootmgr)
	ia32_dp=(efibootmgr)

	unset CFLAGS
	unset CXXFLAGS

	get_grub_opt(){
		echo -n "--disable-efiemu "
		if [[ "$1" == "efi" ]] ; then
		    echo -n "--with-platform=efi --target=x86_64"
		elif [[ "$1" == "ia32" ]] ; then
		    echo -n "--with-platform=efi --target=i386"
		elif [[ "$1" == "bios" ]] ; then
		    echo -n "--with-platform=pc"
		fi
	}

	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		        mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		        rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		        cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		        dowloadfile=$(ls|head -1)
		        filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		        if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		        director=$(find ./* -maxdepth 0 -type d)
		        directorname=$(basename ${director})
		        if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		        mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
	cd $ROOTBUILDDIR
	 echo depends bli part_gpt > $SOURCEDIR/grub-core/extra_deps.lst
		for tgt in ${uses[@]} ; do
		    cp -prfv $name-$version $tgt
		done


		for tgt in ${uses[@]} ; do
		    cd $tgt
		    autoreconf -fvi
		    ./configure --prefix=/usr \
		        --sysconfdir=/etc \
		        --libdir=/usr/lib64/ \
		        --disable-nls \
		        --disable-werror \
		        --disable-grub-themes \
		        $(get_grub_opt $tgt)
		    cd ..
		done
	}

	build(){
		for tgt in ${uses[@]} ; do
		    make $jobs -C $tgt
		done
	}

	package(){
		for tgt in ${uses[@]} ; do
		    make $jobs -C $tgt install DESTDIR=$DESTDIR
		done
		# default grub config
		mkdir -p $DESTDIR/etc/default $DESTDIR/usr/bin/
		{
		      echo 'GRUB_DISTRIBUTOR=""'
		echo 'GRUB_TERMINAL_OUTPUT=console'
		echo 'GRUB_CMDLINE_LINUX_DEFAULT="quiet"'
		echo 'GRUB_CMDLINE_LINUX=""'
		      echo 'GRUB_DEFAULT=0'
		      echo 'GRUB_TIMEOUT=5'
		      echo 'GRUB_DISABLE_SUBMENU=y'
		echo 'GRUB_DISABLE_OS_PROBER=true'
		      echo 'GRUB_DISABLE_RECOVERY=true'
		} > $DESTDIR/etc/default/grub
		echo "#!/bin/sh" > $DESTDIR/usr/bin/update-grub
		echo "grub-mkconfig -o /boot/grub/grub.cfg" >> $DESTDIR/usr/bin/update-grub
		chmod 755 $DESTDIR/usr/bin/update-grub
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Paket adında(grub) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




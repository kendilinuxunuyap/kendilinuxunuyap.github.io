.. _busybox:
busybox
+++++++

BusyBox, Linux tabanlı sistemlerde "İsviçre Çakısı" benzeri bir işlevsellik sunarak, çeşitli komutları tek bir ikili dosya altında toplar. 

BusyBox, ls, cp, mv, rm gibi temel komutların yanı sıra, ağ yönetimi, dosya sistemleri ve sistem yönetimi gibi birçok alanda işlevsellik sunar. Kullanıcılar, bu komutları BusyBox ile çağırarak bir dosyayı kopyalamak için aşağıdaki komut kullanılabilir:

.. code-block:: shell
	
	busybox cp kaynak_dosya hedef_dosya

Derleme
--------

.. code-block:: bash
	
	#--------------------------------------------------------------------------------------------------------------------
	#!/usr/bin/env bash
	version="1.36.1"
	name="busybox"
	depends="glibc"
	description="linux araç paketi static derlenmiş hali"
	source="https://busybox.net/downloads/${name}-${version}.tar.bz2"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -1)"  # Display adı
	user=$(who | grep "(${display})" | awk '{print $1}')                      # Display kullanıcısı

	ROOT="/home/$user/distro"
	ROOTBUILDDIR="$ROOT/build"                # Derleme dizini
	BUILDDIR="$ROOT/build/build-${name}-${version}" # Alt dizin
	DESTDIR="$ROOT/rootfs"                     # Yükleme dizini
	PACKAGEDIR=$(pwd)                          # Paket dizini
	SOURCEDIR="$ROOT/build/${name}-${version}" # Kaynak dizini

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
		cp -prfv $PACKAGEDIR/files $SOURCEDIR/
		make defconfig
		sed -i "s|.*CONFIG_STATIC_LIBGCC .*|CONFIG_STATIC_LIBGCC=y|" .config
		sed -i "s|.*CONFIG_STATIC .*|CONFIG_STATIC=y|" .config
	}
	build(){ 
		make 
	}
	package(){
		mkdir -p $DESTDIR/bin
		install busybox ${DESTDIR}/bin/busybox
		# install udhcpc script and service
	 	mkdir -p ${DESTDIR}/usr/share/udhcpc/ ${DESTDIR}/etc/init.d/
		install ../files/udhcpc.script ${DESTDIR}/usr/share/udhcpc/default.script
		install ../files/udhcpc.openrc ${DESTDIR}/etc/init.d/udhcpc
		cd $DESTDIR/bin&&ln -s busybox hostname
		cd $DESTDIR/bin&&ln -s busybox udhcpc
		cd $DESTDIR/bin&&ln -s busybox ps
		cd $DESTDIR/bin&&ln -s busybox which
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/busybox/files.tar>`_ **Paket Derleme Yöntemi** konusunda anlatıldığı gibi derleme işlemini yapınız.
  
.. raw:: pdf

   PageBreak





.. _eudev:
eudev
+++++

Eudev, udev'in bir çatallanmış halidir. Udev, donanımların tanınması, yönetilmesi gerekli pakettir. Debian ortamında bu paketin derlenmesi için; **sudo apt install libkmod-dev gperf** paketlerin kurulması gerekmektedir.


.. code-block:: bash
	
	#--------------------------------------------------------------------------------------------------------------------
	#!/usr/bin/env bash
	version="3.2.14"
	name="eudev"
	depends="glibc,readline,ncurses,gperf"
	description="modül ve sistem iletişimi sağlayan paket"
	source="https://github.com/eudev-project/eudev/releases/download/v3.2.14/${name}-${version}.tar.gz"
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
		cp $PACKAGEDIR/files/eudev.hook $SOURCEDIR
		cp $PACKAGEDIR/files/eudev.init-bottom $SOURCEDIR
		cp $PACKAGEDIR/files/eudev.init-top $SOURCEDIR

		./configure --prefix=/usr --bindir=/sbin --sbindir=/sbin --libdir=/lib64 --disable-manpages \ 
		--disable-static --disable-selinux --enable-modules --enable-kmod --sysconfdir=/etc --exec-prefix=/ \
		--with-rootprefix=/ --with-rootrundir=/run --with-rootlibexecdir=/lib64/udev --enable-split-usr 
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		mkdir -p ${DESTDIR}/usr/share/initramfs-tools/{hooks,scripts}
	  	mkdir -p ${DESTDIR}/usr/share/initramfs-tools/scripts/init-{top,bottom}
	  	install $SOURCEDIR/eudev.hook ${DESTDIR}/usr/share/initramfs-tools/hooks/udev
	    install $SOURCEDIR/eudev.init-top ${DESTDIR}/usr/share/initramfs-tools/scripts/init-top/udev
	    install $SOURCEDIR/eudev.init-bottom ${DESTDIR}/usr/share/initramfs-tools/scripts/init-bottom/udev
	    	
		cd ${DESTDIR}
		mkdir -p bin
		cd bin
		ln -s ../sbin/udevadm udevadm
		ln -s ../sbin/udevd udevd
		mkdir -p  ${DESTDIR}/usr/lib64/pkgconfig/
		cd ${DESTDIR}/usr/lib64/pkgconfig/
		ln -s ../../../lib64/pkgconfig/libudev.pc libudev.pc
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/eudev/files.tar>`_ **Paket Derleme Yöntemi** konusunda anlatıldığı gibi derleme işlemini yapınız.

.. raw:: pdf

   PageBreak




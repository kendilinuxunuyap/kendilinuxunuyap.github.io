.. _audit:
audit
+++++

Audit paketi, güvenlik denetimlerini gerçekleştirmek için tasarlanmış bir yazılımdır. Debian ortamında bu paketin derlenmesi için; **sudo apt install libaudit-dev** komutuyla paketin kurulması gerekmektedir.

.. code-block:: bash
	
	#--------------------------------------------------------------------------------------------------------------------
	#!/usr/bin/env bash
	name="audit"
	version='3.1.1'
	depends=""
	description="servis yöneticisi"
	source="https://github.com/linux-audit/audit-userspace/archive/refs/tags/v$version.tar.gz"
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
		cp -prvf $PACKAGEDIR/files/ $SOURCEDIR
		./autogen.sh
		./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib64 --disable-zos-remote --disable-listener \
		--disable-systemd --disable-gssapi-krb5 --enable-shared=audit --with-arm --with-aarch64 --without-python \
		--without-python3 --with-libcap-ng=no
	}
	build(){
		    make
	}
	package(){
		make install DESTDIR=$DESTDIR
		install -Dm755 files/auditd.initd "$DESTDIR"/etc/init.d/auditd
		install -Dm755 files/auditd.confd "$DESTDIR"/etc/conf.d/auditd
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/audit/files.tar>`_ **Paket Derleme Yöntemi** konusunda anlatıldığı gibi derleme işlemini yapınız.
  
.. raw:: pdf

   PageBreak





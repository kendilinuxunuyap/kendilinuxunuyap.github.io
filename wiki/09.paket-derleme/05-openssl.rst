.. _openssl:
openssl
+++++++

OpenSSL, şifreleme, sertifika yönetimi ve güvenli bağlantılar (TLS/SSL) oluşturmak için kullanılır. coreutils için gerekli olan paket.

Derleme
--------

Debian ortamında bu paketin derlenmesi için; **sudo apt install perl** komutuyla paketin kurulması gerekmektedir.

.. code-block:: bash

	#--------------------------------------------------------------------------------------------------------------------	
	#!/usr/bin/env bash
	version="3.2.0"
	name="openssl"
	depends="glibc,zlib"
	description="openssl"
	source="https://www.openssl.org/source/${name}-${version}.tar.gz"

	# Display adı ve kullanıcı
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -1)"
	user=$(who | grep "(${display})" | awk '{print $1}')

	ROOT="/home/$user/distro"
	ROOTBUILDDIR="$ROOT/build"                    # Derleme dizini
	BUILDDIR="$ROOT/build/build-${name}-${version}"  # Alt dizin
	DESTDIR="$ROOT/rootfs"                         # Yükleme dizini
	PACKAGEDIR=$(pwd)                             # Paket dizini
	SOURCEDIR="$ROOT/build/${name}-${version}"   # Kaynak dizini

	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		#isimde boşluk varsa silme işlemi yapılıyor
		for f in *\ *; do mv "$f" "${f// /}"; done 
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; \
		else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; \
		then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		cp -prfv $PACKAGEDIR/files/ $SOURCEDIR
		wget -O "$SOURCEDIR/files/cacert.pem" https://curl.haxx.se/ca/cacert.pem
		patch -Np1 -i "$SOURCEDIR/files/ca-dir.patch"
		./config --prefix=/usr --openssldir=/etc/ssl \
		    --libdir=/usr/lib64 shared linux-x86_64
	}

	build(){
		make depend
		make
	}

	package(){
		mkdir -p "${DESTDIR}/etc/ssl/" "${DESTDIR}/sbin/"
		install "$SOURCEDIR/files/update-certdata" "${DESTDIR}/sbin/update-certdata"
		install "$SOURCEDIR/files/cacert.pem" "${DESTDIR}/etc/ssl/cert.pem"
		make DESTDIR="${DESTDIR}" install_sw install_ssldirs install_man_docs
		"${DESTDIR}/sbin/ldconfig" -r "${DESTDIR}"    # sistem güncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/openssl/files.tar>`_ **Paket Derleme Yöntemi** konusunda anlatıldığı gibi derleme işlemini yapınız.

.. raw:: pdf

   PageBreak




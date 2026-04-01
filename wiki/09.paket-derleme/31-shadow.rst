.. _shadow:
shadow
++++++

Shadow paketi, kullanıcı hesaplarının şifrelerini yönetmek için kullanılan bir yapıdır.
Debian ortamında bu paketin derlenmesi için; **sudo apt install libreadline-dev libcap-dev libcap2-bin libpam0g-dev** komutları çalıştırıldıktan sonra derleme yapılmalıdır.

.. code-block:: bash
	
	#--------------------------------------------------------------------------------------------------------------------
	#!/usr/bin/env bash
	name="shadow"
	version="4.13"
	description="Password and account management tool suite with support for shadow files and PAM"
	source="https://github.com/shadow-maint/shadow/releases/download/$version/shadow-$version.tar.xz"
	depends="pam,libxcrypt,acl,attr"
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
		tempPath="${PATH}"
		export PATH=$PATH:/usr/sbin/
		cp -prvf $PACKAGEDIR/files/ $SOURCEDIR/
		autoreconf -fiv      
		./configure --prefix=/usr --libdir=/usr/lib64 --sysconfdir=/etc --bindir=/usr/bin --sbindir=/usr/sbin \
		--disable-account-tools-setuid --without-sssd --with-fcaps --with-libpam --without-group-name-max-length \
		--with-bcrypt --with-yescrypt --without-selinux
	}

	build(){
	    make
	}
	package(){
		make install DESTDIR=$DESTDIR
		mkdir -p "${DESTDIR}/etc" "${DESTDIR}/etc/default/"
		sed -i "/.*selinux.*/d" ${DESTDIR}/etc/pam.d/*
		install -vDm 600 $SOURCEDIR/files/useradd.defaults "${DESTDIR}/etc/default/useradd"
		install -vDm 600 $SOURCEDIR/files/system-auth "${DESTDIR}/etc/pam.d/system-auth"
		if [ ! -f ${DESTDIR}/etc/group ] ; then install -vDm 600 $SOURCEDIR/files/group "${DESTDIR}/etc/group"; fi
		if [ ! -f ${DESTDIR}/etc/shadow ] ; then echo "root:*::0:::::" > ${DESTDIR}/etc/shadow; fi
		chmod 600 ${DESTDIR}/etc/shadow
		chmod 644 ${DESTDIR}/etc/group
		chown root ${DESTDIR}/etc/group  ${DESTDIR}/etc/shadow
		chgrp root ${DESTDIR}/etc/group  ${DESTDIR}/etc/shadow

		if [ ! -f "${DESTDIR}/etc/passwd" ]; then echo -e "root:x:0:0:root:/root:/bin/sh">${DESTDIR}/etc/passwd; fi
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
		export PATH="$tempPath"
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/shadow/files.tar>`_ **Paket Derleme Yöntemi** konusunda anlatıldığı gibi derleme işlemini yapınız.
  
.. raw:: pdf

   PageBreak




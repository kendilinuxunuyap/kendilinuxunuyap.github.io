shadow
++++++

Shadow paketi, Linux işletim sistemlerinde kullanıcı hesaplarının şifrelerini güvenli bir şekilde saklamak için kullanılan bir mekanizmadır. Bu paket, kullanıcı bilgilerini ve şifrelerini içeren dosyaların yönetiminde önemli bir rol oynamaktadır.

Derleme
--------


Debian ortamında bu paketin derlenmesi için;
- **sudo apt install libreadline-dev** 
- **sudo apt install libcap-dev**
- sudo cp /sbin/capsh /bin/
- sudo cp /sbin/getcap /bin/
- sudo cp /sbin/getpcaps /bin/
- sudo cp /sbin/setcap /bin/

komutuyla paketin kurulması gerekmektedir.

shadow derlerken **setcap** hatasıyla debian ortamında karşılaşabilirsiniz. Bunu çözmek için shadow paketini sudo ile derleyebilirsiniz. Bu şekilde sistem için tehlikeli olabilir. Bunun yerine **sudo cp /sbin/setcap /bin/** komutuyla kopyalayıp derleyebilirsiniz.


.. code-block:: shell
	
	#!/usr/bin/env bash
	name="shadow"
	version="4.13"
	description="Password and account management tool suite with support for shadow files and PAM"
	source="https://github.com/shadow-maint/shadow/releases/download/$version/shadow-$version.tar.xz"
	depends="pam,libxcrypt,acl,attr"
	group="sys.apps"
	ROOTBUILDDIR="$HOME/distro/build"
	BUILDDIR="$HOME/distro/build/build-${name}-${version}" #Derleme yapılan dizin
	DESTDIR="$HOME/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd)
	SOURCEDIR="$HOME/distro/build/${name}-${version}"
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
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $BUILDDIR
	}

	setup(){
		cp -prvf $PACKAGEDIR/files/ $SOURCEDIR/
		cd $SOURCEDIR
		autoreconf -fiv      
		./configure --prefix=/usr \
		--libdir=/usr/lib64 \
		--sysconfdir=/etc \
		--bindir=/usr/bin \
		--sbindir=/usr/sbin \
		--disable-account-tools-setuid \
		--without-sssd \
		--with-fcaps \
		--with-libpam \
		--without-group-name-max-length \
		--with-bcrypt \
		--with-yescrypt \
		--without-selinux
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    # remove selinux stuff
	    mkdir -p "${DESTDIR}/etc/default/"
	    sed -i "/.*selinux.*/d" ${DESTDIR}/etc/pam.d/*
	    install -vDm 600 $SOURCEDIR/files/useradd.defaults "${DESTDIR}/etc/default/useradd"
	    install -vDm 600 $SOURCEDIR/files/system-auth "${DESTDIR}/etc/pam.d/system-auth"
	    if [ ! -f ${DESTDIR}/etc/group ] ; then
		echo -e "root:x:0:">${DESTDIR}/etc/group
		echo -e "users:x:2:">>${DESTDIR}/etc/group
		echo -e "tty:x:5:">>${DESTDIR}/etc/group
		echo -e "disk:x:6:">>${DESTDIR}/etc/group
		echo -e "dialout:x:20:">>${DESTDIR}/etc/group
		echo -e "cdrom:x:24:">>${DESTDIR}/etc/group
		echo -e "audio:x:29:">>${DESTDIR}/etc/group
		echo -e "video:x:44:">>${DESTDIR}/etc/group
		echo -e "wheel:x:120:">>${DESTDIR}/etc/group
		echo -e "plugdev:x:121:">>${DESTDIR}/etc/group
		echo -e "netdev:x:122:">>${DESTDIR}/etc/group
		echo -e "dip:x:123:">>${DESTDIR}/etc/group

		    chmod 644 ${DESTDIR}/etc/group
		    chown root ${DESTDIR}/etc/group
		    chgrp root ${DESTDIR}/etc/group
		    else
		    chmod 644 ${DESTDIR}/etc/group
		    chown root ${DESTDIR}/etc/group
		    chgrp root ${DESTDIR}/etc/group
		fi

		if [ ! -f ${DESTDIR}/etc/shadow ] ; then
		    echo "root:*::0:::::" > ${DESTDIR}/etc/shadow
		    chmod 600 ${DESTDIR}/etc/shadow
		    chown root ${DESTDIR}/etc/shadow
		    chgrp root ${DESTDIR}/etc/shadow
		    else
		    chmod 600 ${DESTDIR}/etc/shadow
		    chown root ${DESTDIR}/etc/shadow
		    chgrp root ${DESTDIR}/etc/shadow
		fi


		if [ ! -f "${DESTDIR}/etc/passwd" ]; then
			echo -e "root:x:0:0:root:/root:/bin/sh">${DESTDIR}/etc/passwd
		fi

	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/shadow/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **shadow** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.

Paket adında(shadow) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak




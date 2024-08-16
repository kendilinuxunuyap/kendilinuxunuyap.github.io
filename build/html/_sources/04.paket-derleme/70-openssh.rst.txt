openssh
+++++++

OpenSSH, Secure Shell (SSH) protokolünü uygulayan bir yazılım paketidir ve genellikle Linux ve Unix tabanlı sistemlerde kullanılır. Bu paket, kullanıcıların uzak sunuculara güvenli bir şekilde bağlanmalarını, dosya transferi yapmalarını ve uzaktan komut çalıştırmalarını sağlar. OpenSSH, veri iletimini şifreleyerek, ağ üzerinden yapılan iletişimlerin güvenliğini artırır.

OpenSSH, genellikle ssh, scp, sftp ve sshd gibi araçları içerir. 

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="openssh"
	version="9.6p1"
	description="OpenBSD ssh server & client"
	source="https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-$version.tar.gz"
	depends="zlib,libxcrypt,openssl,libmd,libssh"
		
	group="net.misc"
	BUILDDIR="$HOME/distro/build" #Derleme yapılan dizin
	DESTDIR="$HOME/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd)
	SOURCEDIR="$BUILDDIR/${name}-${version}"

	initsetup(){
		mkdir -p  $BUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $BUILDDIR/* #içeriği temizleniyor
		cd $BUILDDIR #dizinine geçiyoruz
		wget ${source}
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		mv $director ${name}-${version};
	}

	setup(){
		cp -prfv $PACKAGEDIR/files/sshd.initd $BUILDDIR/
		cp -prfv $PACKAGEDIR/files/sshd.confd $BUILDDIR/
		cd $BUILDDIR
	    ../${name}-${version}/configure --prefix=/usr \
		--libdir=/usr/lib64/ \
		--sysconfdir=/etc/ssh \
		--without-pam \
		--disable-strip \
		--with-ssl-engine \
		--with-privsep-user=nobody \
		--with-pid-dir=/run \
		--with-default-path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
	}

	build(){
	    make
	}

	package(){
	cd $BUILDDIR
	    make install DESTDIR=$DESTDIR
	    mkdir -p "$DESTDIR"/etc/{passwd,group,sysconf,init,conf}.d
	    install -m755 -D sshd.initd "$DESTDIR"/etc/init.d/sshd
	    install -m755 -D sshd.confd "$DESTDIR"/etc/conf.d/sshd
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/openssh/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **openssh** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.

Paket adında(openssh) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	./build

Paketler derlendikten sonra files dizini içindeki postinstall scriptinin çalıştırılması gerekmektedir.
Bu dosya "$HOME/distro/rootfs" konumunda chroot ile çalıştırılmalıdır.

.. raw:: pdf

   PageBreak




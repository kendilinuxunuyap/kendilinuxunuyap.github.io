openssl
+++++++

coreutils için gerekli olan paket.

OpenSSL, açık kaynaklı bir kriptografik kütüphanedir ve genellikle ağ iletişimi güvenliği için kullanılır. SSL/TLS protokollerini uygulamak, şifreleme, dijital sertifikalar oluşturma ve doğrulama gibi işlemleri gerçekleştirmek için yaygın olarak tercih edilir. Özellikle web sunucuları, e-posta sunucuları ve diğer ağ uygulamaları için güvenli iletişim sağlamak amacıyla kullanılır. OpenSSL, Linux sistemlerinde sıkça kullanılan bir araçtır ve güvenli veri iletimi için önemli bir rol oynar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="3.2.0"
	name="openssl"
	depends="glibc,zlib"
	description="opnssl"
	source="https://www.openssl.org/source/${name}-${version}.tar.gz"
	groups="dev.libs"
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
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $BUILDDIR
	}

	setup()
	{
		cp -prfv $PACKAGEDIR/files/update-certdata.sh $BUILDDIR/update-certdata
		wget -O $BUILDDIR/cacert.pem https://curl.haxx.se/ca/cacert.pem
		$SOURCEDIR/config --prefix=/usr  \
		 --openssldir=/etc/ssl \
		 --libdir=/usr/lib64 \
		 shared linux-x86_64
	}
	build()
	{
		make depend
		make -j5 #-C $DESTDIR all
	}
	package()
	{
		mkdir -p "${DESTDIR}/etc/ssl/" "${DESTDIR}/sbin/"
		install $BUILDDIR/update-certdata "${DESTDIR}/sbin/update-certdata"
		install $BUILDDIR/cacert.pem "${DESTDIR}/etc/ssl/cert.pem"
		make DESTDIR="${DESTDIR}" \
		install_sw \
		install_ssldirs \
		install_man_docs  $jobs
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/openssl/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **openssl** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.

Paket adında(openssl) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak




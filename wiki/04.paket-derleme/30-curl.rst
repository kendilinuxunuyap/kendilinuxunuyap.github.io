curl
++++

Curl, "Client URL" ifadesinin kısaltmasıdır ve internet protokolleri üzerinden veri transferi yapabilen bir komut satırı aracıdır. Özellikle HTTP, HTTPS, FTP gibi protokollerle çalışarak, web sunucularına istek göndermek ve yanıt almak için kullanılır. Linux sistemlerinde yaygın olarak kullanılan bu araç, geliştiricilere ve sistem yöneticilerine API'lerle etkileşim kurma, dosya indirme veya yükleme gibi işlemleri kolaylaştırır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="8.4.0"
	name="curl"
	depends="glibc,acl,openssl"
	description="shell ve network copy"
	source="https://curl.se/download/${name}-${version}.tar.xz"
	groups="net.misc"
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
		    opts=(
		    --prefix=/usr
		    --libdir=/usr/lib64
		    --disable-ldap
		    --disable-ldaps
		    --disable-versioned-symbols
		    --enable-doh
		    --enable-ftp
		    --enable-ipv6
		    --with-ca-path=/etc/ssl/certs
		    --with-ca-bundle=/etc/ssl/cert.pem
		    --enable-threaded-resolverl
		    --enable-websockets
		    --without-libidn2
		    --without-libpsl
		    --without-nghttp2
		     
		    #$(use_opt zstd --with-zstd --without-zstd)
		    #$(use_opt zlib --with-zlib --without-zlib)
		    #$(use_opt brotli --with-brotli --without-brotli)
		    #$(use_opt libssh --with-libssh --without-libssh)
		    #$(use_opt libidn2 --with-libidn2 --without-libidn2)
		)

		    cd $SOURCEDIR
		    ./configure ${opts[@]} --with-openssl


	}
	build()
	{
		    make
	}
	package()
	{
		    make install DESTDIR=$DESTDIR
		    cd $DESTDIR
		    for ver in 3 4.0.0 4.1.0 4.2.0 4.3.0 4.4.0 4.5.0 4.6.0 4.7.0; do
		    ln -s $DESTDIR/lib/libcurl.so.4.8.0 $DESTDIR/lib/libcurl.so.${ver}
		done
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Paket adında(curl) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak





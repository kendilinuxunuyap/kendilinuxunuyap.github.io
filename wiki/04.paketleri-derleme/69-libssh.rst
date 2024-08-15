libssh
++++++

libssh, SSH protokolünü uygulamak için kullanılan açık kaynaklı bir C kütüphanesidir. Bu kütüphane, geliştiricilere güvenli bir şekilde veri iletimi, uzaktan erişim ve dosya transferi gibi işlevleri gerçekleştirme imkanı tanır. libssh, hem istemci hem de sunucu tarafında kullanılabilir ve çoklu platform desteği sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="libssh"
	version="0.10.4"
	description="C library implenting the SSHv2 protocol on client and server side"
	source=("https://www.libssh.org/files/0.10/libssh-${version}.tar.xz")
	group="net.libs"
	depends="openssl,zlib"
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


	setup() {
	    cmake -S $SOURCEDIR -B $BUILDDIR \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib64 \
		-DWITH_EXAMPLES=NO \
		-DBUILD_SHARED_LIBS=YES \
		-DBUILD_STATIC_LIB=YES \
		-DWITH_NACL=OFF \
		-DWITH_GCRYPT=OFF \
		-DWITH_MBEDTLS=OFF \
		-DWITH_GSSAPI=OFF \
		-DWITH_PCAP=OFF \
		-DWITH_SERVER=ON \
		-DWITH_SFTP=ON \
		-DWITH_ZLIB=ON
	}
	build() {
	    make -C $BUILDDIR
	}
	package() {
	    make -C $BUILDDIR install DESTDIR=$DESTDIR
	    install $BUILDDIR/src/libssh.a ${DESTDIR}/usr/lib64/
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(ncurses) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak




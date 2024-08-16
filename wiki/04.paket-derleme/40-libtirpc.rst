libtirpc
++++++++

libtirpc, UNIX sistemlerinde yaygın olarak kullanılan bir RPC kütüphanesidir. Bu kütüphane, istemci ve sunucu uygulamaları arasında uzaktan prosedür çağrıları yapmayı mümkün kılar. libtirpc, özellikle dağıtık sistemlerde veri paylaşımını ve iletişimi kolaylaştırmak amacıyla geliştirilmiştir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="libtirpc"
	version="1.3.3"
	description="Transport Independent RPC library (SunRPC replacement)"
	source="https://downloads.sourceforge.net/libtirpc/libtirpc-$version.tar.bz2"
	depends=""
	group="net.libs"
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
		cd $SOURCEDIR
	    ./configure --prefix=/usr \
		--libdir=/usr/lib64 \
		--sysconfdir=/etc \
		--disable-gssapi
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libtirpc) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak




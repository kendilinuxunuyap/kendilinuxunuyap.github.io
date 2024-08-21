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




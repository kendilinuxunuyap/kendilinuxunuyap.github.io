zlib
++++

Zlib, veri sıkıştırma ve açma işlemleri için geliştirilmiş açık kaynaklı bir kütüphanedir. Genellikle, Gzip ve PNG gibi formatların temelini oluşturur. Zlib, Deflate algoritmasını kullanarak verileri sıkıştırır ve bu sayede dosya boyutunu önemli ölçüde azaltır. Bu özellik, özellikle ağ üzerinden veri transferi sırasında bant genişliğinden tasarruf sağlamak için oldukça faydalıdır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.3"
	name="zlib"
	depends="glibc,readline,ncurses,flex"
	description="Compression library implementing the deflate compression method found in gzip and PKZIP"
	source="https://github.com/madler/zlib/archive/refs/tags/v$version.tar.gz"
	groups="app.arch"
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

	setup()
	{
		cd $SOURCEDIR
		./configure --prefix=/usr
	}
	build()
	{
		make 
	}
	package()
	{
		make install pkgconfigdir="/usr/lib64/pkgconfig" DESTDIR=$DESTDIR
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(zlib) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak





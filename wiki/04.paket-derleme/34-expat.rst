expat
+++++

Expat, özellikle C dilinde geliştirilmiş bir XML ayrıştırma kütüphanesidir. Bu kütüphane, XML belgelerini okuma ve işleme süreçlerini kolaylaştırmak amacıyla tasarlanmıştır. Expat, olay tabanlı bir ayrıştırma modeli kullanarak, XML belgelerinin içeriğini parçalara ayırır ve bu parçaları işlemek için geliştiricilere bir dizi geri çağırma (callback) fonksiyonu sunar. Bu sayede, büyük XML dosyaları ile çalışırken bellek verimliliği sağlanır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="expat"
	version="2.6.2"
	vrsn="2_6_2"
	description="An XML parser library"
	#source="https://github.com/libexpat/libexpat/archive/refs/tags/R_${version}.tar.gz"
	source="https://github.com/libexpat/libexpat/releases/download/R_${vrsn}/expat-${version}.tar.bz2"
	depends=""
	builddepend=""
	group="dev.libs"
	
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
		#cd ../$name-$version/$name
	    cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib64 \
		-DCMAKE_BUILD_TYPE=None \
		-DEXPAT_BUILD_DOCS=false \
		-W no-dev \
		-B $BUILDDIR
	}

	build(){
	    make -C $BUILDDIR
	}

	package(){
	    make DESTDIR="$DESTDIR" install -C $BUILDDIR
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(expat) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak




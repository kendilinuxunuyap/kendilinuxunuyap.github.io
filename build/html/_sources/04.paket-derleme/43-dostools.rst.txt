dostools
++++++++

Dostools, Linux işletim sistemlerinde kullanılan bir dizi araç ve komut setidir. Bu araçlar, sistem yöneticilerine ve geliştiricilere, sistem yönetimi, dosya işlemleri ve ağ yönetimi gibi çeşitli görevleri daha verimli bir şekilde gerçekleştirme imkanı sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="4.2"
	name="dosfstools"
	depends="glibc"
	description="DOS filesystem tools - provides mkdosfs, mkfs.msdos, mkfs.vfat"
	source="https://github.com/dosfstools/dosfstools/archive/refs/tags/v$version.tar.gz"
	groups="sys.block"
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
		./autogen.sh
		./configure --prefix=/usr \
		    --libdir=/usr/lib64/ \
		    --enable-compat-symlinks
		
	}
	build()
	{
	cd $SOURCEDIR
		make 
	}
	package()
	{
	cd $SOURCEDIR
		make install DESTDIR=$DESTDIR
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(dostools) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak





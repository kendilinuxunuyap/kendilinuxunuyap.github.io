nano
++++

Nano, terminal tabanlı bir metin düzenleyici olup, GNU projesinin bir parçasıdır. Kullanıcıların metin dosyalarını kolayca oluşturmasına, düzenlemesine ve kaydetmesine olanak tanır. Nano, vi veya emacs gibi daha karmaşık metin düzenleyicilere göre daha basit bir kullanım sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="7.2"
	name="nano"
	depends="glibc,readline,ncurses,file"
	description="şıkıştırma kütüphanesi"
	source="https://www.nano-editor.org/dist/v7/${name}-${version}.tar.xz"
	groups="app.editor"
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
		make install DESTDIR=$DESTDIR
		cd $DESTDIR
		mkdir -p $DESTDIR/lib
		echo "INPUT(-lncursesw)" > $DESTDIR/lib/libncurses.so
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(nano) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak





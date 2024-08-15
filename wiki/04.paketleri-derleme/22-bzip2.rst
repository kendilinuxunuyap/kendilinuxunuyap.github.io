bzip2
+++++

bzip2, dosyaları sıkıştırmak için kullanılan bir yazılımdır ve genellikle Unix tabanlı sistemlerde tercih edilmektedir. Bu araç, dosyaların boyutunu önemli ölçüde azaltarak depolama alanından tasarruf sağlar ve veri transferini hızlandırır. bzip2, Lempel-Ziv ve Burrows-Wheeler algoritmalarını kullanarak yüksek sıkıştırma oranları suna

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.0.8"
	name="bzip2"
	depends="glibc,readline,ncurses"
	description="şıkıştırma kütüphanesi"
	source="https://sourceware.org/pub/bzip2/${name}-${version}.tar.gz"
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

	# Generate relative symlinks
		sed -i \
			-e 's:\$(PREFIX)/man:\$(PREFIX)/share/man:g' \
			-e 's:ln -s -f $(PREFIX)/bin/:ln -s :' \
			Makefile

		# fixup broken version stuff
		sed -i \
			-e "s:1\.0\.4:$version:" \
			bzip2.1 bzip2.txt Makefile-libbz2_so manual.*
			
		
	}
	build()
	{
		 make -f Makefile-libbz2_so all
		 make all
	}
	package()
	{
		cd $SOURCEDIR
		make PREFIX="$DESTDIR"/usr install
		install -D libbz2.so.$version "$DESTDIR"/usr/lib/libbz2.so.$pkgver
		ln -s libbz2.so.$version "$DESTDIR"/usr/lib/libbz2.so
		ln -s libbz2.so.$version "$DESTDIR"/usr/lib/libbz2.so.${version%%.*}

		mkdir -p "$DESTDIR"/usr/lib/pkgconfig/
		sed "s|@VERSION@|$version|" $SOURCEDIR/bzip2.pc.in > "$DESTDIR"/usr/lib/pkgconfig/bzip2.pc
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





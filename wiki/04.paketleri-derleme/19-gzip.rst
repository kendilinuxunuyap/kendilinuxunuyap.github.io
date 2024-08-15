gzip
++++

Gzip, "GNU zip" ifadesinin kısaltmasıdır ve dosyaları sıkıştırmak için kullanılan bir yazılımdır. Temel amacı, dosya boyutunu azaltarak depolama alanından tasarruf sağlamak ve veri iletimini hızlandırmaktır. Gzip, genellikle metin dosyaları gibi tekrarlayan verilerde yüksek sıkıştırma oranları sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.13"
	name="gzip"
	depends=""
	description="Standard GNU compressor"
	source="https://ftp.gnu.org/gnu/gzip/${name}-${version}.zip"
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
		export DEFS="NO_ASM"
		cd $SOURCEDIR
		autoreconf -fvi
		./configure --prefix=/usr \
		--libdir=/usr/lib64/
	}
	build()
	{
		make 
	}
	package()
	{
		make install DESTDIR=$DESTDIR
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(gzip) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak





e2fsprogs
+++++++++

e2fsprogs, Linux tabanlı sistemlerde yaygın olarak kullanılan bir dosya sistemi yönetim aracıdır. Bu paket, ext2, ext3 ve ext4 dosya sistemleri üzerinde çeşitli işlemler yapabilmek için gerekli olan araçları içerir. Örneğin, dosya sistemi oluşturma, onarma, kontrol etme ve boyutlandırma gibi işlemler e2fsprogs ile gerçekleştirilebilir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.47.0"
	name="e2fsprogs"
	depends="glibc,readline,ncurses"
	description="modül ve sistem iletişimi sağlayan paket"
	source="https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v${version}/${name}-${version}.tar.xz"
	groups="sys.fs"
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
		./configure --sbindir=/usr/bin \
		    --libdir=/usr/lib64/  
	}
	build()
	{
		make 
	}
	package()
	{
		make install DESTDIR=$DESTDIR
		rm -rf $DESTDIR/usr/share/man/man8/fsck.8
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(e2fsprogs) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak





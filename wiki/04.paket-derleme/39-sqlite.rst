sqlite
++++++

SQLite, C dilinde yazılmış ve gömülü bir veritabanı motoru olarak bilinen bir yazılımdır. Özellikle hafifliği ve taşınabilirliği ile dikkat çeker. SQLite, bir dosya sistemi üzerinde çalışarak verileri depolar ve bu sayede herhangi bir sunucuya ihtiyaç duymadan uygulama içinde kullanılabilir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="sqlite"
	version="3.45.2"
	description="A C library that implements an SQL database engine"
	srcver="3450200"
	source="https://www.sqlite.org/2024/sqlite-autoconf-$srcver.tar.gz"
	depends="zlib,readline"
	group="dev.db"
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
	    #cd $name-autoconf-$srcver
	    cd $SOURCEDIR
	    ./configure --prefix=/usr \
		--libdir=/usr/lib64 \
		--enable-fts3 \
		--enable-fts4 \
		--enable-fts5 \
		--enable-rtree \
		CPPFLAGS="-DSQLITE_ENABLE_FTS3=1            \
		          -DSQLITE_ENABLE_FTS4=1            \
		          -DSQLITE_ENABLE_COLUMN_METADATA=1 \
		          -DSQLITE_ENABLE_UNLOCK_NOTIFY=1   \
		          -DSQLITE_ENABLE_DBSTAT_VTAB=1     \
		          -DSQLITE_SECURE_DELETE=1          \
		          -DSQLITE_ENABLE_FTS3_TOKENIZER=1"
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


Paket adında(sqlite) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak




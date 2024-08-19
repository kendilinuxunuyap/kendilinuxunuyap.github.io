dialog
++++++

Dialog paketi, terminal tabanlı uygulamalar için kullanıcı ile etkileşim kurmayı kolaylaştıran bir araçtır. Bu paket, kullanıcıdan bilgi almak veya kullanıcıya bilgi sunmak amacıyla çeşitli diyalog kutuları oluşturmanıza olanak tanır. Örneğin, metin kutuları, onay kutuları, seçim kutuları gibi farklı türde diyaloglar oluşturabilirsiniz.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.3-20230209"
	name="dialog"
	depends="glibc,readline,ncurses"
	description="shell box kütüphanesi"
	source="https://invisible-island.net/archives/dialog/${name}-${version}.tgz"
	groups="sys.apps"
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
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $BUILDDIR
	}

	setup()
	{
		../${name}-${version}/configure --prefix=/usr \
		 --libdir=/lib64/ \
		 --with-ncursesw
	    # change default color blue to red
	    cd $SOURCEDIR
	  #  sed -i "s/COLOR_BLUE/COLOR_RED/g" dlg_colors.h
	  #  sed -i "s/COLOR_CYAN/COLOR_MAGENTA/g" dlg_colors.h
		
	}
	build()
	{
		cd $BUILDDIR
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


Paket adında(dialog) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak





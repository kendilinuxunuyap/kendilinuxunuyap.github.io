efibootmgr
++++++++++

efibootmgr, UEFI (Unified Extensible Firmware Interface) tabanlı sistemlerde önyükleme yöneticisi olarak işlev gören bir Linux aracıdır. Bu paket, UEFI önyükleme seçeneklerini yönetmek için kullanılır ve sistemin önyükleme sırasını, önyükleme girişlerini ve diğer ilgili ayarları düzenlemeye olanak tanır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="efibootmgr"
	version="18"
	description="Linux user-space application to modify the Intel Extensible Firmware Interface (EFI) Boot Manager."
	source="https://github.com/rhboot/efibootmgr/archive/refs/tags/$version.tar.gz"
	depends="efivar,popt"
	builddepend=""
	group="sys.boot"
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

	setup(){
		echo ""
	}

	build(){
		cd $SOURCEDIR
	    make sbindir=/usr/bin EFIDIR=/boot/efi PCDIR=/usr/lib64/pkgconfig
	}

	package(){
		EFIDIR="/boot/efi" sbindir=/usr/bin make DESTDIR="$DESTDIR" install
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(efibootmgr) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak




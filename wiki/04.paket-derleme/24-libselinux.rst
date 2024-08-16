libselinux
++++++++++

libselinux paketi, Linux işletim sistemlerinde güvenlik politikalarının uygulanmasına yardımcı olan bir kütüphanedir. Bu kütüphane, SELinux (Security-Enhanced Linux) mekanizmasının temel bileşenlerinden biridir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="3.6"
	name="libselinux"
	depends=""
	description="lib"
	source="https://github.com/SELinuxProject/selinux/releases/download/3.6/${name}-${version}.tar.gz"
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
	      echo ""
	}
	build()
	{
		cp -prvf $PACKAGEDIR/files/lfs64.patch /tmp/bps/build/
		cd $SOURCEDIR
		patch -Np1 -i ../lfs64.patch 
		make FTS_LDLIBS="-lfts"
	}
	package()
	{
		cd $SOURCEDIR
		make install DESTDIR=$DESTDIR
		#mv  ${DESTDIR}/lib  ${DESTDIR}/lib64
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/libselinux/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **libselinux** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(libselinux) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak





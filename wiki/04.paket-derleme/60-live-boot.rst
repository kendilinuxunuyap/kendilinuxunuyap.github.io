live-boot
+++++++++

Live-boot paketi, kullanıcıların bir işletim sistemini kurmadan önce denemelerine olanak tanıyan bir araçtır. Genellikle bir USB bellek veya CD/DVD gibi taşınabilir bir ortamda bulunur. Bu paket, sistemin kurulu olduğu ortamdan bağımsız olarak çalışır ve kullanıcıların işletim sisteminin özelliklerini, performansını ve uyumluluğunu test etmelerine imkan tanır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1230131"
	name="live-boot"
	depends="glibc,acl,openssl"
	description="shell ve network copy"
	source="https://salsa.debian.org/live-team/live-boot/-/archive/debian/1%2520230131/live-boot-debian-1%2520230131.tar.gz"
	groups="sys.kernel"
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
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
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
		echo "test"
		cd $SOURCEDIR
	}
	build()
	{
		make 
	}
	package()
	{
		make install DESTDIR=$DESTDIR
		sed -i "s/copy_exec \/bin\/mount \/bin/copy_exec \/usr\/bin\/mount \/bin/g" $DESTDIR/usr/share/initramfs-tools/hooks/live
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(live-boot) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak






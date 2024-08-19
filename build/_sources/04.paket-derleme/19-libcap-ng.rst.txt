libcap-ng
+++++++++

libcap-ng paketi, Linux işletim sistemlerinde yetki yönetimi ve güvenlik uygulamaları için kullanılan bir kütüphanedir. Bu kütüphane, kullanıcıların ve süreçlerin sahip olduğu yetkileri daha esnek bir şekilde yönetmelerine olanak tanır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="0.8.3"
	name="libcap-ng"
	depends="glibc,acl,openssl,libtool"
	description="shell ve network copy"
	source="https://github.com/stevegrubb/libcap-ng/archive/refs/tags/v${version}.zip"
	groups="sys.libs"
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
		$SOURCEDIR/autoreconf -fvi
		$SOURCEDIR/configure --prefix=/usr \
		  --libdir=/lib64 \
		  $(use_opt python --with-python --without-python) \
		$(use_opt python --with-python3 --without-python3)
		
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


Paket adında(libcap-ng) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak






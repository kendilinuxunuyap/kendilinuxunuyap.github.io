libsepol
++++++++

libsepol, SELinux'un güvenlik politikalarını oluşturmak, düzenlemek ve uygulamak için gerekli olan temel bir kütüphanedir. SELinux, Linux çekirdeği üzerinde güvenlik katmanları ekleyerek sistemin güvenliğini artırmayı amaçlar. libsepol, bu güvenlik politikalarının tanımlanması ve yönetilmesi için gerekli olan araçları sağlar.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;
- **sudo apt install flex** 
komutuyla paketin kurulması gerekmektedir.



.. code-block:: shell
	
	#!/usr/bin/env bash
	version="3.6"
	name="libsepol"
	depends=""
	description="lib"
	source="https://github.com/SELinuxProject/selinux/releases/download/3.6/${name}-${version}.tar.gz"
	groups="app.arch"
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

	      echo ""
	}
	build()
	{
		cd $SOURCEDIR
		make 
	}
	package()
	{
		cd $SOURCEDIR
		make install DESTDIR=$DESTDIR
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libsepol) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak





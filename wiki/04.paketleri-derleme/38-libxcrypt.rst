libxcrypt
+++++++++

libxcrypt, Unix benzeri sistemlerde parolaların şifrelenmesi için kullanılan bir kütüphanedir. Bu kütüphane, geleneksel crypt() fonksiyonunun yerini alarak daha güvenli ve esnek bir şifreleme yöntemi sunar. libxcrypt, çeşitli şifreleme algoritmalarını destekler; bunlar arasında bcrypt, scrypt ve Argon2 gibi modern algoritmalar bulunmaktadır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="libxcrypt"
	version="4.4.36"
	description="libxcrypt"
	source=("https://github.com/besser82/libxcrypt/releases/download/v4.4.36/libxcrypt-4.4.36.tar.xz")
	group=(net.libs)
	depends=""
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

	setup() {
	    ../${name}-${version}/configure --prefix=/usr \
		--libdir=/usr/lib64/ \
		--sbindir=/usr/bin 
		
	}
	build() {
	    make -C $BUILDDIR
	}
	package() {
	    make -C $BUILDDIR install DESTDIR=$DESTDIR
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libxcrypt) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak




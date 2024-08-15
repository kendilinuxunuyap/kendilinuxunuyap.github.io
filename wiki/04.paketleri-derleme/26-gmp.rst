gmp
+++

coreutils için gerekli olan paket.

GMP (GNU Multiple Precision Arithmetic Library), büyük sayılarla çalışmak için kullanılan bir kütüphanedir. Bu kütüphane, standart veri türlerinin sınırlarını aşarak çok büyük sayılarla işlem yapmamıza olanak tanır. Özellikle kriptografi, sayı teorisi ve bilimsel hesaplama gibi alanlarda büyük sayılarla çalışmak gerektiğinde GMP oldukça faydalıdır. Linux sistemlerinde, GMP kütüphanesini kullanarak büyük sayılarla işlem yapabilir ve hesaplamalarınızı daha hassas bir şekilde gerçekleştirebilirsiniz.

Derleme
-------

.. code-block:: shell
	
    #!/usr/bin/env bash
    version="6.3.0"
    name="gmp"
    depends="glibc"
    description="Library for arbitrary-precision arithmetic on different type of numbers"
    source="https://gmplib.org/download/gmp/${name}-${version}.tar.gz"
    groups="dev.libs"
    BUILDDIR="$HOME/distro/build" #Derleme yapılan dizin
    DESTDIR="$HOME/distro/rootfs" #paketin yükleneceği sistem konumu
    
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
        cd ${name}-${version} # Kaynak kodun içine giriliyor

        ./configure  --prefix=/usr \
            --libdir=/usr/lib64\
            --enable-cxx \
            --enable-fat
    }
    build(){
        make
    }
    package(){
        make install DESTDIR=$HOME/distro/rootfs
    }
    
    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
    setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Paket adında(ncurses) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build

   
.. raw:: pdf

   PageBreak


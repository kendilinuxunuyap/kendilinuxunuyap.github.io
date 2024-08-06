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
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf ${name}-${version}.tar.gz
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
    
.. raw:: pdf

   PageBreak


zlib
++++

Zlib paketi, sıkıştırma ve açma işlemleri için kullanılan bir kütüphanedir. Genellikle Linux işletim sistemi altında sıkıştırılmış verileri işlemek için kullanılır. Bu paket, verileri sıkıştırarak depolama alanı tasarrufu sağlar ve ağ üzerinde veri transferini hızlandırır. Ayrıca, zlib, dosya sıkıştırma ve açma işlemlerinde sıkça tercih edilen bir araçtır. Linux sistemlerinde sıkıştırılmış dosyalarla çalışırken sıklıkla karşınıza çıkacak bir kütüphanedir.

Derleme
-------

.. code-block:: shell

    #!/usr/bin/env bash
    version="1.3.1"
    name="zlib"
    depends="glibc,readline,ncurses,flex"
    description="Compression library implementing the deflate compression method found in gzip and PKZIP"
    source="https://zlib.net/current/${name}.tar.gz"
    groups="app.arch"
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf ${name}.tar.gz
    }
    setup(){
        cd ${name}-${version} # Kaynak kodun içine giriliyor
        ./configure --prefix=/usr
    }
    build(){
        make
    }
    package(){
        make install DESTDIR=$HOME/distro/rootfs
    }
    
    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı inidirir
    setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
    

.. raw:: pdf

   PageBreak


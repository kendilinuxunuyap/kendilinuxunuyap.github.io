zstd
++++

Zstandard (zstd), yüksek hızda sıkıştırma sağlayan bir veri sıkıştırma algoritması ve yazılım aracıdır. Linux işletim sistemi altında, zstd paketi, dosyaları sıkıştırmak ve sıkıştırılmış dosyaları açmak için kullanılır. Bu paket, veri depolama ve iletiminde yer kazanmak için sıkıştırma işlemlerinde yaygın olarak kullanılır. Özellikle yüksek performans gerektiren uygulamalarda tercih edilen bir sıkıştırma yöntemidir. Linux sistemlerinde zstd paketini kullanarak dosyaları sıkıştırabilir ve açabilirsiniz.

Derleme
--------

.. code-block:: shell
	
    #!/usr/bin/env bash
    version="1.5.5"
    name="zstd"
    depends="glibc,readline,ncurses"
    description="şıkıştırma kütüphanesi"
    source="https://github.com/facebook/zstd/archive/refs/tags/v${version}.tar.gz"
    groups="app.arch"
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf v${version}.tar.gz
    }
    setup(){
        cd ${name}-${version}
    }
    build(){
        make
    }
    package(){
        make prefix=/ install DESTDIR=$HOME/distro/rootfs
    }
    
    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı inidirir
    setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
    

.. raw:: pdf

   PageBreak



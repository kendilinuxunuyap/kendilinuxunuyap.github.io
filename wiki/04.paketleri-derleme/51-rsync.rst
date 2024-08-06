rsync
+++++

rsync, dosya ve dizinleri senkronize etmek için kullanılan bir komuttur. Bu komut, dosyalar arasındaki farkları belirleyerek sadece değişen kısımları kopyalar, böylece verimli bir şekilde dosya senkronizasyonu sağlar.

Derleme
-------

.. code-block:: shell
	
    #!/usr/bin/env bash
    version="3.2.7"
    name="rsync"
    depends="glibc,acl,openssl"
    description="shell ve network copy"
    source="https://download.samba.org/pub/rsync/src/${name}-${version}.tar.gz"
    groups="net.misc"
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf ${name}-${version}.tar.gz
    }
    setup(){
        cd ${name}-${version} # Kaynak kodun içine giriliyor
	
        ./configure --prefix=/ \
            --libdir=/lib/ \
            --with-included-popt \
            --with-included-zlib \
            --disable-xxhash \
            --disable-lz4
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


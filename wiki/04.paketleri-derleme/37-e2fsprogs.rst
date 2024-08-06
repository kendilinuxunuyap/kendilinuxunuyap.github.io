e2fsprogs
+++++++++

e2fsprogs paket sistemde mkfs.ext4, e2fsck, tune2fs vb sistem araçlarının yüklenmesini sağlar. Eğer sistemde bu sistem uygulamaları yoksa bu paketin yüklenmesi veya derlenmesi gerekmektedir.

Derleme
-------

.. code-block:: shell

    #!/usr/bin/env bash
    version="1.47.0"
    name="e2fsprogs"
    depends="glibc,readline,ncurses"
    description="Standart Ext2/3/4 dosya sistemi yardımcı programları"
    source="https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v${version}/${name}-${version}.tar.xz"
    groups="sys.fs"
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf ${name}-${version}.tar.xz
    }
    setup(){
        cd ${name}-${version} # Kaynak kodun içine giriliyor
        ./configure --sbindir=/usr/bin \
            --libdir=/usr/lib64/  
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
    

	make install DESTDIR=$HOME/distro/rootfs
	rm -rf $HOME/distro/rootfs/usr/share/man/man8/fsck.8

	
.. raw:: pdf

   PageBreak


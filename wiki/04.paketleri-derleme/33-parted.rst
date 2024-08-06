parted
++++++

GNU Parted bölüm tablolarını yönetir.  Bu, yeni işletim sistemleri için alan oluşturmak, disk kullanımını yeniden düzenlemek, verileri sabit disklere kopyalamak ve disk görüntüleme için kullanışlıdır.  Paket, libparted adlı bir kitaplığın yanı sıra komut dosyalarında da kullanılabilen parted komut satırı ön ucunu içerir.

Derleme
-------

.. code-block:: shell
	
    #!/usr/bin/env bash
    version="3.6"
    name="parted"
    depends="glibc"
    description="disks tools"
    source="https://ftp.gnu.org/gnu/parted/parted-${version}.tar.xz"
    groups="sys.block"
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf ${name}-${version}.tar.xz
    }
    setup(){
        cd ${name}-${version} # Kaynak kodun içine giriliyor
        ./configure --prefix=/usr \
            --libdir=/usr/lib64/ \
            --sbindir=/usr/bin \
            --disable-rpath \
            --disable-device-mapper
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




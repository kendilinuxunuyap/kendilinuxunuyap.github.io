coreutils
+++++++++

coreutils, Linux işletim sistemi için temel komutlar içeren bir pakettir. Bu komutlar, dosya oluşturma, düzenleme, silme, metin işleme, dizin yönetimi ve daha birçok işlemi gerçekleştirmek için kullanılır. Örneğin, ls komutuyla dizin içeriğini listelemek, cp komutuyla dosyaları kopyalamak veya rm komutuyla dosyaları silmek mümkündür. coreutils, Linux'un temel işlevselliğini sağlayan önemli bir bileşendir ve birçok Linux dağıtımında varsayılan olarak bulunur.

Derleme
-------

.. code-block:: shell
	
    #!/usr/bin/env bash
    version="9.5"
    name="coreutils"
    depends="acl,attr,gmp,libcap,openssl"
    description="The basic file, shell and text manipulation utilities of the GNU operating system"
    source="https://ftp.gnu.org/gnu/coreutils/${name}-${version}.tar.xz"
    groups="sys.apps"
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
            --libdir=/usr/lib64 \
            --libexecdir=/usr/libexec \
            --enable-largefile \
            --disable-selinux \
            --enable-single-binary=symlinks \
            --enable-no-install-program=groups,hostname,kill,uptime \
            --with-openssl

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


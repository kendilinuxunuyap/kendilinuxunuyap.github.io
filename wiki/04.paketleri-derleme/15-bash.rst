bash
++++

Bash, Linux ve diğer Unix tabanlı işletim sistemlerinde kullanılan bir kabuk programlama dilidir. Kullanıcıların komutlar vererek işletim sistemini yönetmelerine olanak tanır. Bash, kullanıcıların işlemleri otomatikleştirmesine ve betik dosyaları oluşturmasına olanak tanır. Özellikle sistem yöneticileri ve geliştiriciler arasında yaygın olarak kullanılan güçlü bir araçtır.

Derleme
--------

.. code-block:: shell
	
    #!/usr/bin/env bash
    version="5.2.21"
    name="bash"
    depends="glibc,readline,ncurses"
    description="GNU/Linux dağıtımında ön tanımlı kabuk"
    source="https://ftp.gnu.org/pub/gnu/bash/${name}-${version}.tar.gz"
    groups="app.shell"
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf ${name}-${version}.tar.gz
    }
    setup(){
        ${name}-${version}/configure --prefix=/usr --libdir=/usr/lib64 --bindir=/bin --with-curses --enable-readline --without-bash-malloc
    }
    build(){
        make
    }
    package(){
        make install DESTDIR=$HOME/distro/rootfs
        cd $HOME/distro/rootfs/bin
        ln -s bash sh
    }
    
    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
    setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


.. raw:: pdf

   PageBreak


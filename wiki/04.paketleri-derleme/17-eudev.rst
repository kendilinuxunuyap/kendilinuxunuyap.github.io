eudev
+++++

eudev, Linux işletim sistemlerinde donanım aygıtlarının tanınması ve yönetimi için kullanılan bir sistemdir. "eudev" terimi, "evdev" (evolutionary device) ve "udev" (userspace device) kelimelerinin birleşiminden oluşur.

eudev, Linux çekirdeği tarafından sağlanan "udev" hizmetinin bir alternatifidir. Udev, donanım aygıtlarının dinamik olarak tanınmasını ve yönetilmesini sağlar. Eudev ise, udev'in daha hafif ve basitleştirilmiş bir sürümüdür.

Derleme
-------

.. code-block:: shell

    #!/usr/bin/env bash
    version="3.2.14"
    name="eudev"
    depends="glibc,readline,ncurses,gperf"
    description="modül ve sistem iletişimi sağlayan paket"
    source="https://github.com/eudev-project/eudev/releases/download/v3.2.14/${name}-${version}.tar.gz"
    groups="sys.fs"
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf ${name}-${version}.tar.gz
    }
    setup(){
        ${name}-${version}/configure --prefix=/usr --libdir=/lib64 --sysconfdir=/etc --exec-prefix=/ --bindir=/sbin --with-rootprefix=/ --with-rootrundir=/run --with-rootlibexecdir=/lib64/udev --enable-split-usr --disable-selinux --enable-kmod
    }
    build(){
        make
    }
    package(){
        make install DESTDIR=$HOME/distro/rootfs
        cd $HOME/distro/rootfs
    	mkdir -p bin
    	cd bin
    	ln -s ../sbin/udevadm udevadm
    	ln -s ../sbin/udevd udevd 	
    }
    
    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı inidirir
    setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


.. raw:: pdf

   PageBreak


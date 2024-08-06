
util-linux
+++++++++++

util-linux, Linux işletim sistemi için bir dizi temel araç ve yardımcı programları içeren bir pakettir. Bu araçlar, Linux'un çeşitli yönlerini yönetmek ve kontrol etmek için kullanılır.

util-linux paketi, birçok farklı işlevi yerine getiren bir dizi komut satırı aracını içerir. Örneğin, disk bölümlerini oluşturmak ve yönetmek için kullanılan **fdisk**, disklerdeki dosya sistemlerini kontrol etmek için kullanılan **fsck**, sistem saatini ayarlamak , sistem performansını izlemek ve yönetmek için kullanılan araçları da içerir. Örneğin, **top** komutu, sistemdeki işlemci kullanımını izlemek için kullanılırken, **free** komutu, sistem belleği kullanımını gösterir. Tarih ve saat gösterimi için kullanılan **date** gibi araçlar bu paketin bir parçasıdır.


Derleme
--------

.. code-block:: shell

    #!/usr/bin/env bash
    version="2.39"
    name="util-linux"
    depends="libcap-ng,python,eudev,sqlite,eudev,cryptsetup,libxcrypt"
    description="Various useful Linux utilities"
    source="https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v${version}/${name}-${version}.tar.xz"
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
        	--bindir=/usr/bin \
        	--enable-shared \
        	--disable-su \
        	--disable-runuser \
        	--disable-chfn-chsh \
        	--disable-login \
        	--disable-sulogin \
        	--disable-makeinstall-chown \
        	--disable-makeinstall-setuid \
        	--disable-pylibmount \
        	--disable-raw \
        	--without-systemd \
        	--without-libuser \
        	--without-utempter \
        	--without-econf \
        	--enable-libmount \
        	--enable-libblkid 
    }
    build(){
        make
    }
    package(){
        make install DESTDIR=$HOME/distro/rootfs
        mkdir -p $HOME/distro/rootfs/lib64
        cp .libs/* -rf $HOME/distro/rootfs/usr/lib64/
        mkdir -p $HOME/distro/rootfs/bin
        cp $HOME/distro/rootfs/usr/lib64/cfdisk $HOME/distro/rootfs/usr/bin/
    }
    
    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı inidirir
    setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

	
.. raw:: pdf

   PageBreak


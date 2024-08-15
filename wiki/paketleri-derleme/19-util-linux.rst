
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
    BUILDDIR="$HOME/distro/build" #Derleme yapılan dizin
    DESTDIR="$HOME/distro/rootfs" #paketin yükleneceği sistem konumu
    
    initsetup(){
		mkdir -p  $BUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $BUILDDIR/* #içeriği temizleniyor
		cd $BUILDDIR #dizinine geçiyoruz
		wget ${source}
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		mv $director ${name}-${version};
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
    
    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
    setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Paket adında(ncurses) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build

	
.. raw:: pdf

   PageBreak


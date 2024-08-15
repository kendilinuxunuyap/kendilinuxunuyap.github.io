kmod
++++

Linux çekirdeği ile donanım arasındaki haberleşmeyi sağlayan kod parçalarıdır. Bu kod parçalarını kernele eklediğimizde kerneli tekrardan derlememiz gerekmektedir. Her kod ekleme ve her kod çıkartma işleminden sonra kernel derlemek ciddi bir iş yükü ve karmaşa oluşturacaktır.

Bu sorunların çözümü için modul vardır. Moduller kernele istediğimiz kod parçalarını ekleme ya da çıkartma yapabilmemizi sağlar. Bu işlemleri yaparken kernel derleme işlemi yapmamıza gerek yoktur.

kmod Komutları
--------------

- **lsmod :** yüklü modulleri listeler
- **insmod:** tek bir modul yükler
- **rmmod:** tek bir modul siler
- **modinfo:** modul hakkında bilgi alınır 
- **modprobe:** insmod komutunun aynısı fakat daha işlevseldir. module ait bağımlı olduğu modülleride yüklemektedir. modprobe  modülü /lib/modules/ dizini altında aramaktadır.
- **depmod:** /lib/modules dizinindeki modüllerin listesini günceller. Fakat başka bir dizinde ise basedir=konum şeklinde belirtmek gerekir. konum dizininde /lib/modules/** şeklinde kalsörler olmalıdır.

Derleme
-------

.. code-block:: shell
	
    #!/usr/bin/env bash
    version="32"
    name="kmod"
    depends="zlib,xz-utils"
    description="library and tools for managing linux kernel modules"
    source="https://mirrors.edge.kernel.org/pub/linux/utils/kernel/kmod/${name}-${version}.tar.xz"
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
            --libdir=/usr/lib64/ \
            --bindir=/bin \
            --with-rootlibdir=/lib \
            --with-zlib \
            --with-openssl
    }
    build(){
        make
    }
    package(){
        make install DESTDIR=$HOME/distro/rootfs
        cd $HOME/distro/rootfs/sbin
        for target in depmod insmod modinfo modprobe rmmod; do
          ln -sfv kmod $target
        done
        cd $HOME/distro/rootfs/bin
        ln -sfv ../sbin/kmod lsmod
    }
    
    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
    setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Paket adında(ncurses) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build



Test Edilmesi
-------------

Bir modül eklendiğinde veya çıkartıldığında modülle ilgili mesajları dmesg logları ile görebiliriz.

.. raw:: pdf

   PageBreak


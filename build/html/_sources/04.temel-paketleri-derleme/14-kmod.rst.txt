kmod
++++

Linux çekirdeği ile donanım arasındaki haberleşmeyi sağlayan kod parçalarıdır. Bu kod parçalarını kernele eklediğimizde kerneli tekrardan derlememiz gerekmektedir. Her kod ekleme ve her kod çıkartma işleminden sonra kernel derlemek ciddi bir iş yükü ve karmaşa oluşturacaktır.

Bu sorunların çözümü için modul vardır. Moduller kernele istediğimiz kod parçalarını ekleme ya da çıkartma yapabilmemizi sağlar. Bu işlemleri yaparken kernel derleme işlemi yapmamıza gerek yoktur.

kmod Derleme
------------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="31"
	name="kmod"
	mkdir -p $HOME/distro
	cd $HOME/distro
	rm -rf ${name}-${version}
	rm -rf build-${name}-${version}
	wget https://mirrors.edge.kernel.org/pub/linux/utils/kernel/kmod/${name}-${version}.tar.xz
	tar -xvf ${name}-${version}.tar.xz
	mkdir build-${name}-${version}
	cd build-${name}-${version}
	../${name}-${version}/configure --prefix=/ \
		--libdir=/lib/ \
		--bindir=/sbin
	# remove xsltproc dependency
	   rm -f man/Makefile
	   echo -e "all:\ninstall:" > man/Makefile
	   
	# derleme
	make 
		
	# derlenen paketin yüklenmesi ve ayarlamaların yapılması
	make install DESTDIR=$HOME/rootfs
	cd $HOME/rootfs/sbin
	for target in depmod insmod modinfo modprobe rmmod; do
	  ln -sfv kmod $target
	done
	cd $HOME/rootfs/bin
	ln -sfv ../sbin/kmod lsmod



Kmod'u derleme için hazırlayalım:
---------------------------------

.. code-block:: shell
	
	./configure --prefix=/usr          \
		    --sysconfdir=/etc      \
		    --with-openssl         \
		    --with-xz              \
		    --with-zstd            \
		    --with-zlib


İsteğe bağlı bağımlılıklar: - ZLIB kütüphanesi - LZMA kütüphanesi -ZSTD kütüphanesi - OPENSSL kütüphanesi (modinfo'da imza yönetimi) 
--with-openssl
Bu seçenek Kmod'un PKCS7 imzalarını işlemesini sağlar. çekirdek modülleri.
--with-xz, --with-zlib, Ve --with-zstd
Bu seçenekler Kmod'un sıkıştırılmış çekirdeği işlemesini sağlar modüller.

.. raw:: pdf

   PageBreak

Bu dokümanda  aşağıdaki şekilde yapılandırılacak;

.. code-block:: shell
	
	./configure --prefix=/ \
		--libdir=/lib/ \
		--bindir=/sbin

	# remove xsltproc dependency
	   rm -f man/Makefile
	   echo -e "all:\ninstall:" > man/Makefile
	   

kmod Araçlarını Oluşturma
-------------------------

.. code-block:: shell

	for target in depmod insmod modinfo modprobe rmmod; do
	  ln -sfv sbin/kmod sbin/$target
	done

	ln -sfv sbin/kmod bin/lsmod

veya kernele modul yükleme kaldırma için kmod aracı kullanılmaktadır. kmod aracı;

.. code-block:: shell

	ln -s sbin/kmod sbin/depmod
	ln -s sbin/kmod sbin/insmod
	ln -s sbin/kmod sbin/lsmod
	ln -s sbin/kmod sbin/modinfo
	ln -s sbin/kmod sbin/modprobe
	ln -s sbin/kmod sbin/rmmod

şeklinde sembolik bağlarla yeni araçlar oluşturulmuştur.

- **lsmod :** yüklü modulleri listeler
- **insmod:** tek bir modul yükler
- **rmmod:** tek bir modul siler
- **modinfo:** modul hakkında bilgi alınır 
- **modprobe:** insmod komutunun aynısı fakat daha işlevseldir. module ait bağımlı olduğu modülleride yüklemektedir. modprobe  modülü /lib/modules/ dizini altında aramaktadır.
- **depmod:** /lib/modules dizinindeki modüllerin listesini günceller. Fakat başka bir dizinde ise basedir=konum şeklinde belirtmek gerekir. konum dizininde /lib/modules/** şeklinde kalsörler olmalıdır.

kmod Test Edilmesi
------------------

Bir modül eklendiğinde veya çıkartıldığında modülle ilgili mesajları dmesg logları ile görebiliriz.

.. raw:: pdf

   PageBreak


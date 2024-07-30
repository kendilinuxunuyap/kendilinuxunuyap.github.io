
util-linux
+++++++++++

util-linux, Linux işletim sistemi için bir dizi temel araç ve yardımcı programları içeren bir pakettir. Bu araçlar, Linux'un çeşitli yönlerini yönetmek ve kontrol etmek için kullanılır.

util-linux paketi, birçok farklı işlevi yerine getiren bir dizi komut satırı aracını içerir. Örneğin, disk bölümlerini oluşturmak ve yönetmek için kullanılan **fdisk**, disklerdeki dosya sistemlerini kontrol etmek için kullanılan **fsck**, sistem saatini ayarlamak , sistem performansını izlemek ve yönetmek için kullanılan araçları da içerir. Örneğin, **top** komutu, sistemdeki işlemci kullanımını izlemek için kullanılırken, **free** komutu, sistem belleği kullanımını gösterir. Tarih ve saat gösterimi için kullanılan **date** gibi araçlar bu paketin bir parçasıdır.


Derleme
--------

.. code-block:: shell

	#https://www.linuxfromscratch.org/lfs/view/development/chapter07/util-linux.html
	version="2.39"
	name="util-linux"
	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz

	wget https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.39/${name}-${version}.tar.xz
	tar -xvf ${name}-${version}.tar.xz
	cd ${name}-${version} # Kaynak kodun içine giriliyor
	configure --prefix=/ \
		--libdir=/lib \
		--bindir=/bin \
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
	make 
	make install DESTDIR=$HOME/distro/rootfs
	mkdir -p $HOME/distro/rootfs/lib
	cp .libs/* -rf $HOME/distro/rootfs/lib/
	mkdir -p $HOME/distro/rootfs/bin
	cp $HOME/distro/rootfs/lib/cfdisk $HOME/distro/rootfs/bin/
	
.. raw:: pdf

   PageBreak


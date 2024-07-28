
util-linux
+++++++++++

util-linux, Linux işletim sistemi için bir dizi temel araç ve yardımcı programları içeren bir pakettir. Bu araçlar, Linux'un çeşitli yönlerini yönetmek ve kontrol etmek için kullanılır.

util-linux paketi, birçok farklı işlevi yerine getiren bir dizi komut satırı aracını içerir. Örneğin, disk bölümlerini oluşturmak ve yönetmek için kullanılan **fdisk**, disklerdeki dosya sistemlerini kontrol etmek için kullanılan **fsck**, sistem saatini ayarlamak , sistem performansını izlemek ve yönetmek için kullanılan araçları da içerir. Örneğin, **top** komutu, sistemdeki işlemci kullanımını izlemek için kullanılırken, **free** komutu, sistem belleği kullanımını gösterir. Tarih ve saat gösterimi için kullanılan **date** gibi araçlar bu paketin bir parçasıdır.


util-linux Derleme
------------------

.. code-block:: shell

	#https://www.linuxfromscratch.org/lfs/view/development/chapter07/util-linux.html
	version="2.39"
	name="util-linux"
	mkdir -p $HOME/distro
	cd $HOME/distro
	rm -rf ${name}-${version}
	rm -rf build-${name}-${version}
	wget https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.39/${name}-${version}.tar.xz
	tar -xvf ${name}-${version}.tar.xz
	#cd $HOME/distro/${name}-${version}
	#sed -i 's/\(link_all_deplibs\)=no/\1=unknown/'
	mkdir build-${name}-${version}
	cd build-${name}-${version}

	../${name}-${version}/configure --prefix=/ \
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
	make install DESTDIR=$HOME/rootfs
	mkdir -p $HOME/rootfs/lib
	cp .libs/* -rf $HOME/rootfs/lib/
	mkdir -p $HOME/rootfs/bin
	cp $HOME/rootfs/lib/cfdisk $HOME/rootfs/bin/
	
.. raw:: pdf

   PageBreak


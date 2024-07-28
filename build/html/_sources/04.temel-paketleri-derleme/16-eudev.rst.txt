eudev
+++++

eudev, Linux işletim sistemlerinde donanım aygıtlarının tanınması ve yönetimi için kullanılan bir sistemdir. "eudev" terimi, "evdev" (evolutionary device) ve "udev" (userspace device) kelimelerinin birleşiminden oluşur.

eudev, Linux çekirdeği tarafından sağlanan "udev" hizmetinin bir alternatifidir. Udev, donanım aygıtlarının dinamik olarak tanınmasını ve yönetilmesini sağlar. Eudev ise, udev'in daha hafif ve basitleştirilmiş bir sürümüdür.

Özetlemek gerekirse, eudev Linux işletim sistemlerinde donanım aygıtlarının tanınması ve yönetimi için kullanılan bir sistemdir. Donanım aygıtlarının otomatik olarak algılanması ve ilgili sürücülerin yüklenmesi gibi işlemleri gerçekleştirir. Bu sayede, kullanıcılar donanım aygıtlarını kolayca kullanabilir ve yönetebilir.

eudev Derleme
-------------

.. code-block:: shell

	#https://www.linuxfromscratch.org/lfs/view/9.1/chapter06/eudev.html
	version="3.2.14"
	name="eudev"
	mkdir -p $HOME/distro
	cd $HOME/distro
	rm -rf ${name}-${version}
	rm -rf build-${name}-${version}
	wget https://github.com/eudev-project/eudev/releases/download/v3.2.14/${name}-${version}.tar.gz
	tar -xvf ${name}-${version}.tar.gz
	mkdir build-${name}-${version}
	cd build-${name}-${version}

	../${name}-${version}/configure --prefix=/           \
		    --bindir=/sbin          \
		    --sbindir=/sbin         \
		    --libdir=/lib       \
		    --disable-manpages       \
		    --disable-static \
		    --disable-selinux \
		    --enable-blkid \
		    --enable-modules \
		    --enable-kmod
	make 
	make install DESTDIR=$HOME/rootfs

.. raw:: pdf

   PageBreak


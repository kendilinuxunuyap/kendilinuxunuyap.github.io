eudev
+++++

eudev, Linux işletim sistemlerinde donanım aygıtlarının tanınması ve yönetimi için kullanılan bir sistemdir. "eudev" terimi, "evdev" (evolutionary device) ve "udev" (userspace device) kelimelerinin birleşiminden oluşur.

eudev, Linux çekirdeği tarafından sağlanan "udev" hizmetinin bir alternatifidir. Udev, donanım aygıtlarının dinamik olarak tanınmasını ve yönetilmesini sağlar. Eudev ise, udev'in daha hafif ve basitleştirilmiş bir sürümüdür.

Derleme
-------

.. code-block:: shell

	#https://www.linuxfromscratch.org/lfs/view/9.1/chapter06/eudev.html
	version="3.2.14"
	name="eudev"
	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz

	wget https://github.com/eudev-project/eudev/releases/download/v3.2.14/${name}-${version}.tar.gz
	tar -xvf ${name}-${version}.tar.gz
	cd ${name}-${version} # Kaynak kodun içine giriliyor
	./configure --prefix=/           \
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
	make install DESTDIR=$HOME/distro/rootfs

.. raw:: pdf

   PageBreak


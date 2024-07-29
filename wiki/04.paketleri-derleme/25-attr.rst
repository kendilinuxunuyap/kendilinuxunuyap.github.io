attr
++++

coreutils için gerekli olan paket.

attr Derleme
------------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="2.5.1"
	name="attr"

	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz

	wget https://mirror.rabisu.com/savannah-nongnu/attr/${name}-${version}.tar.gz

	tar -xvf ${name}-${version}.tar.gz

	cd ${name}-${version} # Kaynak kodun içine giriliyor
	configure --prefix=/ \
		--sysconfdir=/etc \
		--libdir=/lib \
		--disable-selinux
	make 
	
	make install DESTDIR=$HOME/distro/rootfs


.. raw:: pdf

   PageBreak


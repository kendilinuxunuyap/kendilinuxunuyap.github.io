acl
+++

coreutils için gerekli olan paket.

acl Derleme
-----------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version='2.3.1'
	name="acl"
	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz
	
	wget https://download.savannah.nongnu.org/releases/acl/${name}-${version}.tar.xz
	tar -xvf ${name}-${version}.tar.xz
	cd ${name}-${version} # Kaynak kodun içine giriliyor
	
	configure --prefix=/ --libdir=/lib

	make 
	
	make install DESTDIR=$HOME/distro/rootfs


.. raw:: pdf

   PageBreak


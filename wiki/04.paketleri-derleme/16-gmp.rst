gmp
+++

coreutils için gerekli olan paket.

gmp Derleme
-----------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="6.3.0"
	name="gmp"

	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz

	wget https://gmplib.org/download/gmp/${name}-${version}.tar.gz

	tar -xvf ${name}-${version}.tar.gz

	cd ${name}-${version} # Kaynak kodun içine giriliyor

	configure  --prefix=/ \
		--libdir=/lib\
		$(use_opt cxx --enable-cxx --disable-cxx) \
		--enable-fat

	make 
	
	make install DESTDIR=$HOME/distro/rootfs


.. raw:: pdf

   PageBreak


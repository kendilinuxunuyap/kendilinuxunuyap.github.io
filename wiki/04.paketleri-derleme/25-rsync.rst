rsync
+++++

rsync, dosya ve dizinleri senkronize etmek için kullanılan bir komuttur. Bu komut, dosyalar arasındaki farkları belirleyerek sadece değişen kısımları kopyalar, böylece verimli bir şekilde dosya senkronizasyonu sağlar.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="3.2.7"
	name="rsync"

	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz

	wget https://download.samba.org/pub/rsync/src/${name}-${version}.tar.gz
	tar -xvf ${name}-${version}.tar.gz
	cd ${name}-${version} # Kaynak kodun içine giriliyor
	
	configure --prefix=/ \
		--libdir=/lib/ \
		--with-included-popt \
		--with-included-zlib \
		--disable-xxhash \
	    	--disable-lz4

		#$(use_opt zstd --enable-zstd --disable-zstd) \
	    	#$(use_opt xxhash --enable-xxhash --disable-xxhash)

	make 

	make install DESTDIR=$HOME/distro/rootfs


.. raw:: pdf

   PageBreak


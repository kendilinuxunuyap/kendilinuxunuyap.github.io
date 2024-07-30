bash
++++

Zstandard (zstd), yüksek hızda sıkıştırma sağlayan bir veri sıkıştırma algoritması ve yazılım aracıdır. Linux işletim sistemi altında, zstd paketi, dosyaları sıkıştırmak ve sıkıştırılmış dosyaları açmak için kullanılır. Bu paket, veri depolama ve iletiminde yer kazanmak için sıkıştırma işlemlerinde yaygın olarak kullanılır. Özellikle yüksek performans gerektiren uygulamalarda tercih edilen bir sıkıştırma yöntemidir. Linux sistemlerinde zstd paketini kullanarak dosyaları sıkıştırabilir ve açabilirsiniz.

Derleme
--------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="kernel"
	name="v1.5.5"

	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz



	wget https://github.com/facebook/zstd/archive/refs/tags/${name}-${version}.tar.gz
	tar -xvf ${name}-${version}.tar.gz

	cd ${name}-${version} # Kaynak kodun içine giriliyor
	#../${name}-${version}/configure --prefix=/                          \
	#            --disable-static                        \
	#            --with-openssl                          \
	#            --enable-threaded-resolver              \
	#            --with-ca-path=/etc/ssl/certs


	make 

	make install DESTDIR=$HOME/distro/rootfs
	cp $HOME/distro/rootfs/usr/local/* -rf $HOME/distro/rootfs/
	


.. raw:: pdf

   PageBreak



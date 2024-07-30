zlib
++++

Zlib paketi, sıkıştırma ve açma işlemleri için kullanılan bir kütüphanedir. Genellikle Linux işletim sistemi altında sıkıştırılmış verileri işlemek için kullanılır. Bu paket, verileri sıkıştırarak depolama alanı tasarrufu sağlar ve ağ üzerinde veri transferini hızlandırır. Ayrıca, zlib, dosya sıkıştırma ve açma işlemlerinde sıkça tercih edilen bir araçtır. Linux sistemlerinde sıkıştırılmış dosyalarla çalışırken sıklıkla karşınıza çıkacak bir kütüphanedir.

Derleme
--------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="1.3"
	name="zlib"

	mkdir -p $HOME/distro
	cd $HOME/distro
	rm -rf ${name}-${version}
	rm -rf build-${name}-${version}

	wget https://zlib.net/current/${name}.tar.gz
	tar -xvf ${name}.tar.gz
	cd ${name}-${version} # Kaynak kodun içine giriliyor
	./configure --prefix=/

	make 

	make install DESTDIR=$HOME/distro/rootfs


.. raw:: pdf

   PageBreak


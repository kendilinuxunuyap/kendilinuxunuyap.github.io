libbrotli
+++++++++

libbrotli, veri sıkıştırma ve açma işlemleri için kullanılan bir kütüphanedir. Bu kütüphane, Brotli adı verilen bir veri sıkıştırma algoritmasını uygular. Brotli, verileri daha küçük boyutlara sıkıştırabilen etkili bir algoritmadır. libbrotli paketi, bu algoritmayı kullanarak Linux sistemlerinde veri sıkıştırma ve açma işlemlerini gerçekleştirmek için kullanılır. Bu paket, sıkıştırılmış verileri daha verimli bir şekilde depolamak veya iletmek için önemli bir araçtır.

Derleme
--------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="1.0"
	name="libbrotli"
	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz

	wget https://github.com/bagder/libbrotli/archive/refs/tags/${name}-${version}.tar.gz
	tar -xvf ${name}-${version}.tar.gz

	cd ${name}-${version} # Kaynak kodun içine giriliyor
	./autogen.sh
	autoreconf -fvi

	./configure --prefix=/ \
		  --libdir=/lib \
		  --enable-shared \
		
	  
	make 

	make install DESTDIR=$HOME/distro/rootfs


.. raw:: pdf

   PageBreak


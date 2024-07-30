libxml2
+++++++

libxml2, XML ve HTML belgelerini işlemek için kullanılan bir kütüphanedir. Bu kütüphane, belgeleri ayrıştırmak, oluşturmak, doğrulamak ve dönüştürmek için geniş bir işlevsellik sunar. Linux sistemlerinde, libxml2 sık ​​kullanılan bir kütüphanedir ve genellikle programlar arasında veri alışverişi için XML formatını işlemek için kullanılır. Bu paket, XML belgeleri üzerinde işlemler yapmak için geliştiricilere güçlü araçlar sağlar ve geniş bir kullanıcı tabanına sahiptir.

Derleme
--------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="2.12.1"
	name="libxml2"

	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz

	wget https://github.com/GNOME/libxml2/archive/refs/tags/v2.12.1.tar.gz
	tar -xvf v${version}.tar.gz

	cd ${name}-${version} # Kaynak kodun içine giriliyor
	autoreconf -fvi

	./configure --prefix=/ \
		  --libdir=/lib \
		  --enable-shared \
		
	  
	make 

	make install DESTDIR=$HOME/distro/rootfs


.. raw:: pdf

   PageBreak


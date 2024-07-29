zlib
++++

zlib, sıkıştırma ve açma işlemleri için kullanılan bir kütüphanedir. Linux sistemlerinde sıkıştırma ve açma işlemlerini gerçekleştirmek için sıklıkla kullanılır. zlib, verileri sıkıştırarak daha az yer kaplamasını sağlar ve aynı zamanda sıkıştırılmış verileri orijinal haline geri dönüştürmek için kullanılır.

zlib, genellikle dosya sıkıştırma, ağ iletişimi ve veritabanı yönetimi gibi alanlarda kullanılır. Örneğin, bir dosyayı sıkıştırmak ve daha az depolama alanı kullanmak istediğinizde zlib'i kullanabilirsiniz. Ayrıca, ağ üzerinden veri iletişimi yaparken veri boyutunu azaltmak için de zlib kullanabilirsiniz.


**Derleme**
-----------

.. code-block:: shell

	version="1.3"
	name="zlib"
	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz

	wget https://zlib.net/current/${name}.tar.gz
	tar -xvf ${name}.tar.gz
	cd ${name}-${version} # Kaynak kodun içine giriliyor
	configure --prefix=/

	make 

	make install DESTDIR=$HOME/distro/rootfs
	
.. raw:: pdf

   PageBreak


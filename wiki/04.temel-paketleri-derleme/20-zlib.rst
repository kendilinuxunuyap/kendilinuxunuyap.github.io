zlib Nedir?
+++++++++++

zlib, sıkıştırma ve açma işlemleri için kullanılan bir kütüphanedir. Linux sistemlerinde sıkıştırma ve açma işlemlerini gerçekleştirmek için sıklıkla kullanılır. zlib, verileri sıkıştırarak daha az yer kaplamasını sağlar ve aynı zamanda sıkıştırılmış verileri orijinal haline geri dönüştürmek için kullanılır.

zlib, genellikle dosya sıkıştırma, ağ iletişimi ve veritabanı yönetimi gibi alanlarda kullanılır. Örneğin, bir dosyayı sıkıştırmak ve daha az depolama alanı kullanmak istediğinizde zlib'i kullanabilirsiniz. Ayrıca, ağ üzerinden veri iletişimi yaparken veri boyutunu azaltmak için de zlib kullanabilirsiniz.


**zlib Derleme**
----------------

.. code-block:: shell

	version="1.3"
	name="zlib"

	mkdir -p $HOME/distro
	cd $HOME/distro
	rm -rf ${name}-${version}
	rm -rf build-${name}-${version}

	wget https://zlib.net/current/${name}.tar.gz
	tar -xvf ${name}.tar.gz

	mkdir build-${name}-${version}

	cd build-${name}-${version}

	../${name}-${version}/configure --prefix=/

	make 

	make install DESTDIR=$HOME/rootfs
	
.. raw:: pdf

   PageBreak


libexpat
++++++++

libexpat, XML verilerini işlemek için kullanılan bir C kütüphanesidir. Bu kütüphane, XML belgelerini okumak ve yazmak için kullanılır. libexpat, hafif ve hızlı bir yapıya sahiptir ve genellikle farklı programlama dilleri tarafından kullanılan bir araç olarak tercih edilir. Linux sistemlerinde, özellikle XML verileri üzerinde işlem yaparken libexpat paketi sıkça kullanılır. Bu paket, XML verilerini ayrıştırmak ve işlemek için geliştiricilere güçlü bir araç sunar.

Derleme
--------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="2.5.0"
	name="expat"

	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz


	wget https://github.com/libexpat/libexpat/releases/download/R_2_5_0/expat-2.5.0.tar.gz
	tar -xvf ${name}-${version}.tar.gz

	cd ${name}-${version} # Kaynak kodun içine giriliyor

	./configure --prefix=/

	make

	make install DESTDIR=$HOME/distro/rootfs


.. raw:: pdf

   PageBreak


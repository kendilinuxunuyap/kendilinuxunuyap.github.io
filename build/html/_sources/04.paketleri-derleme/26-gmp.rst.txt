gmp
+++

coreutils için gerekli olan paket.

GMP (GNU Multiple Precision Arithmetic Library), büyük sayılarla çalışmak için kullanılan bir kütüphanedir. Bu kütüphane, standart veri türlerinin sınırlarını aşarak çok büyük sayılarla işlem yapmamıza olanak tanır. Özellikle kriptografi, sayı teorisi ve bilimsel hesaplama gibi alanlarda büyük sayılarla çalışmak gerektiğinde GMP oldukça faydalıdır. Linux sistemlerinde, GMP kütüphanesini kullanarak büyük sayılarla işlem yapabilir ve hesaplamalarınızı daha hassas bir şekilde gerçekleştirebilirsiniz.

Derleme
-------

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

	./configure  --prefix=/ \
		--libdir=/lib\
		$(use_opt cxx --enable-cxx --disable-cxx) \
		--enable-fat

	make 
	
	make install DESTDIR=$HOME/distro/rootfs


.. raw:: pdf

   PageBreak


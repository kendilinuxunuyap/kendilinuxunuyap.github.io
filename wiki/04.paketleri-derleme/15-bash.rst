bash
++++

Bash, Linux ve diğer Unix tabanlı işletim sistemlerinde kullanılan bir kabuk programlama dilidir. Kullanıcıların komutlar vererek işletim sistemini yönetmelerine olanak tanır. Bash, kullanıcıların işlemleri otomatikleştirmesine ve betik dosyaları oluşturmasına olanak tanır. Özellikle sistem yöneticileri ve geliştiriciler arasında yaygın olarak kullanılan güçlü bir araçtır.

Derleme
--------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="5.2.21"
	name="bash"
	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz
	
	wget https://ftp.gnu.org/pub/gnu/bash/${name}-${version}.tar.gz
	tar -xvf ${name}-${version}.tar.gz
	cd ${name}-${version} # Kaynak kodun içine giriliyor
	
	configure --prefix=/ \
		--libdir=/lib \
		--bindir=/bin \
		--with-curses \
		--enable-readline \
		--without-bash-malloc

	make 

	make install DESTDIR=$HOME/distro/rootfs


.. raw:: pdf

   PageBreak


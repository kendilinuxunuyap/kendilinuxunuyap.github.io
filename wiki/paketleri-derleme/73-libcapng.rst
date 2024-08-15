llibcapng
+++++++++

libcapng paketi, Linux işletim sistemi için yetkilendirme kontrolü sağlayan bir kütüphanedir. Bu kütüphane, yetkilendirme işlemlerini yönetmek için kullanılır ve özellikle düşük seviyeli ayrıcalıkların yönetimi için önemlidir. libcapng, uygulamaların belirli ayrıcalıklara sahip olmasını ve bu ayrıcalıkları etkin bir şekilde kullanmasını sağlar.

Derleme
--------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="0.8.3"
	name="libcap-ng"

	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz

	wget https://github.com/stevegrubb/libcap-ng/archive/refs/tags/v${version}.zip

	unzip v${version}.zip

	cd ${name}-${version} # Kaynak kodun içine giriliyor
	autoreconf -fvi

	./configure --prefix=/ \
		  --libdir=/lib \
		  $(use_opt python --with-python --without-python) \
		$(use_opt python --with-python3 --without-python3)
		
	make 

	make install DESTDIR=$HOME/distro/rootfs


.. raw:: pdf

   PageBreak


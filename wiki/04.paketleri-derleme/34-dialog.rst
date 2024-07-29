dialog
++++++

Dialog, Linux sistemlerinde metin tabanlı bir kullanıcı arayüzü oluşturmak için kullanılan bir araçtır. Kullanıcıya seçenekler sunarak etkileşimli bir iletişim sağlar. Bash betik dosyalarında veya kabuk betiklerinde kullanıcı girişi almak için sıklıkla tercih edilir. Örneğin, bir yükleme betiği yazarken, kullanıcıya belirli seçenekler sunmak için dialog kullanılabilir. Bu şekilde, kullanıcı etkileşimli bir şekilde seçim yapabilir ve işlemi yönlendirebilir. Dialog, terminal penceresinde metin tabanlı bir arayüz oluşturarak kullanıcıların komut satırı üzerinden daha kolay etkileşimde bulunmasını sağlar.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="1.3-20230209"
	name="dialog"

	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz

	wget https://invisible-island.net/archives/dialog/${name}-${version}.tgz
	tar -xvf ${name}-${version}.tgz
	cd ${name}-${version} # Kaynak kodun içine giriliyor
	
	configure --prefix=/ \
		 --libdir=/lib/ \
		 --with-ncursesw
	    # change default color blue to red
	    sed -i "s/COLOR_BLUE/COLOR_RED/g" dlg_colors.h
	    sed -i "s/COLOR_CYAN/COLOR_MAGENTA/g" dlg_colors.h
	make 

	make install DESTDIR=$HOME/distro/rootfs


.. raw:: pdf

   PageBreak

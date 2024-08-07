bzip2
+++++

bzip2, sıkıştırma ve arşivleme işlemleri için kullanılan bir yazılım ve dosya formatıdır. Bu paket, verileri sıkıştırarak depolama alanından tasarruf etmeyi sağlar. Genellikle Linux işletim sistemlerinde sıkça kullanılan bir araçtır. Özellikle dosyaları sıkıştırmak ve depolamak için tercih edilir.

Derleme
--------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="1.0.8"
	name="bzip2"

	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz


	wget https://sourceware.org/pub/bzip2/${name}-${version}.tar.gz
	tar -xvf ${name}-${version}.tar.gz

	cd ${name}-${version} # Kaynak kodun içine giriliyor

	# Generate relative symlinks
		sed -i \
			-e 's:\$(PREFIX)/man:\$(PREFIX)/share/man:g' \
			-e 's:ln -s -f $(PREFIX)/bin/:ln -s :' \
			Makefile

		# fixup broken version stuff
		sed -i \
			-e "s:1\.0\.4:$version:" \
			bzip2.1 bzip2.txt Makefile-libbz2_so manual.*
			
	 make -f Makefile-libbz2_so all
		make all

	 make install DESTDIR=$HOME/distro/rootfs	


	cp -v bzip2-shared $HOME/rootfs/bin/bzip2
	cp -av libbz2.so* $HOME/rootfs/lib
	#ln -sv ../../lib/libbz2.so.1.0 $HOME/rootfs/usr/lib/libbz2.so
	#rm -v $HOME/rootfs/bin/{bunzip2,bzcat,bzip2}
	#ln -sv bzip2 $HOME/rootfs/bin/bunzip2
	#ln -sv bzip2 $HOME/rootfs/bin/bzcat
	


.. raw:: pdf

   PageBreak


nano
++++

Nano, terminal tabanlı bir metin düzenleyicidir ve genellikle yeni başlayanlar için tercih edilir. Basit metin düzenleme işlemleri için idealdir ve kullanımı oldukça kolaydır. Özellikle komut satırında hızlıca metin dosyalarını açmak ve düzenlemek isteyenler için pratik bir araçtır. Nano'nun kullanıcı dostu arayüzü, metin içinde gezinmeyi ve düzenlemeyi kolaylaştırır. Temel metin düzenleme işlemleri için tercih edilen bir araç olmasının yanı sıra, kısayol tuşlarıyla da hızlı erişim imkanı sunar.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="7.2"
	name="nano"

	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz

	wget https://www.nano-editor.org/dist/v7/${name}-${version}.tar.xz

	tar -xvf ${name}-${version}.tar.xz
	
	cd ${name}-${version} # Kaynak kodun içine giriliyor
	./configure --prefix=/
	
	make 

	make install DESTDIR=$HOME/distro/rootfs
	cd $HOME/distro/rootfs
	echo "INPUT(-lncursesw)" > $LFS/lib/libncurses.so
	


.. raw:: pdf

   PageBreak




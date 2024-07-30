ncurses
+++++++

ncurses, Linux işletim sistemi için bir programlama kütüphanesidir. Bu kütüphane, terminal tabanlı kullanıcı arayüzleri oluşturmak için kullanılır. ncurses, terminal ekranını kontrol etmek, metin tabanlı menüler oluşturmak, renkleri ve stil özelliklerini ayarlamak gibi işlevlere sahiptir.

ncurses, kullanıcıya metin tabanlı bir arayüz sağlar ve terminal penceresinde çeşitli işlemler gerçekleştirmek için kullanılabilir. Örneğin, bir metin düzenleyici, dosya tarayıcısı veya metin tabanlı bir oyun gibi uygulamalar ncurses kullanarak geliştirilebilir.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="6.4"
	name="ncurses"
	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz
	wget https://ftp.gnu.org/pub/gnu/ncurses/${name}-${version}.tar.gz
	tar -xvf ${name}-${version}.tar.gz
	cd ${name}-${version} # Kaynak kodun içine giriliyor
	configure --prefix=/ --with-shared --disable-tic-depends --with-versioned-syms  --enable-widec
	# derleme
	make 
	
	# derlenen paketin yüklenmesi ve ayarlamaların yapılması
	make install DESTDIR=$HOME/distro/rootfs
	cd $HOME/distro/rootfs/lib
	ln -s libncursesw.so.6 libtinfow.so.6
	ln -s libncursesw.so.6 libtinfo.so.6
	ln -s libncursesw.so.6 libncurses.so.6

.. raw:: pdf

   PageBreak


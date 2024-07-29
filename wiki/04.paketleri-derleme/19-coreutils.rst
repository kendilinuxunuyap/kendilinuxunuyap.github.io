coreutils
+++++++++

coreutils, Linux işletim sistemi için temel komutlar içeren bir pakettir. Bu komutlar, dosya oluşturma, düzenleme, silme, metin işleme, dizin yönetimi ve daha birçok işlemi gerçekleştirmek için kullanılır. Örneğin, ls komutuyla dizin içeriğini listelemek, cp komutuyla dosyaları kopyalamak veya rm komutuyla dosyaları silmek mümkündür. coreutils, Linux'un temel işlevselliğini sağlayan önemli bir bileşendir ve birçok Linux dağıtımında varsayılan olarak bulunur.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="9.4"
	name="coreutils"
	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz

	wget https://ftp.gnu.org/gnu/coreutils/${name}-${version}.tar.xz
	tar -xvf ${name}-${version}.tar.xz
	
	cd ${name}-${version} # Kaynak kodun içine giriliyor
	configure --prefix=/ \
		--libdir=/lib \
		--libexecdir=/usr/libexec \
		--enable-largefile \
		--disable-selinux \
		--enable-single-binary=symlinks \
		--enable-no-install-program=groups,hostname,kill,uptime \
		$(use_opt openssl --with-openssl --without-openssl)


	make 

	make install DESTDIR=$HOME/distro/rootfs


.. raw:: pdf

   PageBreak


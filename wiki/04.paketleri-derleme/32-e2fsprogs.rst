e2fsprogs
+++++++++

e2fsprogs paket sistemde mkfs.ext4, e2fsck, tune2fs vb sistem araçlarının yüklenmesini sağlar. Eğer sistemde bu sistem uygulamaları yoksa bu paketin yüklenmesi veya derlenmesi gerekmektedir.

Derleme
-------

.. code-block:: shell

	version="1.47.0"
	name="e2fsprogs"
	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz

	wget https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v${version}/${name}-${version}.tar.xz
	tar -xvf ${name}-${version}.tar.gz
	cd ${name}-${version} # Kaynak kodun içine giriliyor
	
	configure --sbindir=/usr/bin \
		    --libdir=/usr/lib64/  
	make 
	
	make install DESTDIR=$HOME/distro/rootfs
	rm -rf $HOME/distro/rootfs/usr/share/man/man8/fsck.8
	
		
	
.. raw:: pdf

   PageBreak


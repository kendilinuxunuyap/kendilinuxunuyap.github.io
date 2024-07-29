busybox Nedir?
++++++++++++++
Busybox tek bir dosya halinde bulunan birçok araç setine sahip olan bir programdır. Bu araçlar initramfs sisteminde ve sistem genelinde sıkça kullanılır. Busybox aşağıdaki gibi kullanılır. Örneğin, dosya listelemek için ls komutunu kullanmak isterseniz:

busybox Derleme
---------------

.. code-block:: shell

	name="busybox"
	version="1.36.1"
	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz
	wget https://busybox.net/downloads/${name}-${version}.tar.bz2
	tar -xvf ${name}-${version}.tar.gz
	cd ${name}-${version} # Kaynak kodun içine giriliyor
	
	make defconfig
	sed -i "s|.*CONFIG_STATIC_LIBGCC .*|CONFIG_STATIC_LIBGCC=y|" .config
	sed -i "s|.*CONFIG_STATIC .*|CONFIG_STATIC=y|" .config

	make 

	mkdir -p $HOME/distro/rootfs/bin
	install busybox $HOME/distro/rootfs/bin/busybox

.. raw:: pdf

   PageBreak


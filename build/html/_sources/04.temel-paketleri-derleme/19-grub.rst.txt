Grub Nedir?
+++++++++++

Grub (Grand Unified Bootloader), Linux işletim sistemlerinde kullanılan bir önyükleme yükleyicisidir. Bilgisayarınızı başlatırken, işletim sisteminin yüklenmesini sağlar. Grub, bilgisayarınızın BIOS veya UEFI tarafından başlatılmasından sonra devreye girer ve işletim sisteminin yüklenmesi için gerekli olan işlemleri gerçekleştirir.

Grub, önyükleme konfigürasyon dosyası olan grub.cfg veya grub.conf dosyasını kullanır. Bu dosya, hangi işletim sistemlerinin yüklü olduğunu, hangi sürücü ve bölümde olduklarını ve hangi işletim sisteminin önyükleneceğini belirten bilgileri içerir.

Aşağıda, Grub ile ilgili bir örnek konfigürasyon dosyası gösterilmektedir:


.. code-block:: shell

	default=0
	timeout=5
	menuentry "Linux" {
	    set root=(hd0,1)
	    linux /vmlinuz root=/dev/sda1
	    initrd /initrd.img
	}
	menuentry "Windows" {
	    set root=(hd0,2)
	    chainloader +1
	}

Bu örnekte, Grub, öntanımlı olarak Linux işletim sistemini başlatacaktır. Eğer Windows'u başlatmak isterseniz, Grub menüsünden "Windows" seçeneğini seçebilirsiniz.

grub Derleme
------------

grub paketini derlemek için aşağıdaki scripti kullabilirsiniz.


.. code-block:: shell

	version="2.06"
	name="grub"

	mkdir -p $HOME/distro
	cd $HOME/distro
	rm -rf ${name}-${version}
	rm -rf build-${name}-${version}

	wget ftp://ftp.gnu.org/gnu/grub/${name}-${version}.tar.gz
	tar -xvf ${name}-${version}.tar.gz
	mkdir build-${name}-${version}
	cd build-${name}-${version}

	../${name}-${version}/configure --prefix= \
		    --sysconfdir=/etc \
		    --libdir=/lib/ \
		    --disable-werror 

	make 
	make install DESTDIR=$HOME/rootfs
	cd $HOME/rootfs
	
	
.. raw:: pdf

   PageBreak


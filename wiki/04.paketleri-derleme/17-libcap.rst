lipcap
++++++

coreutils için gerekli olan paket.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="2.69"
	name="libcap"

	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz

	wget https://mirrors.edge.kernel.org/pub/linux/libs/security/linux-privs/libcap2/${name}-${version}.tar.xz

	tar -xvf ${name}-${version}.tar.xz

	cd ${name}-${version} # Kaynak kodun içine giriliyor

	cap_opts=(
	    SUDO=""
	    prefix=/
	    KERNEL_HEADERS=/usr/include
	    lib=lib64
	    RAISE_SETFCAP=no
	    $(use_opt pam PAM_CAP=yes PAM_CAP=no)
	)
	#make 
	    make ${cap_opts[@]} DYNAMIC=yes
	    make ${cap_opts[@]} DYNAMIC=no

		
	make install DESTDIR=$HOME/distro/rootfs


.. raw:: pdf

   PageBreak


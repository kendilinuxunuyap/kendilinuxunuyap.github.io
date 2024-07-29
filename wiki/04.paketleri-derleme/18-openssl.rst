openssl
+++++++

coreutils için gerekli olan paket.

openssl Derleme
---------------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="3.2.0"
	name="openssl"

	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz

	wget https://www.openssl.org/source/${name}-${version}.tar.gz

	tar -xvf ${name}-${version}.tar.gz

	cd ${name}-${version} # Kaynak kodun içine giriliyor

	config --prefix=/  \
		 --openssldir=/etc/ssl \
		 --libdir=lib          \
		 shared                \
		 zlib-dynamic




	make 

	make install DESTDIR=$HOME/distro/rootfs
	cd $HOME/rootfs

	[ -w /etc/ssl ] || {
	    printf '%s\n' "${0##*/}: root required to update cert." >&2
	    exit 1
	}

	cd /etc/ssl && {
	    wget -O cacert.pem https://curl.haxx.se/ca/cacert.pem
	    mv -f cacert.pem cert.pem
	    printf '%s\n' "${0##*/}: updated cert.pem"
	}


.. raw:: pdf

   PageBreak


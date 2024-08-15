mpfr
++++

MPFR (Multiple Precision Floating-Point Reliable) paketi, yüksek hassasiyetli kayan nokta hesaplamaları yapmak için kullanılan bir kütüphanedir. Bu kütüphane, matematiksel hesaplamalarda doğruluğu artırmak amacıyla tasarlanmıştır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="4.2.0"
	name="mpfr"
	depends="glibc,gmp"
	description="multiple precision floating-point computation"
	source="https://ftp.gnu.org/gnu/mpfr/mpfr-${version}.tar.xz"
	groups="dev.libs"
	BUILDDIR="$HOME/distro/build" #Derleme yapılan dizin
	DESTDIR="$HOME/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd)
	SOURCEDIR="$BUILDDIR/${name}-${version}"

	initsetup(){
		mkdir -p  $BUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $BUILDDIR/* #içeriği temizleniyor
		cd $BUILDDIR #dizinine geçiyoruz
		wget ${source}
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		mv $director ${name}-${version};
	}

	setup()
	{
		cd $SOURCEDIR
	    ./configure --prefix=/usr \
		--libdir=/usr/lib64 \
		--enable-shared \
		--enable-static \
		--disable-maintainer-mode \
		--enable-thread-safe
	}
	build()
	{
		make
	}
	package()
	{
		make install DESTDIR=${DESTDIR}
	}



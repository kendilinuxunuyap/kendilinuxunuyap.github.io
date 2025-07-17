.. _ncurses:
ncurses
+++++++

ncurses, Linux işletim sistemi için bir programlama kütüphanesidir. Bu kütüphane, terminal tabanlı kullanıcı arayüzleri oluşturmak için kullanılır. ncurses, terminal ekranını kontrol etmek, metin tabanlı menüler oluşturmak, renkleri ve stil özelliklerini ayarlamak gibi işlevlere sahiptir.

ncurses, kullanıcıya metin tabanlı bir arayüz sağlar ve terminal penceresinde çeşitli işlemler gerçekleştirmek için kullanılabilir. Örneğin, bir metin düzenleyici, dosya tarayıcısı veya metin tabanlı bir oyun gibi uygulamalar ncurses kullanarak geliştirilebilir.

Derleme
-------

Debian ortamında bu paketin derlenmesi için;
**sudo apt install libncurses-dev** komutuyla paketin kurulması gerekmektedir.


.. code-block:: bash
	
	#--------------------------------------------------------------------------------------------------------------------
	#!/usr/bin/env bash
	version="6.4"
	so_ver="6"
	name="ncurses"
	depends="glibc"
	description="ncurses kütüphanesi"
	source="https://ftp.gnu.org/pub/gnu/ncurses/${name}-${version}.tar.gz"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -1)"  # Display adı
	user=$(who | grep "(${display})" | awk '{print $1}')                      # Display kullanıcısı

	ROOT="/home/$user/distro"
	ROOTBUILDDIR="$ROOT/build"                # Derleme dizini
	BUILDDIR="$ROOT/build/build-${name}-${version}" # Alt dizin
	DESTDIR="$ROOT/rootfs"                     # Yükleme dizini
	PACKAGEDIR=$(pwd)                          # Paket dizini
	SOURCEDIR="$ROOT/build/${name}-${version}" # Kaynak dizini

	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		#isimde boşluk varsa silme işlemi yapılıyor
		for f in *\ *; do mv "$f" "${f// /}"; done 
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; \
		else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; \
		then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

.. raw:: pdf

   PageBreak


.. code-block:: bash

	#--------------------------------------------------------------------------------------------------------------------
	# ncurses devamı
	setup(){
		./configure --prefix=/usr --libdir=/lib64 --with-shared \
		    --disable-tic-depends --with-versioned-syms --enable-widec \
		    --with-cxx-binding --with-cxx-shared --enable-pc-files \
		    --mandir=/usr/share/man --with-manpage-format=normal \
		    --with-xterm-kbs=del --with-pkg-config-libdir=/usr/lib64/pkgconfig
	}

	build(){
		make
	}

	package(){
		make install DESTDIR=$DESTDIR
		cd $DESTDIR/lib64

		ln -s libncursesw.so.6 libtinfow.so.6
		ln -s libncursesw.so.6 libtinfo.so.6
		ln -s libncursesw.so.6 libncurses.so.6

		# Paket config dosyaları linkleniyor
		for lib in ncurses ncurses++ form panel menu; do
		    if [ ! -f "$DESTDIR/usr/lib64/pkgconfig/${lib}.pc" ]; then
		        ln -sv ${lib}w.pc "$DESTDIR/usr/lib64/pkgconfig/${lib}.pc"
		    fi
		done

		for lib in tic tinfo tinfow ticw; do
		    if [ ! -f "$DESTDIR/usr/lib64/pkgconfig/${lib}.pc" ]; then
		        ln -sv ncursesw.pc "$DESTDIR/usr/lib64/pkgconfig/${lib}.pc"
		    fi
		done

		# Eski sürüm desteği için sembolik linkler
		for lib in libncursesw libncurses libtinfo libpanelw libformw libmenuw; do
		    ln -sv ${lib}.so.${so_ver} ${lib}.so.5
		done

		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

**Paket Derleme Yöntemi** konusunda anlatıldığı gibi derleme işlemini yapınız.
  
.. raw:: pdf

   PageBreak



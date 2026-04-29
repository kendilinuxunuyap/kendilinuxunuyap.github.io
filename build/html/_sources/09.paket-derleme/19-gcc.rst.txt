.. _gcc:
**gcc**
+++++++

gcc paketi, C, C++ gibi dillerde yazılmış programların çalışması için gereken kütüphaneleri içerir. Debian ortamında derlemek için **sudo apt install libmpc-dev libmpfr-dev libgmp-dev libisl-dev** paketleri kurmalıyız.

Bu dağıtım için gcc kütüphaneleri olması yeterli. Bunun için sadece libgcc adında bir paket yapmamız yeterli. Fakat siz gcc derlemek isterseniz aşağıda gcc derleme scriptini paylaşıldı.

**libgcc Kurma Scripti**
--------------------------

.. code-block:: bash
	
	#--------------------------------------------------------------------------------------------------------------------
	#!/usr/bin/env bash
	name="libgcc"
	version="13.1.0"
	description="libgcc"
	source=""
	depends=""
	builddepend=""
	group="sys.fs"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"
	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')
	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
	mkdir -p $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
	rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
	cd $ROOTBUILDDIR #dizinine geçiyoruz
	wget ${source}
	for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
	dowloadfile=$(ls|head -1)
	filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
	if [ "${filetype}" == "???" ]; then unzip ${dowloadfile}; else tar -xvf ${dowloadfile};fi
	director=$(find ./* -maxdepth 0 -type d)
	directorname=$(basename ${director})
	if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
	mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
	mkdir -p $SOURCEDIR
	cd $SOURCEDIR
	#dosya indiriliyor
	wget -O libgcc.kly https://github.com/kendilinuxunuyap/kly-binary-packages/raw/refs/heads/master/libgcc/libgcc-13.1.0.kly
	# tar -xf libgcc.kly
	tar -xf libgcc.kly
	tar -xf rootfs.tar.xz -C $BUILDDIR
	}
	build(){
	echo ""
	}
	
	package(){
	cd $BUILDDIR
	cp -prfv $BUILDDIR/* ${DESTDIR}/
	${DESTDIR}/sbin/ldconfig -r ${DESTDIR}
	# sistem guncelleniyor
	}
	initsetup	# initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup	# setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build	# build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package	# package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
.. raw:: pdf

   PageBreak
**gcc Derleme Scripti**
-----------------------

.. code-block:: bash
	
	#--------------------------------------------------------------------------------------------------------------------
	#!/usr/bin/env bash
	version="13.1.0"
	name="gcc"
	depends="glibc,gmp,mpfr,libmpc,zlib,libisl"
	builddepend="flex,elfutils,curl,linux-headers"
	description="DOS filesystem tools - provides mkdosfs, mkfs.msdos, mkfs.vfat"
	source="https://ftp.gnu.org/gnu/gcc/gcc-${version}/gcc-${version}.tar.xz"
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
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $BUILDDIR
	}
	export CFLAGS="-O2 -s"
	export CXXFLAGS="-O2 -s"
	unset LDFLAGS
	setup(){
	case $(uname -m) in
	  x86_64)
	    sed -i.orig '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64
	  ;;
	esac
	    cd $SOURCEDIR
	    mkdir build
	    cd build
	    ../configure --prefix=/usr --libexecdir=/usr/libexec --mandir=/usr/share/man --infodir=/usr/share/info  \
	    --enable-languages=c,c++ --with-linker-hash-style=gnu --with-system-zlib --enable-__cxa_atexit --enable-cet=auto \
	    --enable-checking=release --enable-clocale=gnu --enable-default-pie --enable-default-ssp \ 
	    --enable-gnu-indirect-function --enable-gnu-unique-object --enable-libstdcxx-backtrace --enable-link-serialization=1 \
	    --enable-linker-build-id --enable-lto --disable-multilib --enable-plugin --enable-shared --enable-threads=posix \
	    --disable-libssp --disable-libstdcxx-pch --disable-werror --without-zstd --disable-nls	--libdir=/usr/lib64 \ 
	    --target=x86_64-pc-linux-gnu 	
	}
	build(){
		cd $SOURCEDIR/build
		make
	}
	package(){
		cd $SOURCEDIR/build
		make install DESTDIR=${DESTDIR}
		mkdir -p ${DESTDIR}/usr/lib64/
		ln -s gcc ${DESTDIR}/usr/bin/cc
		ln -s g++ ${DESTDIR}/usr/bin/cxx
		cd $DESTDIR
		while read -rd '' file; do
		case "$(file -Sib "$file")" in
		    application/x-executable\;*)     # Binaries
		        strip "$file" ;;
		    application/x-pie-executable\;*) # Relocatable binaries
		        strip "$file" ;;
		esac
	    done< <(find "./" -type f -iname "*" -print0)	 
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


**Paket Derleme Yöntemi** konusunda anlatıldığı gibi derleme işlemini yapınız.

.. raw:: pdf
   PageBreak

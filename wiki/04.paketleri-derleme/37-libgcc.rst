libgcc
++++++

libgcc paketi, GNU Compiler Collection (GCC) ile birlikte gelen ve C, C++ gibi dillerde yazılmış programların çalışması için gerekli olan temel kütüphaneleri içeren bir bileşendir. Bu paket, derleyici tarafından üretilen kodun çalışabilmesi için gerekli olan düşük seviyeli işlevleri sağlar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="13.1.0"
	name="libgcc"
	depends="glibc,gmp,mpfr,libmpc,zlib,libisl"
	builddepend="flex,elfutils,curl,linux-headers"
	description="DOS filesystem tools - provides mkdosfs, mkfs.msdos, mkfs.vfat"
	source="https://ftp.gnu.org/gnu/gcc/gcc-${version}/gcc-${version}.tar.xz"
	groups="sys.devel"
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

	export CFLAGS="-O2 -s"
	export CXXFLAGS="-O2 -s"
	unset LDFLAGS
	setup()
	{
	case $(uname -m) in
	  x86_64)
	    sed -i.orig '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64
	  ;;
	esac

		 options=(
	      --prefix=/usr
	      --libexecdir=/usr/libexec
	      --mandir=/usr/share/man
	      --infodir=/usr/share/info
	      --enable-languages=c,c++
	      --with-linker-hash-style=gnu
	      --with-system-zlib
	      --enable-__cxa_atexit
	      --enable-cet=auto
	      --enable-checking=release
	      --enable-clocale=gnu
	      --enable-default-pie
	      --enable-default-ssp
	      --enable-gnu-indirect-function
	      --enable-gnu-unique-object
	      --enable-libstdcxx-backtrace
	      --enable-link-serialization=1
	      --enable-linker-build-id
	      --enable-lto
	      --disable-multilib
	      --enable-plugin
	      --enable-shared
	      --enable-threads=posix
	      --disable-libssp
	      --disable-libstdcxx-pch
	      --disable-werror
	      --without-zstd
	      --disable-nls
	    )
	    cd $SOURCEDIR
	    mkdir build
	    cd build
	    ../configure ${options[@]} \
		--libdir=/usr/lib64 \
		--target=x86_64-pc-linux-gnu 

		
	}
	build()
	{
		cd $SOURCEDIR/build
		make
	}
	package()
	{
		cd $SOURCEDIR/build
		make install DESTDIR=${DESTDIR}
	    	
	    	mkdir -p ${DESTDIR}/usr/lib64/
	    	ln -s gcc ${DESTDIR}/usr/bin/cc
	    	ln -s g++ ${DESTDIR}/usr/bin/cxx
	    	cd $DESTDIR
	    	#find ./ -iname "*" -exec strip -s {} \;
	    	 while read -rd '' file; do
		case "$(file -Sib "$file")" in
		    application/x-executable\;*)     # Binaries
		        strip "$file" ;;
		    application/x-pie-executable\;*) # Relocatable binaries
		        strip "$file" ;;
		esac
	       
	    done< <(find "./" -type f -iname "*" -print0)
	    	 
	}

	yedek(){
	 while read -rd '' file; do
		case "$(file -Sib "$file")" in
		    application/x-sharedlib\;*)      # Libraries (.so)
		        strip "$file" ;;
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


Paket adında(ncurses) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak




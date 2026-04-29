.. _readline:
readline 
+++++++++++

libreadline, komut satırında girdi almasını ve düzenlemesini sağlar. Debian ortamında bu paketin derlenmesi için;
**sudo apt install libreadline-dev** komutuyla paketin kurulması gerekmektedir.

.. code-block:: bash
	
	#--------------------------------------------------------------------------------------------------------------------
	#!/usr/bin/env bash
	version="8.2"
	name="readline"
	depends="glibc"
	description="readline kütüphanesi"
	source="https://ftp.gnu.org/pub/gnu/readline/${name}-${version}.tar.gz"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -1)"  
	user=$(who | grep "(${display})" | awk '{print $1}')	# kullanıcı tespit
	ROOT="/home/$user/distro"
	ROOTBUILDDIR="$ROOT/build"                		# Derleme dizini
	BUILDDIR="$ROOT/build/build-${name}-${version}" # Alt dizin
	DESTDIR="$ROOT/rootfs"                     		# Yükleme dizini
	PACKAGEDIR=$(pwd)                          		# Paket dizini
	SOURCEDIR="$ROOT/build/${name}-${version}" 		# Kaynak dizini
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
	setup(){
		cp -prvf $PACKAGEDIR/files $SOURCEDIR/
		./configure --prefix=/usr --libdir=/usr/lib64
	}
	build(){
		make SHLIB_LIBS="-L/tools/lib -lncursesw"
	}
	package(){
		make SHLIB_LIBS="-L/tools/lib -lncursesw" DESTDIR="$DESTDIR" \
		 install pkgconfigdir="/usr/lib64/pkgconfig"
		install -Dm644 $SOURCEDIR/files/inputrc "$DESTDIR"/etc/inputrc
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/readline/files.tar>`_ **Paket Derleme Yöntemi** konusunda anlatıldığı gibi derleme işlemini yapınız.

.. raw:: pdf

   PageBreak


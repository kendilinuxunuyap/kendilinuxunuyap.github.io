.. _openrc:
openrc
++++++

OpenRC, sistem başlangıcını ve hizmetlerin yönetimini sağlamak amacıyla geliştirilmiş bir init sistemidir. Openrc'nin kullanımı için **Yardımcı Konular** bölümüne bakınız. Derlenmesi için; **sudo apt install libpam0g-dev** komutuyla paketlerin kurulması gerekmektedir.


.. code-block:: bash
	
	#--------------------------------------------------------------------------------------------------------------------
	#!/usr/bin/env bash
	name="openrc"
	version="0.53"
	description="The OpenRC init system"
	source="https://github.com/OpenRC/openrc/archive/refs/tags/$version.zip"
	depends=""
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
	    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		cp -prfv $PACKAGEDIR/files $SOURCEDIR/
		cp -prfv $PACKAGEDIR/extras $SOURCEDIR/
		meson setup $BUILDDIR --sysconfdir=/etc --prefix=/ --libdir=/lib64 --includedir=/usr/include \ 
		-Ddefault_library=both -Dzsh-completions=true -Dbash-completions=true -Dpam=true -Dselinux=disabled -Dpkgconfig=true
	}
	build(){
		meson compile -C $BUILDDIR
	}
	package(){
		DESTDIR="$DESTDIR" meson install --no-rebuild -C $BUILDDIR
		mkdir -p "$DESTDIR/sbin"; cd "$DESTDIR/sbin"
		ln -s ../usr/sbin/openrc-init openrc-init
		ln -s ../usr/sbin/openrc-run openrc-run
		ln -s ../usr/sbin/openrc-shutdown shutdown
		cd $SOURCEDIR
		rm -f ${DESTDIR}/etc/runlevels/*/*	    # disable all services
		rm ${DESTDIR}//etc/init.d/functions.sh
		ln -s ../../usr/lib/rc/sh/functions.sh ${DESTDIR}/etc/init.d/functions.sh
		mkdir -p ${DESTDIR}/usr ${DESTDIR}/sbin
		mv ${DESTDIR}/{,usr}/share	    # move /share to /usr/share
		install $SOURCEDIR/files/reboot ${DESTDIR}/sbin/reboot	    # reboot and poweroff script
		install $SOURCEDIR/files/poweroff ${DESTDIR}/sbin/poweroff
		ln -s openrc-shutdown ${DESTDIR}/sbin/shutdown
		mkdir -p ${DESTDIR}/usr/libexec
		install $SOURCEDIR/extras/disable-secondary-gpu.sh ${DESTDIR}/usr/libexec/disable-secondary-gpu
		install $SOURCEDIR/extras/disable-secondary-gpu.initd ${DESTDIR}/etc/init.d
		install $SOURCEDIR/extras/backlight-restore.initd ${DESTDIR}/etc/init.d
		install $SOURCEDIR/files/0modules.init.d ${DESTDIR}/etc/init.d/0modules
		for level in boot default nonetwork shutdown sysinit ; do
		mkdir -p ${DESTDIR}/etc/runlevels/$level
		done
		touch ${DESTDIR}/etc/fstab
		install $SOURCEDIR/files/0modules.init.d ${DESTDIR}/etc/init.d/0modules
		install $SOURCEDIR/files/0modules.init.d ${DESTDIR}/etc/runlevels/default/0modules
		install ${DESTDIR}/etc/init.d/hostname ${DESTDIR}/etc/runlevels/default/hostname
		cd ${DESTDIR}/etc/init.d/
		ln -s agetty agetty.tty1
		install ${DESTDIR}/etc/init.d/agetty.tty1 ${DESTDIR}/etc/runlevels/default/agetty.tty1
		
		install $SOURCEDIR/files/rootfspermit.init.d ${DESTDIR}/etc/init.d/rootfspermit
		install $SOURCEDIR/files/rootfspermit.local.d ${DESTDIR}/etc/local.d/rootfspermit
		cd ${DESTDIR}/etc/runlevels/default
		ln -s ../../init.d/rootfspermit rootfspermit
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup;	setup;	build;	package;

Ek dosyaları indirmek için; 1. Ek `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/openrc/files.tar>`_ 2.Ek `tıklayınız.. <https://kendilinuxunuyap.github.io/_static/files/openrc/extras.tar>`_ **Paket Derleme Yöntemi** konusunda anlatıldığı gibi derleme işlemini yapınız.

.. raw:: pdf

   PageBreak




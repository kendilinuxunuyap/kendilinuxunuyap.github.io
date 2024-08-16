util-linux
++++++++++

Util-linux paketi, Linux tabanlı sistemlerde kritik öneme sahip bir bileşendir. Bu paket, dosya sistemleri, disk yönetimi, kullanıcı yönetimi ve sistem izleme gibi çeşitli işlevleri yerine getiren bir dizi araç içerir. Örneğin, mount ve umount komutları, dosya sistemlerini bağlamak ve ayırmak için kullanılırken, fdisk ve parted disk bölümlerini yönetmek için kullanılır. Ayrıca, login, su, ve passwd gibi komutlar, kullanıcı kimlik doğrulama ve yönetimi için önemli işlevler sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="util-linux"
	version="2.40.1"
	description="Various useful Linux utilities"
	source="https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v${version%.*}/util-linux-${version}.tar.gz"
	depends=""
	buildepend="libcap-ng,python,eudev,sqlite,eudev,cryptsetup,libxcrypt"
	group="sys.apps"
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

	setup(){
		cp -prvf $PACKAGEDIR/files/ /tmp/bps/build/
		cd $SOURCEDIR
		patch -Np1 -i ../files/0001-util-linux-tmpfiles.patch
	   
		./configure --prefix=/usr \
			--libdir=/usr/lib64 \
			--bindir=/usr/bin \
			--enable-shared \
			--enable-static \
			--disable-su \
			--disable-runuser \
			--disable-chfn-chsh \
			--disable-login \
			--disable-sulogin \
			--disable-makeinstall-chown \
			--disable-makeinstall-setuid \
			--disable-pylibmount \
			--disable-raw \
			--without-systemd \
			--without-libuser \
			--without-utempter \
			--without-econf \
			--with-python \
			--with-udev
	}

	build(){
	    make
	}
	
	package(){
		_python_stdlib="$(python -c 'import sysconfig; print(sysconfig.get_paths()["stdlib"])')"
	    make install DESTDIR=$DESTDIR
	    
		# remove static libraries
		rm "${DESTDIR}"/usr/lib/lib*.a*

		# setuid chfn and chsh
		chmod 4755 "${DESTDIR}"/usr/bin/{newgrp,ch{sh,fn}}

		# install PAM files for login-utils
		install -Dm0644 ../files/pam-common "${DESTDIR}/etc/pam.d/chfn"
		install -m0644 ../files/pam-common "${DESTDIR}/etc/pam.d/chsh"
		install -m0644 ../files/pam-login "${DESTDIR}/etc/pam.d/login"
		install -m0644 ../files/pam-remote "${DESTDIR}/etc/pam.d/remote"
		install -m0644 ../files/pam-runuser "${DESTDIR}/etc/pam.d/runuser"
		install -m0644 ../files/pam-runuser "${DESTDIR}/etc/pam.d/runuser-l"
		install -m0644 ../files/pam-su "${DESTDIR}/etc/pam.d/su"
		install -m0644 ../files/pam-su "${DESTDIR}/etc/pam.d/su-l"

		mkdir -p $DESTDIR/usr/lib64/python3.11

		# runtime libs are shipped as part of util-linux-libs
		install -d -m0755 util-linux-libs/lib/
		mv "$DESTDIR"/usr/lib/lib*.so* util-linux-libs/lib64/
		mv "$DESTDIR"/usr/lib/pkgconfig util-linux-libs/lib64/pkgconfig
		mv "$DESTDIR"/usr/include util-linux-libs/include
		mv "$DESTDIR"/"${_python_stdlib}"/site-packages util-linux-libs/site-packages
		rmdir "$DESTDIR"/"${_python_stdlib}"
		mv "$DESTDIR"/usr/share/man/man3 util-linux-libs/man3

		mv util-linux-libs/lib/* "$DESTDIR"/usr/lib64/
		mv util-linux-libs/include "$DESTDIR"/usr/include
		mv util-linux-libs/site-packages "$DESTDIR"/"${_python_stdlib}"/site-packages

		# install esysusers
		install -Dm0644 ../files/util-linux.sysusers "${DESTDIR}/usr/lib64/sysusers.d/util-linux.conf"

		install -Dm0644 ../files/60-rfkill.rules "${DESTDIR}/usr/lib64/udev/rules.d/60-rfkill.rules"
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/util-linux/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **util-linux** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(util-linux) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak




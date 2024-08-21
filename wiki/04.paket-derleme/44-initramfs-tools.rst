initramfs-tools
+++++++++++++++

initramfs-tools, Debian tabanlı sistemlerde kullanılan bir araçtır ve initramfs (initial RAM file system) oluşturmak için kullanılır. Bu araç, sistem açılırken kullanılan geçici bir dosya sistemini oluşturur ve gerekli modülleri yükler. initramfs için farklı araçlarda kullanılabilir.
Kullanıcı isterse kendi scriptinide kullanabilir. Debian dışında **dracut** aracıda initramfs oluşturmak ve güncellemek için kullanılabilir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="0.142"
	name="initramfs-tools"
	depends="glibc,readline,ncurses"
	description="initramfs  generate sağlayan paket"
	source="https://salsa.debian.org/kernel-team/initramfs-tools/-/archive/v$version/initramfs-tools-v$version.tar.gz"
	groups="sys.fs"
	ROOTBUILDDIR="$HOME/distro/build"
	BUILDDIR="$HOME/distro/build/build-${name}-${version}" #Derleme yapılan dizin
	DESTDIR="$HOME/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd)
	SOURCEDIR="$HOME/distro/build/${name}-${version}"
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

	setup()
	{	
		mkdir -p $SOURCEDIR/conf-hooks.d
		cp ${dizin}/${paket}/conf-hooks.d/* $SOURCEDIR/conf-hooks.d/
		mkdir -p $SOURCEDIR/patches
		cp $PACKAGEDIR/files/patches/* $SOURCEDIR/patches/
		cp $PACKAGEDIR/files/initramfs-tools.sysconf $SOURCEDIR/initramfs-tools.sysconf
		cp $PACKAGEDIR/files/zzz-busybox $SOURCEDIR/zzz-busybox
		#cp $PACKAGEDIR/files/fsck $SOURCEDIR/fsck
		cp $PACKAGEDIR/files/modules $SOURCEDIR/modules

		
		cd $SOURCEDIR
		patch -Np1 < $SOURCEDIR/patches/remove-zstd.patch
	    	patch -Np1 < $SOURCEDIR/patches/remove-logsave.patch
	    	patch -Np1 < $SOURCEDIR/patches/non-debian.patch
	}
	build()
	{
		echo ""
	}
	package()
	{
		cd $SOURCEDIR
		cat debian/*.install | sed "s/\t/ /g" | tr -s " " | while read line ; do
		file=$(echo $line | cut -f1 -d" ")
		target=$(echo $line | cut -f2 -d" ")
		mkdir -p ${DESTDIR}/$target
		cp -prvf $file ${DESTDIR}/$target/
	    	done
	    	# install mkinitramfs
	    	cp -pvf mkinitramfs ${DESTDIR}/usr/sbin/mkinitramfs
	    	sed -i "s/@BUSYBOX_PACKAGES@/busybox/g" ${DESTDIR}/usr/sbin/mkinitramfs
	    	sed -i "s/@BUSYBOX_MIN_VERSION@/1.22.0/g" ${DESTDIR}/usr/sbin/mkinitramfs
	    	# Remove debian stuff
	    	rm -rvf ${DESTDIR}/etc/kernel
	    	# install sysconf
	    	mkdir -p ${DESTDIR}/etc/sysconf.d
	    	install ../initramfs-tools.sysconf ${DESTDIR}/etc/sysconf.d/initramfs-tools
	    	

	    	install $SOURCEDIR/zzz-busybox ${DESTDIR}/usr/share/initramfs-tools/hooks/
	    	install $SOURCEDIR/modules ${DESTDIR}/usr/share/initramfs-tools/
	    	install $SOURCEDIR/modules ${DESTDIR}/etc/initramfs-tools/
	    	
	    	mkdir -p ${DESTDIR}/usr/share/initramfs-tools/conf-hooks.d
	    	install $SOURCEDIR/conf-hooks.d/busybox ${DESTDIR}/usr/share/initramfs-tools/conf-hooks.d/
	 
	    	
	    	mkdir -p ${DESTDIR}/etc/initramfs-tools/scripts
	    	
	  }
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/initramfs-tools/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **initramfs-tools** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(initramfs-tools) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build

**/etc/initramfs-tools/modules**
---------------------------------

**modules** dosyası initrd oluşturulma ve güncelleme durumunda isteğe bağlı olarak modullerin eklenmesisini ve **initrd** açıldığında modülün yüklenmesini istiyorsak **/etc/initramfs-tools/modules** komundaki dosyayı  aşağıdaki gibi düzenlemeliyiz. Bu dosya içinde **ext4**, **vfat** ve diğer yardımcı moduller eklenmiş durumdadır. 

.. code-block:: shell

	### This file is the template for /etc/initramfs-tools/modules.
	### It is not a configuration file itself.
	###
	# List of modules that you want to include in your initramfs.
	# They will be loaded at boot time in the order below.
	#
	# Syntax:  module_name [args ...]
	#
	# You must run update-initramfs(8) to effect this change.
	#
	# Examples:
	#
	# raid1
	# sd_mod
	vfat
	fat
	nls_cp437
	nls_ascii
	nls_utf8
	ext4
 
**initramfs-tools Ayarları**
----------------------------

**/usr/share/initramfs-tools/hooks/** konumundaki dosyaları dikkatlice düzenlemek gerekmektedir.
Dosyaları alfabetik sırayla çalıştırdığı için **busybox** **zzz-busybox** şeklinde ayarlanmıştır.

**initrd Oluşturma/Güncelleme**
-------------------------------

sistemin initrd.img dosyasının güncellenmesi için çalıştığınız sistemde  aşağıdaki komutla güncelleenbilir. 

.. code-block:: shell

	/usr/sbin/update-initramfs -u -k $(uname -r) #initrd günceller

Eğer bir dizin içinde bir sisteme initrd oluşturlacaksa, yani chroot ile sisteme erişiliyorsa yukarıdaki komut yeterli olmayacaktır. chroot öncesinde sistemin **dev sys proc run** diziznlerinin  bağlanılması gerekmektedir. Dizindeki sistemimizin dizin ismi **taarget** olsun. Buna göre aşağıda sisteme yukarıdaki komutu çalıştırmadan önce çalıştırılması gereken komutlar aşağıda verilmiştir.

.. code-block:: shell

	$ mkdir -p /target/dev
	$ mkdir -p /target/sys
	$ mkdir -p /target/proc 
	$ mkdir -p /target/run
	$ mkdir -p /target/tmp
	$ mount --bind /dev /target/dev
	$ mount --bind /sys /target/sys
	$ mount --bind /proc /target/proc
	$ mount --bind /run /target/run
	$ mount --bind /tmp /target/tmp
	$ chroot /target
	 
Güncelleme ve oluşturma aşamasında **/usr/share/initramfs-tools/hooks/** konumundaki dosyarı çalıştırarak yeni initrd dosyasını oluşturacaktır.
Oluşturma **/var/tmp** olacaktır. Ayrıca **/boot/config-6.6.0-amd64** gibi sistemde kullanılan kernel versiyonuyla config dosyası olmalıdır. Burada verilen **6.6.0-amd64** örnek amaçlı verilmiştir.

**initrd açılma Süreci**
------------------------

Sistemin açılması için **vmlinuz**, **initrd.img** ve **grub.cfg** dosyalarının olması yeterlidir. **initrd.img** sistemin açılma sürecini yürüten bir kernel yardımcı ön sistemidir. **initrd.img** açıldığında aşğıdaki gibi bir dizin yapısı olur. Bu dizinler içindeki **script** dizini çok önemlidir. Bu dizin içindeki scriptler belirli bir sırayla çalışarak sistemin açılması sağlanır.

.. image:: /_static/images/initrd-2.png
  	:width: 600

**initrd script İçeriği**
-------------------------
**script** içerindeki dizinler  aşağıdaki gibidir. Bu dizinler içinde scriptler vardır. Bu dizinlerin içeriği sırayla şöyle çalışmaktadır.

1. init-top
2. init-premount
3. init-bottom

.. image:: /_static/images/initrd-3.png
  	:width: 600
  	
Oluşan initrd.img dosyası sistemin açılmasını sağlayamıyorsa script açılış sürecini takip ederek sorunları çözebilirsiniz.

.. raw:: pdf

   PageBreak

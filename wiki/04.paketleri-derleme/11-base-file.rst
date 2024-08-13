base-file
+++++++++

Bir sistem tasarımı için temel ayarlamalar, dosya ve dizin yapıları olması gerekmektedir.
Bu yapılandırmalar yapıldıktan sonra sistemi bunun üzerine işlemlere devam edilmelidir. Bundan dolayı temel işlemlerin tanımlandığı bir dizi işleri kapsayacaktır.

Yapının Oluşturulması
---------------------


.. code-block:: shell
	
    #!/usr/bin/env bash
    version="5.2.21"
    name="base-file"
    depends=""
    description="temel paket ve dosyalar"
    source=""
    groups="sys.base"
    BUILDDIR="$HOME/distro/build" #Derleme yapılan dizin
	DESTDIR="$HOME/distro/rootfs" #paketin yükleneceği sistem konumu
    initsetup(){
		echo ""
    }
    setup(){
        mkdir -p  $BUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $BUILDDIR/* #içeriği temizleniyor
		cd $BUILDDIR #dizinine geçiyoruz
    }
    build(){
        echo ""
    }
    package(){
       	mkdir  -p bin dev etc home lib64 proc root run sbin sys usr var etc/bps tmp tmp/bps/kur \
		var/log  var/tmp usr/lib64/x86_64-linux-gnu usr/lib64/pkgconfig \
		usr/local/{bin,etc,games,include,lib,sbin,share,src}
		ln -s lib64 lib
		cd var&&ln -s ../run run&&cd -
		cd usr&&ln -s lib64 lib&&cd -
		cd usr/lib64/x86_64-linux-gnu&&ln -s ../pkgconfig  pkgconfig&&cd -

		bash -c "echo -e \"/bin/sh \n/bin/bash \n/bin/rbash \n/bin/dash\" >> $rootfs/etc/shell"
		bash -c "echo 'tmpfs /tmp tmpfs rw,nodev,nosuid 0 0' >> $rootfs/etc/fstab"
		bash -c "echo '127.0.0.1 basitdagitim' >> $rootfs/etc/hosts"
		bash -c "echo 'basitdagitim' > $rootfs/etc/hostname"
		bash -c "echo 'nameserver 8.8.8.8' > $rootfs/etc/resolv.conf"

		echo root:x:0:0:root:/root:/bin/sh > $rootfs/etc/passwd 
		chmod 755 $rootfs/etc/passwd
		
		cp -prfv $BUILDDIR/*  $DESTDIR/

    }
    
    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
    setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.




.. raw:: pdf

   PageBreak


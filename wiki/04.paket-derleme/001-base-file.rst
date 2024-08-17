base-file
+++++++++

Bir sistem tasarımı için temel ayarlamalar, dosya ve dizin yapıları olması gerekmektedir.
Bu yapıyı oluşturduktan sonra sistemi bu yapının üzerine inşaa edeceğiz. Sistemin ilk ve temel ayarları olduğundan dolayı **base-file** ismini kullandık. Aslında linux sisteminde temel paket **glibc** paketidir. **glibc** paketinin derlenip yüklenmesinden önce temel yapının oluşturulması gerektiği için **base-file** paketi oluşturduk. 

**base-file Komutları**
-----------------------

.. code-block:: shell

	mkdir -p  $HOME/distro/build 	#Derleme dizini yoksa oluşturuluyor
    mkdir -p  $HOME/distro/rootfs  	#Sistemin oluşturlacağı dizin yoksa oluşturuluyor
    rm -rf /$HOME/distro/build/* #içeriği temizleniyor
    cp -prfv files/* $HOME/distro/build/ # Ek dosyalar kopyalanıyor. Ek dosyalar aşağıda verilmiştir.
    cd $HOME/distro/build  #build geçiyoruz
	
    mkdir  -p bin dev etc home lib64 proc root run sbin sys usr var etc/bps tmp tmp/bps/kur \
    var/log  var/tmp usr/lib64/x86_64-linux-gnu usr/lib64/pkgconfig \
	usr/local/{bin,etc,games,include,lib,sbin,share,src}
    ln -s lib64 lib
    cd var&&ln -s ../run run&&cd -
    cd usr&&ln -s lib64 lib&&cd -
    cd usr/lib64/x86_64-linux-gnu&&ln -s ../pkgconfig  pkgconfig&&cd -

    bash -c "echo -e \"/bin/sh \n/bin/bash \n/bin/rbash \n/bin/dash\" >> $HOME/distro/build/etc/shell"
    bash -c "echo 'tmpfs /tmp tmpfs rw,nodev,nosuid 0 0' >> $HOME/distro/build/etc/fstab"
    bash -c "echo '127.0.0.1 basitdagitim' >> $HOME/distro/build/etc/hosts"
    bash -c "echo 'basitdagitim' > $HOME/distro/build/etc/hostname"
    bash -c "echo 'nameserver 8.8.8.8' > $HOME/distro/build/etc/resolv.conf"

    echo root:x:0:0:root:/root:/bin/sh > $HOME/distro/build/etc/passwd
    chmod 755 $HOME/distro/build/etc/passwd

    cp -prfv $HOME/distro/build/*  $HOME/distro/rootfs/
	
Bu komutlar yöntem olarak doğru olsada daha fonksiyonel hale getirmek için aşağıda verilen script şablon yapısını kullanacağız.

Şablon Script Yapısı
--------------------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version=""
	name=""
	depends=""
	description=""
	source=""
	groups=""
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
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $BUILDDIR
	}
	setup(){
		#Derleme öncesi kaynak dosyaların sisteme göre ayarlanması
	}
	build(){
		#Paketin derlenmesi
	}
	package(){
		# Derlenen dosyaları yükleme öncesi ayar ve yükleme işleminin yapılması
	}

	initsetup 	# initsetup fonksiyonunu çalıştırır ve kaynak dosyayı inidirir
	setup		# setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build		# build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package		# package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
	
Şablon dosyasındaki her bir fonksiyonu aslında **base-file** için paylaşılan komutları adım adım yaptığımız işlemleri kapsamaktadır. Biz bu işlem adımlarını şablon dosyamızın ilgili fonksiyonlarına aşama aşama yaptığımız işlemleri ayrıştıracağız.
**base-file** script dosyasına benzer yapıda diğer paketler içinde script dosyası oluşturulacaktır. Bu sayede her aşamayı tek tek yazma gibi iş yükü olmayacak ve paket derlenirken hangi fonksiyonda(initsetup, setup vb.) sorun yaşanırsa o fonksiyon üzerinden hata ayıklama yapılacaktır.
Bu şekilde bir script dosyasına ileri aşamalarda daha yeni özellikler katma ve kontrol etmeye imkan sağlayacaktır. **base-file** scriptide dahil sonraki aşamalarda yapacağınız çalıştıracağınız script dosyaları bir dizin içinde sırasıyla(1-base-file vb) saklamanızı tavsiye ederim. Daha sonra bu işlemleri tekrarlamanız durumunda hangi sırayla paketleri derleyeceğinizi anlamanız ve hızlıca paketleri derlemenizi kolaylaştıracaktır.

Yapıyı Oluşturan Script
-----------------------

.. code-block:: shell

	#!/usr/bin/env bash
	version="1.0"
	name="base-file"
	depends=""
	description="sistemin temel yapısı"
	source=""
	groups="sys.base"
	ROOTBUILDDIR="$HOME/distro/build"
	BUILDDIR="$HOME/distro/build/build-${name}-${version}" #Derleme yapılan dizin
	DESTDIR="$HOME/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd)
	SOURCEDIR="$HOME/distro/build/${name}-${version}"
	initsetup(){
			mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
			rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
			cd $ROOTBUILDDIR #dizinine geçiyoruz
			mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $BUILDDIR
	}
	setup(){
			cp -prfv $PACKAGEDIR/files/* $BUILDDIR/
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
			bash -c "echo -e \"/bin/sh \n/bin/bash \n/bin/rbash \n/bin/dash\" >> $BUILDDIR/etc/shell"
			bash -c "echo 'tmpfs /tmp tmpfs rw,nodev,nosuid 0 0' >> $BUILDDIR/etc/fstab"
			bash -c "echo '127.0.0.1 basitdagitim' >> $BUILDDIR/etc/hosts"
			bash -c "echo 'kly' > $BUILDDIR/etc/hostname"
			bash -c "echo 'nameserver 8.8.8.8' > $BUILDDIR/etc/resolv.conf"
			echo root:x:0:0:root:/root:/bin/sh > $BUILDDIR/etc/passwd
			chmod 755 $BUILDDIR/etc/passwd
			cp -prfv $BUILDDIR/*  $DESTDIR/
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
		
Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/base-file/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **base-file** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız. 

Yukarı verilen script kodlarını **build** adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra **build** scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları **base-file** dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	./build


Paket Derleme Yöntemi
---------------------

**base-file** paketleri ilk paketler olmasından dolayı detaylıca anlatıldı. Bu paketten sonraki paketlerde **şablon script** dosyası yapında verilecektir. Script dosya altında ise ek dosyalar varsa **files.tar** şeklinde link olacaktır. Her paket için istediğiniz bir konumda bir dizin oluşturunuz. **files.tar** dosyasını oluşturulan dizin içinde açınız. Derleme scripti için **build** dosyası oluşturup içine yapıştırın ve kaydedin. 
**build**  dosyasının bulunduğu dizininde terminali açarak aşağıdaki gibi çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	./build

.. raw:: pdf

   PageBreak


Paket Oluşturma
+++++++++++++++

bps paket sisteminin temel parçalarından en önemlisi paket oluşturma uygulamasıdır. Dokümanda temel paketlerin nasıl derlendiği **Temel Paketler** başlığı altında anlatılmıştı. Bir paket üzerinden(readline) örneklendirerek paketimizi oluşturacak scriptimizi yazalım.

Dokümanda readline paketi nasıl derleneceği aşağıdaki script yapılıyor.

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="8.1"
	name="readline"
	mkdir -p $HOME/distro
	cd $HOME/distro
	rm -rf ${name}-${version}
	rm -rf build-${name}-${version}
	wget https://ftp.gnu.org/pub/gnu/readline/${name}-${version}.tar.gz
	tar -xvf ${name}-${version}.tar.gz
	mkdir build-${name}-${version}
	cd build-${name}-${version}
	../${name}-${version}/configure --prefix=/ --enable-shared --enable-multibyte
	
	# derleme
	make 
	
	# derlenen paketin yüklenmesi ve ayarlamaların yapılması
	make install DESTDIR=$HOME/rootfs

Bu script readline kodunu internetten indirip derliyor ve kurulumu yapıyor. Aslında bu scriptle **paketleme**, **paket kurma** işlemini bir arada yapıyor. Bu işlem mantıklı gibi olsada paket sayısı arttıkça ve rutin yapılan işlemleri tekrar tekrar yapmak gibi işlem fazlalığına sebep olmaktadır.

Bu sebeplerden dolayı **readline** paketleme scriptini yeniden düzenleyelim. Yeni düzenlenen halini  **bpspaketle** ve **bpsbuild** adlı script dosyaları olarak düzenleyeceğiz. Genel yapısı aşağıdaki gibi olacaktır.


**bpsbuild** Dosyası
--------------------

.. code-block:: shell
	
	setup()	{}
	build()	{}
	package() {}

**bpspaketle** Dosyası
----------------------

.. code-block:: shell
	
	#genel değişkenler tanımlanır
	initsetup() {}
	
	#bpsbuild dosya fonksiyonları birleştiriliyor
	source bpsbuild # bu komutla setup build package fonsiyonları bpsbuild doyasından alınıp birleştiriliyor
	
	packageindex() {}
	packagecompress() {}

.. raw:: pdf

   PageBreak
   
Aslında yukarıdaki **bpspaketle** ve **bpsbuild** adlı script dosyaları tek bir script dosyası olarak **bpspaketle** dosyası. İki dosyayı birleştiren **source bpsbuild** komutudur. **bpspaketle** dosyası aşağıdaki gibi düşünebiliriz.

.. code-block:: shell
	
	#genel değişkenler tanımlanır
	initsetup() {}
	
	setup()	{} #bpsbuild dosyasından gelen fonksiyon, "source bpsbuild" komutu sonucu gelen fonksiyon
	build()	{} #bpsbuild dosyasından gelen fonksiyon, "source bpsbuild" komutu sonucu gelen fonksiyon
	package() {} #bpsbuild dosyasından gelen fonksiyon, "source bpsbuild" komutu sonucu gelen fonksiyon
	
	packageindex() {}
	packagecompress() {}

Bu şekilde ayrılmasının temel sebebi  **bpspaketle** scriptinde hep aynı işlemler yapılırken **bpsbuild** scriptindekiler her pakete göre değişmektedir. Böylece paket yapmak için ilgili pakete özel **bpsbuild** dosyası düzenlememiz yeterli olacaktır. **bpspaketle** dosyamızda **bpsbuild** scriptini kendisiyle birleştirip paketleme yapacaktır.

**bpsbuild** Dosyamızın Son Hali
----------------------------------

.. code-block:: shell

	#!/usr/bin/env bash
	version="8.1"
	name="readline"
	depends="glibc"
	description="readline kütüphanesi"
	source="https://ftp.gnu.org/pub/gnu/readline/${name}-${version}.tar.gz"
	groups="sys.apps"
	setup()
	{
		../${name}-${version}/configure --prefix=/ --enable-shared --enable-multibyte
	}
	build()
	{
		make 
	}
	package()
	{
		make install DESTDIR=$DESTDIR
	}


**bpspaketle** Dosyamızın Son Hali
----------------------------------

.. code-block:: shell
	
	#!/usr/bin/env bash
	set -e
	paket=$1
	dizin=$(pwd)
	if [ ! -d ${paket} ]; then echo "Bir paket değil!"; exit; fi
	if [ ! -f "${paket}/bpsbuild" ]; then echo "Paket dosyası bulunamadı!"; exit; fi
	echo "Paket : $paket"
	source ${paket}/bpsbuild
	DESTDIR=/tmp/bps/build/rootfs-${name}-${version}
	SOURCEDIR=/tmp/bps/build/${name}-${version}
	BUILDDIR=/tmp/bps/build/build-${name}-${version}

	# paketin indirilmesi ve /tmp/bps/build konumunda derlenmesi için gerekli dizinler hazırlanır.
	initsetup() 
	{
		mkdir -p /tmp/bps
		mkdir -p /tmp/bps/build
		cd /tmp/bps/build
		rm -rf ./*
		rm -rf build-${name}-${version}*
		rm -rf ${name}-${version}*
		rm -rf rootfs-${name}-${version}*
		
		if [ -n "${source}" ]
		then
			wget ${source}
			dowloadfile=$(ls|head -1)
			filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
			echo "***********dosya sıkıştırma türü**********:${filetype}"
			if [ ${filetype} == "bz2" ]; then tar -xvf ${dowloadfile}; fi
			if [ ${filetype} == "tar" ]; then tar -xvf ${dowloadfile}; fi
			if [ ${filetype} == "xz" ]; then tar -xvf ${dowloadfile}; fi
			if [ "${filetype}" == "gz" ]; then echo "*****dosya gz ile sıkıştırılmış**"; tar -xvf ${dowloadfile}; fi
			if [ "${filetype}" == "???" ]; then echo "****dosya zip ile sıkıştırılmış****"; unzip  ${dowloadfile}; fi
			#*********************************************************************************************************
			director=$(find ./* -maxdepth 0 -type d)
			if [ "${director}" != "./${name}-${version}" ]; then mv $director ${name}-${version}; fi
		fi
		mkdir -p build-${name}-${version}
		mkdir -p rootfs-${name}-${version}
		cp ${dizin}/${paket}/bpsbuild /tmp/bps/build
		cd build-${name}-${version}
	}

	#paketlenecek dosların listesini tutan file.index dosyası oluşturulur
	packageindex() 
		rm -rf file.index
		cd /tmp/bps/build/rootfs-${name}-${version}
		find . -type f | while IFS= read file_name; do if [ -f ${file_name} ]; then echo ${file_name:1}>>../file.index; fi done
		find . -type l | while IFS= read file_name; do if [ -L ${file_name} ]; then echo ${file_name:1}>>../file.index; fi done
	}

	# paket dosyası oluşturulur;
	# kurulacak data rootfs.tar.xz, file.index ve bpsbuild dosyaları tek bir dosya olarak tar.gz dosyası olarak  hazırlanıyor.
	# tar.gz dosyası olarak hazırlanan dosya bps ismiyle değiştirilip paketimiz hazırlanır.

	packagecompress() 
	{
	cd /tmp/bps/build/rootfs-${name}-${version}
	tar -cf ../rootfs.tar ./*
	cd /tmp/bps/build/
	xz -9 rootfs.tar
	tar -cvzf paket-${name}-${version}.tar.gz rootfs.tar.xz file.index bpsbuild
	cp paket-${name}-${version}.tar.gz ${dizin}/${paket}/${name}-${version}.bps
	}

	# fonksiyonlar aşağıdaki sırayla çalışacaktır.
	echo "******************** initsetup ******************"; initsetup #bu dosya içindeki fonksiyon
	echo "******************** setup **********************"; setup #bpsbuild dosyasından gelen fonksiyon
	echo "******************** build **********************"; build #bpsbuild dosyasından gelen fonksiyon
	echo "******************** package ********************"; package #bpsbuild dosyasından gelen fonksiyon
	echo "******************** packageindex****************"; packageindex #bu dosya içindeki fonksiyon
	echo "*******************packagecompress***************"; packagecompress #bu dosya içindeki fonksiyon

Burada **readline** paketini örnek alarak **bpspaketle** dosyasının ve **bpsbuild** dosyasının nasıl hazırlandığı anlatıldı.
Diğer paketler için sadece hazırlanacak pakete uygun şekilde **bpsbuild** dosyası hazırlayacağız. **bpspaketle**  dosyamızda değişiklik yapmayacağız. Artık  **bpspaketle**  dosyası paketimizi oluşturan script **bpsbuild** ise hazırlanacak paketin bilgilerini bulunduran script doyasıdır.

.. raw:: pdf

   PageBreak
   
**Paket Yapma**
---------------

Bu bilgilere göre readline paketi nasıl oluşturulur onu görelim. Paketlerimizi oluşturacağımız bir dizin oluşturarak aşağıdaki işlemleri yapalım. Burada yine **readline** paketi anlatılacaktır.


.. code-block:: shell

	mkdir readline
	cd readline
	#readline için hazırlanan bpsbuild dosyası bu konuma oluşturulur ve içeriği readline için oluşturduğumuz bpsbuild içeriği olarak ayarlanır.
	cd ..
	./bpspaketle readline # bpspaketle dosyamızın bu konumda olduğu varsayılmıştır ve parametre olarak readline dizini verilmiştir.

Komut çalışınca readline/readline-8.1.bps dosyası oluşacaktır.
Artık sisteme kurulum için ikili dosya, kütüphaneleri ve dizinleri barındıran paketimiz oluştruldu. Bu paketi sistemimize nasıl kurarız? konusu **Paket Kurma** başlığı altında anlatılacaktır.

.. raw:: pdf

   PageBreak


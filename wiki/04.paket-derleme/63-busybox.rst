busybox
+++++++

BusyBox, Linux tabanlı sistemlerde yaygın olarak kullanılan, birçok temel Unix aracını bir araya getiren bir yazılım paketidir. "İsviçre Ordusu Bıçağı" benzeri bir işlevsellik sunarak, çeşitli komutları tek bir ikili dosya altında toplar. Bu sayede, sistem kaynaklarını verimli bir şekilde kullanarak, özellikle gömülü sistemlerde ve düşük kaynaklı ortamlarda önemli bir rol oynar.

BusyBox, ls, cp, mv, rm gibi temel komutların yanı sıra, ağ yönetimi, dosya sistemleri ve sistem yönetimi gibi birçok alanda işlevsellik sunar. Kullanıcılar, bu komutları BusyBox ile çağırarak, sistem üzerinde etkili bir şekilde işlem yapabilirler. Örneğin, bir dosyayı kopyalamak için aşağıdaki komut kullanılabilir:

.. code-block:: shell
	
	busybox cp kaynak_dosya hedef_dosya

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.36.1"
	name="busybox"
	depends="glibc"
	description="minimal linux araç paketi static derlenmiş hali"
	source="https://busybox.net/downloads/${name}-${version}.tar.bz2"
	group="sys.base"
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

	setup()
	{
		cp -prfv $PACKAGEDIR/files $SOURCEDIR/

		cd $SOURCEDIR
		make defconfig
		sed -i "s|.*CONFIG_STATIC_LIBGCC .*|CONFIG_STATIC_LIBGCC=y|" .config
		sed -i "s|.*CONFIG_STATIC .*|CONFIG_STATIC=y|" .config
	}
	build()
	{

		make 
	}
	package()
	{
		mkdir -p $DESTDIR/bin
		install busybox ${DESTDIR}/bin/busybox
		# install udhcpc script and service
	 	mkdir -p ${DESTDIR}/usr/share/udhcpc/ ${DESTDIR}/etc/init.d/
	    	install $SOURCEDIR/files/udhcpc.script ${DESTDIR}/usr/share/udhcpc/default.script
	    	install $SOURCEDIR/files/udhcpc.openrc ${DESTDIR}/etc/init.d/udhcpc
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/busybox/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **busybox** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(busybox) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak





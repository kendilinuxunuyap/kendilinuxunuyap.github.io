net-tools
+++++++++

net-tools, Linux tabanlı sistemlerde ağ yönetimi için kullanılan klasik bir araçlar paketidir. Bu paket, ifconfig, route, netstat, arp gibi komutları içerir. ifconfig komutu, ağ arayüzlerinin durumunu görüntülemek ve yapılandırmak için kullanılırken, route komutu yönlendirme tablolarını yönetmekte kullanılır. netstat ise ağ bağlantılarını ve istatistiklerini gösterir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="net-tools"
	version="2.10"
	description="GNU regular expression matcher"
	source="https://sourceforge.net/projects/net-tools/files/net-tools-2.10.tar.xz"
	depends=""
	group="sys.apps"
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
	export BINDIR='/usr/bin' SBINDIR='/usr/bin'
		cd $SOURCEDIR/
	   #$SOURCEDIR/configure --prefix=/usr \
	    #    --libdir=/usr/lib64/
	    echo ""
	}

	build(){
	   yes "" | make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	     # the following is provided by yp-tools
	  rm "${DESTDIR}"/usr/bin/{nis,yp}domainname
	  # hostname is provided by inetutils
	  rm "${DESTDIR}"/usr/bin/{hostname,dnsdomainname,domainname}
	  rm -r "${DESTDIR}"/usr/share/man/man1

	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(net-tools) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak




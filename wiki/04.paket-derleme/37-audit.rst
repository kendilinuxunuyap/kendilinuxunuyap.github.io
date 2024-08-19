audit
+++++

Audit paketi, Linux sistemlerinde güvenlik denetimlerini gerçekleştirmek için tasarlanmış bir yazılımdır. Bu paket, sistemdeki önemli olayları, kullanıcı aktivitelerini ve dosya erişimlerini kaydederek, sistem yöneticilerine kapsamlı bir denetim ve izleme imkanı sunar. Audit, özellikle güvenlik ihlallerinin tespit edilmesi ve sistemin uyumluluk gereksinimlerini karşılaması açısından kritik bir rol oynar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="audit"
	version='3.1.1'
	depends=""
	description="servis yöneticisi"
	source="https://github.com/linux-audit/audit-userspace/archive/refs/tags/v$version.tar.gz"
	groups="sys.process"
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
		cp $PACKAGEDIR/files/auditd.initd $BUILDDIR/auditd.initd
		cp $PACKAGEDIR/files/auditd.confd $BUILDDIR/auditd.confd
		
		cd $SOURCEDIR
		./autogen.sh
	    ./configure --prefix=/usr \
		--sysconfdir=/etc \
		--libdir=/usr/lib64 \
		--disable-zos-remote \
		--disable-listener \
		--disable-systemd \
		--disable-gssapi-krb5 \
		--enable-shared=audit \
		    --with-arm \
		    --with-aarch64\
		    --without-python \
		    --without-python3 \
		    --with-libcap-ng=no 
			    
	     
	}
	build()
	{
		make
	}
	package()
	{
		make install DESTDIR=$DESTDIR
		install -Dm755 $BUILDDIR/auditd.initd "$DESTDIR"/etc/init.d/auditd
	    install -Dm755 $BUILDDIR/auditd.confd "$DESTDIR"/etc/conf.d/auditd
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/audit/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **audit** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(audit) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build
  
.. raw:: pdf

   PageBreak





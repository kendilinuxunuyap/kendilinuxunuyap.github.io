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

	setup()
	{
		cp $PACKAGEDIR/files/auditd.initd $SOURCEDIR/auditd.initd
		cp $PACKAGEDIR/files/auditd.confd $SOURCEDIR/auditd.confd
		
		cd $SOURCEDIR
		 autoreconf -fv --install
		 cd $BUILDDIR
	    ../${name}-${version}/configure --prefix=/usr \
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
		install -Dm755 $SOURCEDIR/auditd.initd "$DESTDIR"/etc/init.d/auditd
	    	install -Dm755 $SOURCEDIR/auditd.confd "$DESTDIR"/etc/conf.d/auditd
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





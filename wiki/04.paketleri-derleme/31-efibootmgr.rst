efibootmgr
++++++++++

Nano, terminal tabanlı bir metin düzenleyicidir ve genellikle yeni başlayanlar için tercih edilir. Basit metin düzenleme işlemleri için idealdir ve kullanımı oldukça kolaydır. Özellikle komut satırında hızlıca metin dosyalarını açmak ve düzenlemek isteyenler için pratik bir araçtır. Nano'nun kullanıcı dostu arayüzü, metin içinde gezinmeyi ve düzenlemeyi kolaylaştırır. Temel metin düzenleme işlemleri için tercih edilen bir araç olmasının yanı sıra, kısayol tuşlarıyla da hızlı erişim imkanı sunar.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	#!/usr/bin/env bash
	name="efibootmgr"
	version="18"
	description="Linux user-space application to modify the Intel Extensible Firmware Interface (EFI) Boot Manager."
	source="https://github.com/rhboot/efibootmgr/archive/refs/tags/$version.tar.gz"
	depends="efivar,popt"
	builddepend=""
	group="sys.boot"

	setup(){
		echo ""
	}

	build(){
		cd $SOURCEDIR
	    make sbindir=/usr/bin EFIDIR=/boot/efi PCDIR=/usr/lib64/pkgconfig
	}

	package(){
		EFIDIR="/boot/efi" sbindir=/usr/bin make DESTDIR="$DESTDIR" install
	}


.. raw:: pdf

   PageBreak


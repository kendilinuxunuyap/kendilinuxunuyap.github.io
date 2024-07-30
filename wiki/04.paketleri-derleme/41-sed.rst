sed
+++

Nano, terminal tabanlı bir metin düzenleyicidir ve genellikle yeni başlayanlar için tercih edilir. Basit metin düzenleme işlemleri için idealdir ve kullanımı oldukça kolaydır. Özellikle komut satırında hızlıca metin dosyalarını açmak ve düzenlemek isteyenler için pratik bir araçtır. Nano'nun kullanıcı dostu arayüzü, metin içinde gezinmeyi ve düzenlemeyi kolaylaştırır. Temel metin düzenleme işlemleri için tercih edilen bir araç olmasının yanı sıra, kısayol tuşlarıyla da hızlı erişim imkanı sunar.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	#!/usr/bin/env bash
	name="sed"
	version="4.9"
	description="Super-useful stream editor"
	source="https://ftp.gnu.org/gnu/sed/sed-$version.tar.xz"
	depends="acl"
	group="sys.apps"


	setup(){
	    $SOURCEDIR/configure --prefix=/usr \
		--libdir=/usr/lib64/
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	}

.. raw:: pdf

   PageBreak




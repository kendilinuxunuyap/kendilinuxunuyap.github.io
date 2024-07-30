p7zip
+++++

Nano, terminal tabanlı bir metin düzenleyicidir ve genellikle yeni başlayanlar için tercih edilir. Basit metin düzenleme işlemleri için idealdir ve kullanımı oldukça kolaydır. Özellikle komut satırında hızlıca metin dosyalarını açmak ve düzenlemek isteyenler için pratik bir araçtır. Nanonun kullanıcı dostu arayüzü, metin içinde gezinmeyi ve düzenlemeyi kolaylaştırır. Temel metin düzenleme işlemleri için tercih edilen bir araç olmasının yanı sıra, kısayol tuşlarıyla da hızlı erişim imkanı sunar.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	#!/usr/bin/env bash
	name="p7zip"
	version="17.05"
	url="https://github.com/jinfeihan57/p7zip"
	description="Command-line file archiver with high compression ratio"
	source="https://github.com/p7zip-project/p7zip/archive/refs/tags/v${version}.tar.gz"
	depends="gcc"
	group="app.arch"
	setup()
	{
	cd $SOURCEDIR
	}
	build(){
	    make 7z 7zr 7za $jobs
	}

	package(){
	    make install \
		DEST_DIR="${DESTDIR}" \
		DEST_HOME=/usr
	    mv ${DESTDIR}/usr/lib{,64}
	    sed -i "s/lib/lib64/g" ${DESTDIR}/usr/bin/*
	}


.. raw:: pdf

   PageBreak


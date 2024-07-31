efivar
++++++

Nano, terminal tabanlı bir metin düzenleyicidir ve genellikle yeni başlayanlar için tercih edilir. Basit metin düzenleme işlemleri için idealdir ve kullanımı oldukça kolaydır. Özellikle komut satırında hızlıca metin dosyalarını açmak ve düzenlemek isteyenler için pratik bir araçtır. Nano'nun kullanıcı dostu arayüzü, metin içinde gezinmeyi ve düzenlemeyi kolaylaştırır. Temel metin düzenleme işlemleri için tercih edilen bir araç olmasının yanı sıra, kısayol tuşlarıyla da hızlı erişim imkanı sunar.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama#!/usr/bin/env bash
	name="efivar"
	version="39"
	description="Tools and libraries to work with EFI variables"
	source="https://github.com/rhboot/efivar/archive/refs/tags/$version.tar.gz"
	depends=""
	builddepend=""
	group="sys.libs"

	setup(){
		export ERRORS=''
		export PATH=$PATH:$HOME
		# fake mandoc for ignore extra dependency
	    echo "exit 0" > $HOME/mandoc
	    chmod +x $HOME/mandoc
	}

	build(){
		cd $SOURCEDIR
	    make
	}

	package(){
		local make_options=(
	    V=1
	    libdir=/usr/lib64/
	    bindir=/usr/bin/
	    mandir=/usr/share/man/
	    includedir=/usr/include/
		)
	    make DESTDIR=$DESTDIR "${make_options[@]}" install
	}


.. raw:: pdf

   PageBreak


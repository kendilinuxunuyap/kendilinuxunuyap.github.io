findutils
+++++++++

Nano, terminal tabanlı bir metin düzenleyicidir ve genellikle yeni başlayanlar için tercih edilir. Basit metin düzenleme işlemleri için idealdir ve kullanımı oldukça kolaydır. Özellikle komut satırında hızlıca metin dosyalarını açmak ve düzenlemek isteyenler için pratik bir araçtır. Nanonun kullanıcı dostu arayüzü, metin içinde gezinmeyi ve düzenlemeyi kolaylaştırır. Temel metin düzenleme işlemleri için tercih edilen bir araç olmasının yanı sıra, kısayol tuşlarıyla da hızlı erişim imkanı sunar.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama

	name="findutils"
	version="4.9.0"
	description="GNU utilities for finding files"
	source="https://ftp.gnu.org/gnu/findutils/findutils-$version.tar.xz"
	depends=""
	group="sys.apps"


	setup(){
	    cd $SOURCEDIR
	    ./configure --prefix=/usr \
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




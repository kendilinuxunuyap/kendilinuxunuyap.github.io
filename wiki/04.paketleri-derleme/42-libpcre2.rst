llibpcre2
+++++++++

Nano, terminal tabanlı bir metin düzenleyicidir ve genellikle yeni başlayanlar için tercih edilir. Basit metin düzenleme işlemleri için idealdir ve kullanımı oldukça kolaydır. Özellikle komut satırında hızlıca metin dosyalarını açmak ve düzenlemek isteyenler için pratik bir araçtır. Nanonun kullanıcı dostu arayüzü, metin içinde gezinmeyi ve düzenlemeyi kolaylaştırır. Temel metin düzenleme işlemleri için tercih edilen bir araç olmasının yanı sıra, kısayol tuşlarıyla da hızlı erişim imkanı sunar.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	#!/usr/bin/env bash
	version="10.40"
	name="libpcre2"
	description="Perl-compatible regular expression library"
	source="https://github.com/PCRE2Project/pcre2/releases/download/pcre2-${version}/pcre2-${version}.tar.gz"
	depends="readline"
	group="dev.libs"

	setup()
	{
	     ../${name}-${version}/configure --prefix=/usr \
	    	--libdir=/lib64 \
		    --enable-shared \
		    --enable-static \
		--enable-pcre2-16 \
		--enable-pcre2-32 \
		--enable-jit \
		--enable-pcre2test-libreadline 
	}
	build()
	{
		make 
	}
	package()
	{
		
		make install DESTDIR=$DESTDIR
	}


.. raw:: pdf

   PageBreak




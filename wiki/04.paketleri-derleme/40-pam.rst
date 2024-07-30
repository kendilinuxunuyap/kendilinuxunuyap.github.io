pam
+++

Nano, terminal tabanlı bir metin düzenleyicidir ve genellikle yeni başlayanlar için tercih edilir. Basit metin düzenleme işlemleri için idealdir ve kullanımı oldukça kolaydır. Özellikle komut satırında hızlıca metin dosyalarını açmak ve düzenlemek isteyenler için pratik bir araçtır. Nanonun kullanıcı dostu arayüzü, metin içinde gezinmeyi ve düzenlemeyi kolaylaştırır. Temel metin düzenleme işlemleri için tercih edilen bir araç olmasının yanı sıra, kısayol tuşlarıyla da hızlı erişim imkanı sunar.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama

	#!/usr/bin/env bash
	name="pam"
	version="1.6.0"
	depends="libtirpc,libxcrypt,libnsl,audit"
	description="PAM (Pluggable Authentication Modules) library'"
	source="https://github.com/linux-pam/linux-pam/releases/download/v$version/Linux-PAM-$version.tar.xz"
	groups="sys.libs"
	setup()
	{
	    ../${name}-${version}/configure --prefix=/usr \
		--sbindir=/usr/sbin \
		--libdir=/usr/lib64 \
		--enable-securedir=/usr/lib64/security \
		--enable-static \
		--enable-shared \
		--disable-nls \
		--disable-selinux \
		--disable-db
			    
	     
	}
	build()
	{
		make
	}
	package()
	{
		make install DESTDIR=$DESTDIR
		chmod +s "$DESTDIR"/usr/sbin/unix_chkpwd
	}

.. raw:: pdf

   PageBreak





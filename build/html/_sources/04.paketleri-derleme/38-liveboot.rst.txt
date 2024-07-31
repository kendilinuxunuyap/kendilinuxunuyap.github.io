liveboot
++++++++

Nano, terminal tabanlı bir metin düzenleyicidir ve genellikle yeni başlayanlar için tercih edilir. Basit metin düzenleme işlemleri için idealdir ve kullanımı oldukça kolaydır. Özellikle komut satırında hızlıca metin dosyalarını açmak ve düzenlemek isteyenler için pratik bir araçtır. Nanonun kullanıcı dostu arayüzü, metin içinde gezinmeyi ve düzenlemeyi kolaylaştırır. Temel metin düzenleme işlemleri için tercih edilen bir araç olmasının yanı sıra, kısayol tuşlarıyla da hızlı erişim imkanı sunar.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama

	version="1230131"
	name="live-boot"
	depends="glibc,acl,openssl"
	description="shell ve network copy"
	source="https://salsa.debian.org/live-team/live-boot/-/archive/debian/1%2520230131/live-boot-debian-1%2520230131.tar.gz"
	groups="sys.kernel"
	setup()
	{
		echo "test"
		cd $SOURCEDIR
	}
	build()
	{
		make 
	}
	package()
	{
		make install DESTDIR=$DESTDIR
		sed -i "s/copy_exec \/bin\/mount \/bin/copy_exec \/usr\/bin\/mount \/bin/g" $DESTDIR/usr/share/initramfs-tools/hooks/live
	}


.. raw:: pdf

   PageBreak




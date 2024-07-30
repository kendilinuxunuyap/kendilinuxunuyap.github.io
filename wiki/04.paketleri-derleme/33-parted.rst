parted
++++++

Nano, terminal tabanlı bir metin düzenleyicidir ve genellikle yeni başlayanlar için tercih edilir. Basit metin düzenleme işlemleri için idealdir ve kullanımı oldukça kolaydır. Özellikle komut satırında hızlıca metin dosyalarını açmak ve düzenlemek isteyenler için pratik bir araçtır. Nanonun kullanıcı dostu arayüzü, metin içinde gezinmeyi ve düzenlemeyi kolaylaştırır. Temel metin düzenleme işlemleri için tercih edilen bir araç olmasının yanı sıra, kısayol tuşlarıyla da hızlı erişim imkanı sunar.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama

	version="3.6"
	name="parted"
	depends="glibc"
	description="disks tools"
	source="https://ftp.gnu.org/gnu/parted/parted-${version}.tar.xz"
	groups="sys.block"
	setup()
	{
		../${name}-${version}/configure --prefix=/usr \
		--libdir=/usr/lib64/ \
		--sbindir=/usr/bin \
		--disable-rpath \
		--disable-device-mapper
		
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




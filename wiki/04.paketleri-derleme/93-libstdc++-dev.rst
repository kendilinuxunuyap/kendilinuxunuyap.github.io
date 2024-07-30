libstdc++-dev
+++++++++++++

Nano, terminal tabanlı bir metin düzenleyicidir ve genellikle yeni başlayanlar için tercih edilir. Basit metin düzenleme işlemleri için idealdir ve kullanımı oldukça kolaydır. Özellikle komut satırında hızlıca metin dosyalarını açmak ve düzenlemek isteyenler için pratik bir araçtır. Nanonun kullanıcı dostu arayüzü, metin içinde gezinmeyi ve düzenlemeyi kolaylaştırır. Temel metin düzenleme işlemleri için tercih edilen bir araç olmasının yanı sıra, kısayol tuşlarıyla da hızlı erişim imkanı sunar.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama

	version="13.2.0-25"
	name="libstdc++-dev"
	depends=""
	description="temel dağıtım kernel dosyası ve moduller"
	source=""
	groups="sys.base"
	setup()
	{
		echo ""
		# deb dosyası indirilirhttp://ftp.tr.debian.org/debian/pool/main/g/gcc-13/
		cd $SOURCEDIR
		wget -O image.deb http://ftp.tr.debian.org/debian/pool/main/g/gcc-13/libstdc%2B%2B-13-dev_13.2.0-25_amd64.deb
		# ar x indirilen dosya
		ar x image.deb
		# tar -xf data.tar.xz
		tar -xf data.tar.xz
		# find ./ -iname "*" -exec unxz {} \; komutuyla xz açılır
		

		
	}
	build()
	{
		echo ""
	}
	package()
	{
		cd $BUILDDIR
		mkdir -p ${DESTDIR}/usr
		cp -prfv usr/include  ${DESTDIR}/usr/
	}


.. raw:: pdf

   PageBreak




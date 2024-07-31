kernel
+++++

Nano, terminal tabanlı bir metin düzenleyicidir ve genellikle yeni başlayanlar için tercih edilir. Basit metin düzenleme işlemleri için idealdir ve kullanımı oldukça kolaydır. Özellikle komut satırında hızlıca metin dosyalarını açmak ve düzenlemek isteyenler için pratik bir araçtır. Nanonun kullanıcı dostu arayüzü, metin içinde gezinmeyi ve düzenlemeyi kolaylaştırır. Temel metin düzenleme işlemleri için tercih edilen bir araç olmasının yanı sıra, kısayol tuşlarıyla da hızlı erişim imkanı sunar.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama

	version="6.8.12"
	name="linux-image"
	depends=""
	description="temel dağıtım kernel dosyası ve moduller"
	source=""
	groups="sys.base"
	setup()
	{
		echo ""
		# deb dosyası indirilir http://ftp.tr.debian.org/debian/pool/main/l/linux-signed-amd64/
		cd $SOURCEDIR
		wget -O image.deb http://ftp.tr.debian.org/debian/pool/main/l/linux-signed-amd64/linux-image-6.8.12-amd64_6.8.12-1_amd64.deb
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
		cp -prfv boot  ${DESTDIR}/
		#cp -prfv $dizin/$name/etc  ${DESTDIR}/
		cp -prfv lib  ${DESTDIR}/
		find ${DESTDIR}/ -iname "*" -exec unxz {} \;
		
	}

.. raw:: pdf

   PageBreak





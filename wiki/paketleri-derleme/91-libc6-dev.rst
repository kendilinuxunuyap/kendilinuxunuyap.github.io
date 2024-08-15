libc6-dev
+++++++++

Nano, terminal tabanlı bir metin düzenleyicidir ve genellikle yeni başlayanlar için tercih edilir. Basit metin düzenleme işlemleri için idealdir ve kullanımı oldukça kolaydır. Özellikle komut satırında hızlıca metin dosyalarını açmak ve düzenlemek isteyenler için pratik bir araçtır. Nanonun kullanıcı dostu arayüzü, metin içinde gezinmeyi ve düzenlemeyi kolaylaştırır. Temel metin düzenleme işlemleri için tercih edilen bir araç olmasının yanı sıra, kısayol tuşlarıyla da hızlı erişim imkanı sunar.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama

	version="2.38-6"
	name="libc6-dev"
	depends=""
	description="temel dağıtım kernel dosyası ve moduller"
	source=""
	groups="sys.base"
	setup()
	{
		echo ""
		# deb dosyası indirilir http://ftp.tr.debian.org/debian/pool/main/g/glibc/libc6-dev_2.38-5_amd64.deb
		#cd $SOURCEDIR
		wget -O libc.deb http://ftp.tr.debian.org/debian/pool/main/g/glibc/libc6-dev_2.38-6_amd64.deb
		# ar x indirilen dosya
		ar x libc.deb
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
		
		cp -prfv usr  ${DESTDIR}/
		find ${DESTDIR}/ -iname "*" -exec unxz {} \;
		rm -rf ${DESTDIR}/usr/lib
	}


.. raw:: pdf

   PageBreak




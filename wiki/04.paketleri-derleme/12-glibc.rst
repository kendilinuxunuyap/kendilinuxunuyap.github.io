glibc
+++++

**glibc** dağıtımda sistemdeki bütün uygulamaların çalışmasını sağlayan en temel C kütüphanesidir. GNU C Library(glibc)'den farklı diğer C standart kütüphaneler şunlardır: Bionic libc, dietlibc, EGLIBC, klibc, musl, Newlib ve uClibc. **glibc** yerine alternatif olarak çeşitli avantajlarından dolayı kullanılabilir. **glibc** en çok tercih edilen ve uygulama (özgür olmayan) uyumluluğu bulunduğu için bu dokümanda glibc üzerinden anlatım yapılacaktıdır. 


glibc (GNU C Kütüphane) Linux sistemlerinde kullanılan bir C kütüphanesidir. Bu kütüphane, C programlama dilinin temel işlevlerini sağlar ve Linux çekirdeğiyle etkileşimde bulunur. **glibc** listemizdeki tüm paketlerin çalışması için temel kütüphanedir. Bundan dolayı ilk olarak derleyeceğiiz pakettir.

Derleme
-------

.. code-block:: shell

	mkdir -p  /$HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf /$HOME/distro/build/* #içeriği temizleniyor
	cd /$HOME/distro/build #dizinine geçiyoruz
	wget https://ftp.gnu.org/gnu/libc/glibc-2.38.tar.gz # glibc kaynak kodunu indiriyoruz.
	tar -xvf glibc-2.38.tar.gz # glibc kaynak kodunu açıyoruz.
	cd glibc-2.38
	configure --prefix=/ --disable-werror # Derleme ayarları yapılıyor
	make # glibc derleyelim.

Yükleme
-------

.. code-block:: shell

	make install DESTDIR=$HOME/distro/rootfs # Ev Dizinindeki /distro/rootfs dizinine glibc yükleyelim.

Test Etme
---------

glibc kütüphanemizi **$HOME/distro/rootfs** komununa yükledik. Şimdi bu kütüphanenin çalışıp çalışmadığını test edelim.

Aşağıdaki c kodumuzu derleyelim ve **$HOME/distro/rootfs** konumuna kopyalayalım. **$HOME/** (ev dizinimiz) konumuna dosyamızı oluşturup aşağıdaki kodu içine yazalım.


.. code-block:: shell

	#include<stdio.h>
	void main()
	{
	puts("Merhaba Dünya");
	}

Program Derleme
................

Aşağıdaki komutlarla merhaba.c dosyası derlenir.

.. code-block:: shell
	
	cd $HOME
	gcc -o merhaba merhaba.c 

Program Yükleme
...............

Derlenen çalışabilir merhaba dosyamızı **glibc** kütüphanemizin olduğu dizine yükleyelim. 

.. code-block:: shell
	
	cp merhaba $HOME/distro/rootfs/merhaba # derlenen merhaba ikili dosyası $HOME/distro/rootfs/ konumuna kopyalandı.

Programı Test Etme
..................

**glibc** kütüphanemizin olduğu dizin dağıtımızın ana dizini oluyor.  **$HOME/distro/rootfs/** konumuna **chroot** ile erişelim.

Aşağıdaki gibi çalıştırdığımızda bir hata alacağız.

.. code-block:: shell

	sudo chroot $HOME/distro/rootfs/ /merhaba
	chroot: failed to run command ‘/merhaba’: No such file or directory
	
Hata Çözümü
...........

.. code-block:: shell
	
	# üstteki hatanın çözümü sembolik bağ oluşturmak.
	cd $HOME/distro/rootfs/
	ln -s lib lib64

#merhaba dosyamızı tekrar chroot ile çalıştıralım. Aşağıda görüldüğü gibi hatasız çalışacaktır.

.. code-block:: shell
	
	sudo chroot $HOME/distro/rootfs/ /merhaba
	Merhaba Dünya

**Merhaba Dünya** mesajını gördüğümüzde glibc kütüphanemizin  ve merhaba çalışabilir dosyamızın çalıştığını anlıyoruz. 
Bu aşamadan sonra **Temel Paketler** listemizde bulunan paketleri kodlarından derleyerek **$HOME/distro/rootfs/** dağıtım dizinimize yüklemeliyiz.
Derlemede **glibc** kütüphanesinin derlemesine benzer bir yol izlenecektir. **glibc** temel kütüphane olması ve ilk derlediğimiz paket olduğu için detaylıca anlatılmıştır.

**glibc** kütüphanemizi derlerken yukarıda yapılan işlem adımlarını ve hata çözümlemesini bir script dosyasında yapabiliriz. Bu dokümanda altta paylaşılan script dosyası yöntemi tercih edildi. Aslında yukarıdaki işlem adımlarının aynısını bir dosya içerisine eklemiş olduk. Tek tek çalıştırmak yerine bir script dosya içine eklemeyerek tek bir işlem adımıyla tüm aşamalar çalıştırılabilir.

.. code-block:: shell
	
	# tanımlamalar
	version="2.38"
	name="glibc"
	
	# derleme yerinin hazırlanması
	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz
	wget https://ftp.gnu.org/gnu/libc/${name}-${version}.tar.gz
	tar -xvf ${name}-${version}.tar.gz
	cd ${name}-${version} # Kaynak kodun içine giriliyor
	
	# derleme öncesi paketin ayarlanması
	./configure --prefix=/ --disable-werror
	
	# derleme
	make 
	
	# derlenen paketin yüklenmesi ve ayarlamaların yapılması
	make install DESTDIR=$HOME/distro/rootfs
	cd $HOME/distro/rootfs/
	ln -s lib lib64

Diğer paketlerimizde de **glibc** için paylaşılan script dosyası gibi dosyalar hazırlayıp derlenecektir.
Yukarıda paylaşılan **script** dosya tekrar düzenlenerek aşağıda son haline getirilecektir. Aşağıda paylaşılan **script** dosya üstteki script dosyadan bir farkı yok. Sadece fonksiyonel hale getirilerek daha anlaşılır ve kontrol edilebilir hale getiriyoruz. Son halinin şablon script dosyası ve ona uygun **glibc** scriptinini hazırlanmış hali aşağıda verilmiştir.

Şablon Script Dosyası
---------------------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version=""
	name=""
	depends=""
	description=""
	source=""
	groups=""
	initsetup(){
		# Paketin kaynak dosyalarının indirilmesi
	}
	setup(){
		#Derleme öncesi kaynak dosyaların sisteme göre ayarlanması
	}
	build(){
		#Paketin derlenmesi
	}
	package(){
		# Derlenen dosyaları yükleme öncesi ayar ve yükleme işleminin yapılması
	}

	initsetup 	# initsetup fonksiyonunu çalıştırır ve kaynak dosyayı inidirir
	setup		# setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build		# build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package		# package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
	
Şablon dosyasındaki her bir fonksiyonu aslında **glibc** için paylaşılan script dosya ve öncesinde adım adım yaptığımız işlemleri kapsamaktadır. Biz bu işlem adımlarını şablon dosyamızın ilgili fonksiyonlarına aşama aşama yaptığımız işlemleri ayrıştıracağız.
 

glibc Script Dosyası
--------------------
Debian ortamında bu paketin derlenmesi için;
**sudo apt install make autotools gawk diffutils gcc gettext grep perl sed texinfo** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="2.39"
	name="glibc"
	depends=""
	description="temel kütüphane"
	source="https://ftp.gnu.org/gnu/libc/${name}-${version}.tar.gz"
	groups="sys.base"
	export CC="gcc"
	export CXX="g++"
	BUILDDIR="$HOME/distro/build" #Derleme yapılan dizin
	DESTDIR="$HOME/distro/rootfs" #paketin yükleneceği sistem konumu
	
	initsetup(){
		mkdir -p  $BUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $BUILDDIR/* #içeriği temizleniyor
		cd $BUILDDIR #dizinine geçiyoruz
		wget ${source}
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		mv $director ${name}-${version};
	}

	setup()
	{
	    	${name}-${version}/configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info \
	    	--enable-bind-now --enable-multi-arch --enable-stack-protector=strong --enable-stackguard-randomization \
		--disable-crypt --disable-profile --disable-werror --enable-static-pie --enable-static-nss --disable-nscd \
		--host=x86_64-pc-linux-gnu --libdir=/lib64 --libexecdir=/lib64/glibc
	}
	build()
	{
		cd $BUILDDIR
		make -j5 #-C $DESTDIR all

	}
	package()
	{
	    	mkdir -p ${DESTDIR}/lib64
		cd $DESTDIR
		ln -s lib64 lib
		cd $BUILDDIR 
		make install DESTDIR=$DESTDIR 

	    
	}

	initsetup 	# initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup		# setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build		# build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package		# package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


**glibc** script dosyasına benzer yapıda diğer paketler içinde script dosyası oluşturulacaktır. Bu sayede her aşamayı tek tek yazma gibi iş yükü olmayacak ve paket derlenirken hangi fonksiyonda(initsetup, setup vb.) sorun yaşanırsa o fonksiyon üzerinden hata ayıklama yapılacaktır.
Bu şekilde bir script dosyasına ileri aşamalarda daha yeni özellikler katma ve kontrol etmeye imkan sağlayacaktır. glibc scriptide dahil sonraki aşalarda yapacağınız çalıştıracağınız script dosyaları bir dizin içinde sırasıyla(1-glibc vb) saklamanızı tavsiye ederim. Daha sonra bu işlemleri tekrarlamanız durumunda hangi sırayla paketleri derleyeceğinizi anlamanız ve hızlıca paketleri derlemenizi kolaylaştıracaktır.

`tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/glibc>`_

`tıklayınız. <https://kendilinuxunuyap.github.io/_download/glibc>`_

.. raw:: pdf

   PageBreak





.. image:: /_static/logo.png
  :width: 1000
  :align: center



.. raw:: pdf

   PageBreak

Yazar
+++++
- Bayram KARAHAN

Dizgi
+++++
- Bayram KARAHAN
- Celalettin AKARSU


Paket Derleme
+++++++++++++
- Bayram KARAHAN
- Celalettin AKARSU


Kod Testi
+++++++++
- Bayram KARAHAN
- Celalettin AKARSU
- Emrah KÖSETÜRK

.. raw:: pdf

   PageBreak

Ön Söz
======

Bu kitap, açık kaynak ve özgür yazılıma gönül vermiş kişilerin, Türkçe kaynak bulamama sıkıntısına bir çözüm olarak hayata geçirilmiş bir projedir. Açık kaynak dünyasında kendi dağıtımlarını yapmak isteyen kişilere bir rehber olacak şekilde hazırlanmıştır. Bu dokümanda anlatılan sıralamaya göre işlemleri uyguladığınızda kendi sisteminiz derleyip iso halinde son kullanıcını kullanabileceği gibi bir sistem ortaya çıkartabilirsiniz. 


.. raw:: pdf

   PageBreak

İçindekiler
===========

.. list-table::
   :widths: 60 10

   * - 1- :ref:`giris`
     - 3
   * - 2- :ref:`onhazirlik`
     - 3
   * - 3- :ref:`derlemearaclari`
     - 8
   * - 4- :ref:`paketderleme`
     - 13
   * - 5- :ref:`paketsistemi`
     - 98
   * - 6- :ref:`isohazirlama`
     - 113
   * - 7- :ref:`sistemkurulumu`
     - 117
   * - 8- :ref:`xderleme`
     - 126
   * - 9- :ref:`yardimcikonular`
     - 131
 
.. raw:: pdf

   PageBreak

.. footer:: ###Page###

.. toctree::

**Temel Kavramlar**
+++++++++++++++++++

**Linux Nedir?**
----------------

Linux; Linux çekirdeğine dayalı, açık kaynak kodlu, Unix benzeri bir işletim sistemi ailesidir. GNU Genel Kamu Lisansı versiyon 2 ile sunulan ve Linux Vakfı çatısı altında geliştirilen bir özgür yazılım projesidir. Linux, “Linus Torvalds” tarafından geliştirilmeye başlanmıştır. Günümüzde bilgisayarlarda, akıllı cihazların ve internet altyapısında kullanılan cihazların işletim sistemlerinde yaygın olarak kullanılmaktadır.[https://tr.wikipedia.org/wiki/Linux]

**Açık Kaynak Nedir?**
----------------------

Açık kaynak terimi, yazılım geliştirme sürecinde kaynak kodunun genel olarak erişilebilir ve değiştirilebilir olduğu bir modeli ifade eder. Bu yaklaşım, yazılımın geliştirilmesine katkıda bulunanların kodu incelemesine, değiştirmesine ve geliştirmesine olanak tanır. Açık kaynaklı yazılımlar genellikle topluluklar tarafından desteklenir ve geliştirilir, bu da geniş bir bilgi ve deneyim havuzundan faydalanmayı sağlar. Bu model, yazılımın sürekli olarak gelişmesine ve iyileştirilmesine olanak tanırken, kullanıcılar için de esneklik ve özgürlük sağlar.

**Dağıtım Nedir ve Türleri**
----------------------------

GNU, uygulamalar, kütüphaneler, geliştirici araçları, hatta oyunların bir arada olduğu Unix benzeri bir işletim sistemidir.
Linux çekirdeği kullanılarak oluşturulan işletim sistemlerini tanımlamak için yaygın olarak Linux ismi kullanılmaktadır. Mesela, Linux çekirdeği ve GNU araçları bir araya getirilerek oluşturulan bir işletim sistemi “GNU/Linux dağıtımı” olarak adlandırılır, ancak konuşma dilinde kısaca (yanlış da olsa) Linux olarak ifade edilmektedir.

1. Clonezilla İmaj
2. Dağıtım Editleme
3. Paket sistemi yazma

**Yazılım Bağımlılığı**
-----------------------

İşletim sistemi tekeli, belirli bir işletim sisteminin pazar payının diğer işletim sistemlerine göre belirgin şekilde yüksek olması durumunu ifade eder. Bu durumda, belirli bir işletim sistemi diğer alternatiflerine kıyasla daha yaygın olarak kullanılır ve genellikle bu işletim sisteminin sahibi veya geliştiricisi, pazarda belirleyici bir konuma sahip olabilir.

Linux gibi açık kaynaklı işletim sistemleri, işletim sistemi tekeline alternatif oluşturabilir ve çeşitliliği artırabilir. Bu sayede kullanıcılar farklı seçeneklere sahip olabilir ve rekabet teşvik edilebilir.

İşletim sistemi tekeli kavramı, pazar analizlerinde, rekabet politikalarında ve tüketici hakları açısından önemli bir konudur. Bu bağlamda, işletim sistemi çeşitliliği ve rekabetin desteklenmesi, kullanıcıların daha iyi hizmet ve ürün seçeneklerine erişimini sağlayabilir.


.. raw:: pdf

   PageBreak


.. _giris:
Temel Kavramlar
===============

Dağıtım Ortamın Hazırlanması
++++++++++++++++++++++++++++

Dağıtım hazırlarken sistemin derlenmesi ve gerekli ayarlamaların yapılabilmesi için bir linux dağıtımı gerekmektedir. Tecrübeli olduğunuz bir dağıtımı seçmeniz uygun olur. Fakat seçilecek dağıtım Gentoo olması daha hızlı ve sorunsuz sürece devam etmenizi sağlayacaktır.
Bu dağıtımı hazırlaken Debian dağıtımı kullanıldı. Bazı paketler için, özellikle bağımlılık sorunları yaşanan paketler için ise Gentoo kullanıldı.

Bir dağıtım hazırlamak için çeşitli paketler lazımdır. Bu paketler;

- **debootstrap	:** Dağıtım hazırlarken kullanılacak chroot uygulaması bu paket ile gelmektedir. chroot ayrı bir konu başlığıyla anlatılacaktır.
- **make	:** Paket derlemek için uygulama
- **squashfs-tools:** Hazırladığımız sistemi sıkıştırılmış dosya halinde sistem görüntüsü oluşturmamızı sağlayan paket.
- **gcc		:** c kodlarımızı derleyeceğimiz derleme aracı.
- **wget	:** tarball vb. dosyaları indirmek için kullanılacak uygulama.
- **unzip	:** Sıkıştırmış zip dosyalarını açmak için uygulama
- **xz-utils	:** Yüksek sıkıştırma yapan sıkıştırma uygulaması
- **tar		:** tar uzantılı dosya sıkıştırma ve açma içiçn kullanılan uygulama.
- **zstd	:** Yüksek sıkıştırma yapan sıkıştırma uygulaması 
- **grub-mkrescue :** Hazırladığımız iso dizinini iso yapmak için kullanılan uygulama
- **qemu-system-x86:** iso dosyalarını test etmek ve kullanmak için sanal makina emülatörü uygulaması.


.. code-block:: shell

	sudo apt update
	sudo apt install debootstrap xorriso mtools make squashfs-tools gcc wget unzip xz-utils tar zstd -y


Paket kurulumu yapıldıktan sonra dağıtımı hazırlayacağımız yeri(hedefi) belirlemeliyiz. Bu dokümanda sistem için kurulum dizini $HOME/distro/rootfs olarak kullanacağız.

**$HOME:** Bu ifade linux ortamında açık olan kullanıncının ev dizinini ifade eder. Örneğin sisteme giriş yapan kullanıcı  **ogrenci** adinda bir kullanıcı olsun. **$HOME** ifadesi **/home/ogrenci** konumunu ifade eder.


.. raw:: pdf

   PageBreak


Minimal Dağıtım Oluşturma
++++++++++++++++++++++++++

Bu minimal dağıtımı oluşturmamızın amacı bu dokümanda anlatılacak dağıtım hazırlama aşamalarını anlaşılması içindir.
Dağıtım oluşturmak için kernel ve busybox dosyalarımızın olması yeterlidir. **busybox** dosyasının nasıl elde edileceği busybox bölümünde anlatılmıştır. **kernel** ise mevcut sistemimin kernelini kullanacağız. kernel **/boot/vmlinux** konumundan alabiliriz.

Bu sistemi hazırlarken **chroot** ve **busybox** komutlarını  kullanarak sistemi hazırlayacağız ve test edeceğiz. **chroot** ve **busybox** kullanımı için dokümandanki ilgili konu başlığına bakınız.

Sistemimiz için aşağıdaki gibi bir yapı oluşturmalıyız. 

1. $HOME/distro/rootfs/busybox
2. $HOME/distro/rootfs/init
3. $HOME/distro/iso/boot/initrd.img
4. $HOME/distro/iso/boot/vmlinuz
5. $HOME/distro/iso/boot/grub/grub.cfg
6. $HOME/distro/distro.iso

Linux sisteminin açılabilmesi için 3., 4. ve 5. sıradaki gösterilen konumdaki dosyaların olması yeterli. 
Bu üç dosyayı yukarıda belirtildiği gibi dizin konumlarına koyduktan sonra, **grub-mkrescue $HOME/distro/iso/ -o $HOME/distro/distro.iso**  komutuyla **distro.iso** dosyası elde ederiz. Artık 6. sırada belirtilen iso dosyamız boot edebilen şekilde hazırlanmış olur. 

Sistemi oluşturan **3., 4. ve 5.** sırada belirtlen dosyalarımız görevi şunlardır. 

**$HOME/distro/iso/boot/initrd.img:** 
Dosyasını sistemin açılış sürecinden ön işlemleri yapmak ve gerçek sisteme geçiş sürecini yöneten bir dosyadır. Yazın devamında nasıl hazırlanacağı anlatılacaktır. 

**$HOME/distro/iso/boot/vmlinuz:** 
Dosyamız kernelimiz oluyor. Ben kullandığım debian sisteminin mevcut kernelini kullandım. İstenirse kernel derlenebilir. 

**$HOME/distro/iso/boot/grub/grub.cfg:** 
Dosyamız ise initrd.img ve vmlinuz dosyalarının grub yazılımının nereden bulacağını gösteren yapılandırma dosyasıdır.

Bir linux sisteminin açılış süreci şu şekilde olmaktadır.
 
1. **Bilgisayara Güç Verilmesi**
2. **Bios İşlemleri Yapılıyor(POST)**
3. **LILO/GRUB Yazılımı Yükleniyor(grub.cfg dosyası okunuyor ve vmlinuz ve initrd.img devreye giriyor)**
4. **vmlinuz initrd.img sistemini belleğe yüklüyor**
5. **initrd.img içindeki init dosyasındaki işlem sürecine göre sistem işlemlere devam ediyor**

Yazının devamında sistem için gerekli olan 3 temel dosyanın hazırlanması ve iso yapılma süreci anlatılacaktır.
Şimdi sırasıyla dosya konumlarına uygun şekilde dizin ve dosyalarımızı oluşturalım.

**Dizinlerin Oluşturulması**
----------------------------

Sitemimizi istediğimiz bir yerde terminal açarak aşağıdaki komutları sırasıyla çalıştıralım.
Komutları kopyala yapıştır yapabilirsiniz.

.. code-block:: shell

	mkdir $HOME/distro
	mkdir $HOME/distro/rootfs
	mkdir $HOME/distro/iso
	mkdir $HOME/distro/iso/boot
	mkdir $HOME/distro/iso/boot/grub

**$HOME/distro/rootfs/busybox**
-------------------------------

busybox aşağıdaki komutlarla  **$HOME/distro/rootfs/busybox** konumuna kopyalanak sistemimiz için hazır hale getirilir.
Bu sistemi debian ortamında hazırlamaktayız. İsterseniz static busybox derleyebilirsiniz. busybox konusu altında anlatılmaktadır.
isterseniz derlemeden mevcut sistemin altında bulunan static busybox kullanabiliriz. 
Eğer yoksa **sudo apt install busybox-static -y** komutuyla debian sistemimize static busybox yükleyebiliriz. Ben debian üzerine yüklediğim busybox'ı kullanacağım. Eğer sistemde yoksa **sudo apt install busybox-static -y** komutuyla yükleyiniz.

.. code-block:: shell
	
	cd $HOME/distro/rootfs
	cp /bin/busybox $HOME/distro/rootfs/busybox	
	ldd ./busybox	 
	özdevimli bir çalıştırılabilir değil

"özdevimli bir çalıştırılabilir değil" dinamik değil diyor yani static kısacası bir bağımlılığı yok demektir.
Eğer bağımlılığı olsaydı bağımlı olduğu dosyalarıda konumlarına göre kopyalamamız gerekmekteydi.

**$HOME/distro/rootfs/init**
----------------------------

Sistem açılırken iki dosyayı arar kernel ve initrd.img dosyası. Bu dosyaları grub.cfg dosyası içinde verilen konumlarına göre arar. Bu dosyaları bulduktan sonra initrd.img dosyasını açar ve içinde init dosyasını arar. init dosyasındaki komutları sırasıyla çalıştırır. 

**$HOME/distro/rootfs/** konumuna **init** text dosyası oluşturulur(nano, gedit vb.).
Aşağıdaki içerik oluşturulan **init** dosyası içine eklenir.

.. code-block:: shell

	#!busybox ash
	PATH=/bin
	/busybox mkdir /bin
	/busybox --install -s /bin
	/busybox ash

**busybox** içerisinde linux ortamında kullanılan hemen hemen tüm komutların yerine kullanalılabilir. Bulunduğumuz ortamda **busybox** dışında hiçbir komutun olmadığını düşünün. Mesela **cp** komutuna ihtiyacınız var bu durumda **busybox cp** yazarak kullanılabilirsiniz. Tüm temel komutları busyboxtan türetmek için  **/busybox --install -s /bin** komutunu kullanabilirsiniz.

Buradaki komutları sırayla anlatırsak;

1. #!busybox ash: ash bir kabuk veya terminal programıdır.
2. PATH=/bin: komutlar çalışırken nerede arayacağı belirtiliyor
3. /busybox mkdir /bin: **busybox mkdir**  yardımıyla **/bin** dizini oluşturuluyor.
4. /busybox --install -s /bin: **/bin** dizinine tüm komutları kısa yol oluşturur.
5. /busybox ash: ash terminalini çalıştırır. Bash yerine alternatif.

**kernel**, **initrd.img** dosyasını bellek üzerine açıp **init** dosyasını çalıştırınca sırasıyla numaralandırılarak anlattığımız işlemler yapılacak ve çalışabilecek ortam hazırlanacaktır. Daha sonra ash terminali çalışarak kullanıcının kullanımına hazır hale gelecektir.
	
init çalıştırılabilir yapılır.

.. code-block:: shell

	chmod +x init #komutu ile çalıştırılır yapılır.

**$HOME/distro/iso/boot/initrd.img**
------------------------------------

initrd.img dosyası için aşağıdaki komutlar çalıştırılır

.. code-block:: shell

	cd $HOME/distro/rootfs
	find ./ | cpio -H newc -o >$HOME/distro/iso/boot/initrd.img	

Oluşturulan **initrd.img** dosyası çalışacak tty açacak(konsol elde etmiş olacağız). 
Aslında bu işlemi yapan şey **busybox** ikili dosyası.

**$HOME/distro/iso/boot/vmlinuz**
---------------------------------

.. code-block:: shell

	cp /boot/vmlinuz* $HOME/distro/iso/boot/vmlinuz  #sistemde kullandığım kerneli kopyaladım istenirde kernel derlenebilir.


**$HOME/distro/iso/boot/grub/grub.cfg**
---------------------------------------

**$HOME/distro/iso/boot/grub/** konumuna **grub.cfg** dosyası oluşturun.
Aşağıdaki komutları **grub.cfg**  dosyası içine eklenir.

.. code-block:: shell

	linux /boot/vmlinuz
	initrd /boot/initrd.img
	boot

**$HOME/distro/distro.iso**
---------------------------

iso oluşturulur.

.. code-block:: shell

	grub-mkrescue $HOME/distro/iso/ -o $HOME/distro/distro.iso # komutuyla iso doyamız oluşturulur.

Artık sistemi açabilen ve tty açıp bize suna bir yapı oluşturduk.


**Dağıtımın Test Edilmesi**
---------------------------
 
Hazırlanan   **$HOME/distro/distro.iso** dağıtımımız qemu veya virtualbox ile test edilebilir.

Aşağıdaki komutla qemu ile isomuzu çalıştırıp test edebiliriz. qemu ile ilgili bilgi için ek konular bölümünden erişebilirsiniz.

.. code-block:: shell

	qemu-system-x86_64 -cdrom $HOME/distro/distro.iso -m 1G

Eğer hatasız yapılmışsa sistem açılacak ve tty açacaktır. Birçok komutu çalışan bir dağıtım oluşturmuş olduk. Ekran görüntüsü aşağıda görülmektedir. 

.. image:: /_static/images/minimal-iso.png
  :width: 400



Dokümanın devamında kendi sistemimizi hazırlarken bu bölümde anlatılan yapıya benzer adımları yapacağız. 
Minimal sistemden farkı **busybox** ile oluşturduğumuz ikili dosyalarımızı(temel komutlar) kendimiz derleyeceğiz.
Minimal sistemde static busybox kullandık. 

Static dosyalarda dosyanın çalışması için kütüphanelerin hepsi kendi içerisine gömümülü(dahil) bir şekilde gelir.
Avantajı hiçbir kütüphaneye ihtiyaç duymaz. Devevantajı ise boyutları yüksek olur. İstisnalar olsada genel olarak static tercih edilmemektedir. Static olduğunda iso boyutlarımız olması gerekenden 5-10 kat fazla olabilmektedir.

.. raw:: pdf

   PageBreak


.. _onhazirlik:
Ön Hazırlık
===========

Derleme araçları
^^^^^^^^^^^^^^^^
Linux dağıtımlarında kaynak kodlar bir derleme aracı yardımı ile derlenir.
Bu araçlar sayesinde kaynak kod tek tek komut yazmaya gerek kalmadan derlenebilir. Ayrıca hataları yakalaması da daha kolay olur.

Bu bölümde başlıca kullanılan derleme araçlarından söz edilecektir. Bu araçlar şunlardır;

- make
- cmake
- meson
- python


.. raw:: pdf

   PageBreak

make
++++

make, yazılım geliştirme süreçlerinde sıkça kullanılan bir araçtır. Özellikle C ve C++ gibi dillerde projelerin derlenmesi ve yönetilmesi için kullanılır.

Aşağıdaki C kodumuzu(merhaba.c dosyası) make ile nasıl derleyeceğimizi anlatalım;

.. code-block:: C
	
	#include <stdio.h>
	int main(){
	    puts("Merhaba");
	    return 0;
	}


Makefile Nedir?
---------------

Makefile, make aracının nasıl çalışacağını belirten bir dosyadır. İçinde hedefler, bağımlılıklar ve komutlar bulunur. Örneğin, bir C programını derlemek için aşağıdaki gibi basit bir Makefile oluşturabilirsiniz. Makefile ve merhaba.c dosyası aynı konumda olmalıdır.

.. code-block:: shell

	CC=gcc
	CFLAGS=-I.

	all: program

	program: merhaba.o 
		$(CC) -o program merhaba.o

	merhaba.o: merhaba.c
		$(CC) -c merhaba.c $(CFLAGS)

	clean:
		rm -f *.o program


merhaba dosyasından **program** adında bir ikili dosya oluşturmak için aşağıdaki komutlar Makefile ve merhaba.c dosyasının olduğu konumda çalıştırılır.

.. code-block:: shell

	make
	make install

Genellikle Makefile dosyası olmaz. Onun yerine **configure.ac** dosyası olur. **configure.ac** dosyasından **Makefile** dosyası elde etmek için, öncelikle **autoconf** ve **automake** araçlarının sisteminizde kurulu olması gerekmektedir. 

**autoreconf -fvi** komutu çalıştırılıarak configure dosyamızı üretir.Bu araçlar, yapılandırma dosyalarınızı işleyerek gerekli **Makefile** dosyalarını oluşturmanıza yardımcı olur.


**configure** komutunun devamında **--prefix** dışında başka parametreleride olabilir. Bu paramatreleri "Read.me" dosyası içerisinde bulunabilir veya **configure --help** komutu kaynak kodların olduğu konumda kullanılarak görülebilir.


Bu kaynak kod aşağıdaki gibi derlenir:

.. code-block:: shell

	$ autoreconf -fvi
	$ ./configure --prefix=/usr
	$ make
	$ make install 
	
.. raw:: pdf

   PageBreak

cmake
+++++

CMake, projelerin derlenmesi ve yapılandırılması için kullanılan bir araçtır. Bir paketi CMake ile derlemek için genellikle aşağıdaki adımları izleriz:

    İlk olarak, projenin kök dizininde bir CMakeLists.txt dosyası oluşturun.
    Ardından, CMake komutunu kullanarak projeyi yapılandırın ve derleyin. Örneğin:

.. code-block:: shell

	mkdir build
	cd build
	cmake ..
	make

    Bu adımları takip ederek, CMake ile paketinizi başarıyla derleyebilirsiniz.

CMake'in esnekliği ve kullanım kolaylığı sayesinde paketlerin derlenmesi ve yapılandırılması oldukça kolay hale gelir.


Bu kaynak kod aşağıdaki gibi derlenir:

.. code-block:: shell

	mkdir build
	cd build
	cmake ..
	make
	make install
	
.. raw:: pdf

   PageBreak

meson
+++++

Meson, modern bir yapılandırma betik dili ve Ninja ise hızlı bir derleyici aracıdır. Bir paketi derlemek için öncelikle Meson ile yapılandırma dosyalarını oluşturmanız gerekir. Ardından, Ninja derleyici aracını kullanarak bu yapılandırmayı derleyebilirsiniz.

İlk olarak, projenizin dizinine gidin ve Meson ile yapılandırma dosyalarını oluşturun:

.. code-block:: shell

	meson setup builddir --prefix=/usr

Sonra, oluşturulan builddir dizinine geçin ve Ninja ile derlemeyi başlatın:

.. code-block:: shell

	ninja -C builddir

Bu adımları takip ederek Meson ve Ninja kullanarak paketinizi başarılı bir şekilde derleyebilirsiniz.



Bu kaynak kod aşağıdaki gibi derlenir:

.. code-block:: shell
	
	DESTDIR=/ #paketin yükleneceği konum
	meson setup builddir --prefix=/usr
	ninja -C builddir
	DESTDIR=$DESTDIR ninja -C builddir install
	
.. raw:: pdf

   PageBreak

python
++++++

Python ile paket derlemek için genellikle **setuptools** ve **distutils** gibi kütüphaneler kullanılır. Öncelikle, projenizin kök dizininde bir **setup.py** dosyası oluşturmanız gerekir. Bu dosya, paketin yapılandırmasını ve gereksinimlerini tanımlar.

Örnek bir setup.py dosyası aşağıdaki gibi olabilir:

.. code-block:: shell

	from setuptools import setup

	setup(
	    name='paket_adi',
	    version='1.0',
	    packages=['paket'],
	    install_requires=[
		'bağımlılık_paketi',
	    ],
	)

Ardından, terminalde projenizin bulunduğu dizine giderek aşağıdaki komutu çalıştırarak paketi derleyebilirsiniz:

.. code-block:: shell
	
	DESTDIR=/ #yükleme konumu
	python3 -m build
	python3 -m installer --destdir="$DESTDIR" dist/*.whl

Bu komut, paketi dist klasörüne derleyecektir. Artık paketiniz hazır ve dağıtıma uygun hale gelmiştir.

.. raw:: pdf

   PageBreak

.. _derlemearaclari:
Derleme Araçları
================

Temel Paketler
++++++++++++++

Bir önceki bölümde minimal bir sistemi **busybox** yardımıyla tasarladık. Minimal sistem tasarımımızda temel bir sistemin nasıl hazırlandığını anlatmaya çalıştık. Eğer aşamaları takip ederek yaptığımızda kendisini açabilen bir sistem olduğunu görmekteyiz. Minimal sistemde kullanılan **busybox** aslında bizim işlerimiz çok kolaylaştırdı. Şimdi ise **busybox** ile yapabileceğimiz işlemleri kısaca şöyle sıralayabiliriz.

- Temel linux komutlarının(ls, cp, mkdir vs.) yerine busybox kullanabilir.
- Çeşitli sıkıştırma formatları(zip, tar, cpio vb.) yerine busybox kullanabilir.
- İnternete bağlanabililir(udhcpc).
- Dosya indirebilir(wget, curl vb.)
- Log(raporlama) tutabilir.
- Modülleri yönetebilir(kmod, modprobe,insmod vb.)

Bu bölümde **busybox** ile yaptımız işleri yapan paketleri derleyeceğiz. **busybox** yapamadığımız bazı işlemleri(ssh vb.) yapan paketlerde olacak. Tasarlayacağımız sistemde genel olarak şunlar yapılabilecek.

- Temel linux komutları kullanılacak
- Bash kabuğu ile tty ortamı olacak
- Sıkıştırma formatları kullanılabilecek
- Modüller yönetilebilecek
- initrd oluşturabilecek
- grub kurabilecek
- Sistemi kurabilecek
- Sistemi live olarak açabilecek
- İnternete bağlanılabilecek
- ssh bağlantısı ile uzaktan yönetilebilecek
- Metin düzenleyici editör olacak

Bu yapıda bir dağıtım için aşağıdaki paketlere ihtiyacımız olacak.

.. list-table::
   :widths: 25 25 50

   * - 0- `base-file <./001-base-file.html>`_
     - 25- `elfutils <./25-elfutils.html>`_
     - 50- `popt <./50-popt.html>`_
   * - 1- `glibc <./01-glibc.html>`_
     - 26- `libselinux <./26-libselinux.html>`_
     - 51- `icu <./51-icu.html>`_
   * - 2- `readline <./02-readline.html>`_
     - 27- `tar <./27-tar.html>`_
     - 52- `iproute2 <./52-iproute2.html>`_
   * - 3- `ncurses <./03-ncurses.html>`_
     - 28- `zlib <./28-zlib.html>`_
     - 53- `net-tools <./53-net-tools.html>`_
   * - 4- `bash <./04-bash.html>`_
     - 29- `brotli <./29-brotli.html>`_
     - 54- `dhcp <./54-dhcp.html>`_
   * - 5- `openssl <./05-openssl.html>`_
     - 30- `curl <./30-curl.html>`_
     - 55- `openrc <./55-openrc.html>`_
   * - 6- `acl <./06-acl.html>`_
     - 31- `shadow <./31-shadow.html>`_
     - 56- `rsync <./56-rsync.html>`_
   * - 7- `attr <./07-attr.html>`_
     - 32- `file <./32-file.html>`_
     - 57- `kbd <./57-kbd.html>`_
   * - 8- `libcap <./08-libcap.html>`_
     - 33- `eudev <./33-eudev.html>`_
     - 58- `kernel <./58-kernel.html>`_
   * - 9-  `libpcre2 <./09-libpcre2.html>`_
     - 34- `cpio <./34-cpio.html>`_
     - 59- `dialog <./59-dialog.html>`_
   * - 10- `gmp <./10-gmp.html>`_
     - 35- `libsepol <./35-libsepol.html>`_
     - 60- `live-boot <./60-live-boot.html>`_
   * - 11- `coreutils <./11-coreutils.html>`_
     - 36- `kmod <./36-kmod.html>`_
     - 61- `live-config <./61-live-config.html>`_
   * - 12- `util-linux <./12-util-linux.html>`_
     - 37- `audit <./37-audit.html>`_
     - 62- `parted <./62-parted.html>`_
   * - 13- `grep <./13-grep.html>`_
     - 38- `libxcrypt <./38-libxcrypt.html>`_
     - 63- `busybox <./63-busybox.html>`_
   * - 14- `sed <./14-sed.html>`_
     - 39- `libnsl <./39-libnsl.html>`_
     - 64- `nano <./64-nano.html>`_
   * - 15- `mpfr <./15-mpfr.html>`_
     - 40- `libbsd <./40-libbsd.html>`_
     - 65- `grub <./65-grub.html>`_
   * - 16- `gawk <./16-gawk.html>`_
     - 41- `libtirpc <./41-libtirpc.html>`_
     - 66- `efibootmgr <./66-efibootmgr.html>`_
   * - 17- `findutils <./17-findutils.html>`_
     - 42- `e2fsprogs <./42-e2fsprogs.html>`_
     - 67- `efivar <./67-efivar.html>`_
   * - 18- `gcc <./18-gcc.html>`_
     - 43- `dostools <./43-dostools.html>`_
     - 68- `libssh <./68-libssh.html>`_
   * - 19- `libcap-ng <./19-libcap-ng.html>`_
     - 44- `initramfs-tools <./44-initramfs-tools.html>`_
     - 69- `openssh <./69-openssh.html>`_
   * - 20- `sqlite <./20-sqlite.html>`_
     - 45- `libxml2 <./45-libxml2.html>`_
     - 70- `pam <./70-pam.html>`_
   * - 21- `gzip <./21-gzip.html>`_
     - 46- `expat <./46-expat.html>`_
     - 71- 
   * - 22- `xz-utils <./22-xz-utils.html>`_
     - 47- `libmd <./47-libmd.html>`_
     - 72- 
   * - 23- `zstd <./23-zstd.html>`_
     - 48- `libaio <./48-libaio.html>`_
     - 73-    
   * - 24- `bzip2 <./24-bzip2.html>`_
     - 49- `lvm2 <./49-lvm2.html>`_
     - 74-   


Listede bulunan  **bash** paketinin sorunsuz çalışabilmesi için **readline** ve **ncurses** kütüphaneleri gerekli. **readline** ve **ncurses** kütüphanelerinin çalışabilmesi içinde **glibc** kütüphanesi gerekli. Listede bulunan tüm paketlerin bağımlılıkları eksiksizdir.
Listede bulunan paketler sırasıyla nasıl derleneceği ayrı başlıklar altında anlatılacaktır.

Paketlere başlamadan önce şu paketleri kurmanızı tavsiye ederim.

- sudo apt-get install autoconf
- sudo apt-get install automake
- sudo apt-get install autotools-dev
- sudo apt-get install make
- sudo apt-get install meson
- sudo apt-get install cmake
- sudo apt-get install ninja-build
- sudo apt-get install pkgconf
- sudo apt install patch
- sudo apt install libtool
- sudo apt install grub-pc grub-pc-bin

Paketlerin derlenmesiniz **root** yetkisiyle yapınız.


.. raw:: pdf

   PageBreak


base-file
+++++++++

Linux sistemimiz için temel ayarlamalar, dosya ve dizin yapıları olması gerekmektedir. Bu yapıyı oluşturduktan sonra sistemi bu yapının üzerine inşaa edeceğiz. Aslında linux sisteminde temel paket **glibc** paketidir. **glibc** paketinin derlenip yüklenmesinden önce temel yapının oluşturulması gerektiği için **base-file** paketi oluşturduk. 

**base-file Komutları**
-----------------------

.. code-block:: shell

	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	# açık ekran tespit ediliyor
	user=$(who | grep '('$display')' | awk '{print $1}')	#ekranı açan kullanıcı tespit ediliyor
	mkdir -p  /home/$user/distro/build 	#Derleme dizini yoksa oluşturuluyor
	mkdir -p   /home/$user/distro/rootfs  	#Sistemin oluşturlacağı dizin yoksa oluşturuluyor
	rm -rf  /home/$user/distro/build/* #içeriği temizleniyor
	cp -prfv files/*  /home/$user/distro/build/ # Ek dosyalar kopyalanıyor. Ek dosyalar aşağıda verilmiştir.
	cd  /home/$user/distro/build  #build geçiyoruz

	mkdir  -p bin dev etc home lib64 proc root run sbin sys usr var etc/bps tmp tmp/bps/kur \
	var/log  var/tmp usr/lib64/x86_64-linux-gnu usr/lib64/pkgconfig \
	usr/local/{bin,etc,games,include,lib,sbin,share,src}
	ln -s lib64 lib
	cd var&&ln -s ../run run&&cd -
	cd usr&&ln -s lib64 lib&&cd -
	cd usr/lib64/x86_64-linux-gnu&&ln -s ../pkgconfig  pkgconfig&&cd -

	bash -c "echo -e \"/bin/sh \n/bin/bash \n/bin/rbash \n/bin/dash\" >>  /home/$user/distro/build/etc/shell"
	bash -c "echo 'tmpfs /tmp tmpfs rw,nodev,nosuid 0 0' >>  /home/$user/distro/build/etc/fstab"
	bash -c "echo '127.0.0.1 basitdagitim' >>  /home/$user/distro/build/etc/hosts"
	bash -c "echo 'basitdagitim' >  /home/$user/distro/build/etc/hostname"
	bash -c "echo 'nameserver 8.8.8.8' >  /home/$user/distro/build/etc/resolv.conf"
	echo root:x:0:0:root:/root:/bin/sh >  /home/$user/distro/build/etc/passwd
	chmod 755  /home/$user/distro/build/etc/passwd
	cp -prfv  /home/$user/distro/build/*   /home/$user/distro/rootfs/
	
Yukarıdaki kodları fonksiyonel hale getirmek için aşağıdaki şablon scripti kullanacağız.

Şablon Script Yapısı
--------------------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version=""
	name=""
	depends=""
	source=""
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	# açık ekran tespit ediliyor
	user=$(who | grep '('$display')' | awk '{print $1}')	#ekranı açan kullanıcı tespit ediliyor
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
		    wget ${source}
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $BUILDDIR
	}
	setup(){		#Derleme öncesi kaynak dosyaların sisteme göre ayarlanması	}
	build(){		#Paketin derlenmesi	}
	package(){		# Derlenen dosyaları yükleme öncesi ayar ve yükleme işleminin yapılması	}
	initsetup 	# initsetup fonksiyonunu çalıştırır ve kaynak dosyayı inidirir
	setup		# setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build		# build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package		# package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

.. raw:: pdf

   PageBreak

Şablon içinde kullanılan bazı sabit bilgiler var. Bular;

- ROOTBUILDDIR=" /home/$user/distro/build": Derleme konumu.
- BUILDDIR=" /home/$user/distro/build/build-${name}-${version}": Derlenen paketin derleme konumu.
- DESTDIR=" /home/$user/distro/rootfs": Derlennen paketin yükleme konumu.
- PACKAGEDIR=$(pwd) : Derleme talimatının bulunduğu(build dosyası) konum.
- SOURCEDIR=" /home/$user/distro/build/${name}-${version}": Derlenen paketin kaynak kodlarının konumu.

Derleme konumunu uzun uzun yazmak yerine sadece $ROOTBUILDDIR ifadesi kullanılıyor. Aslında bu işleme takma ad(alias) denir. Mesela kaynak kodların olduğu konumda bir şeyler yapmak istersek $SOURCEDIR ifadesinin kullanmamız yeterli olacaktır. Bu takma adlar tüm paketlerde geçerli olacak ifadelerdir.

**base-file** script dosyasına benzer yapıda diğer paketler içinde script dosyası oluşturulacaktır. Bu sayede her aşamayı tek tek yazma gibi iş yükü olmayacak ve paket derlenirken hangi fonksiyonda(initsetup, setup vb.) sorun yaşanırsa o fonksiyon üzerinden hata ayıklama yapılacaktır.

Yapıyı Oluşturan Script
-----------------------

.. code-block:: shell

	#!/usr/bin/env bash
	version="1.0"
	name="base-file"
	depends=""
	description="sistemin temel yapısı"
	source=""
	groups="sys.base"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	
	initsetup(){
			mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
			rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
			cd $ROOTBUILDDIR #dizinine geçiyoruz
			mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $BUILDDIR
	}
	setup(){	cp -prfv $PACKAGEDIR/files/* $BUILDDIR/	
			}
	build(){			echo ""	
			}
	package(){
			mkdir  -p bin dev etc home lib64 proc root run sbin sys usr var etc/bps tmp tmp/bps/kur \
			var/log  var/tmp usr/lib64/x86_64-linux-gnu usr/lib64/pkgconfig \
			usr/local/{bin,etc,games,include,lib,sbin,share,src}
			ln -s lib64 lib
			cd var&&ln -s ../run run&&cd -
			cd usr&&ln -s lib64 lib&&cd -
			cd usr/lib64/x86_64-linux-gnu&&ln -s ../pkgconfig  pkgconfig&&cd -
			bash -c "echo -e \"/bin/sh \n/bin/bash \n/bin/rbash \n/bin/dash\" >> $BUILDDIR/etc/shell"
			bash -c "echo 'tmpfs /tmp tmpfs rw,nodev,nosuid 0 0' >> $BUILDDIR/etc/fstab"
			bash -c "echo '127.0.0.1 kly' >> $BUILDDIR/etc/hosts"
			bash -c "echo 'kly' > $BUILDDIR/etc/hostname"
			bash -c "echo 'nameserver 8.8.8.8' > $BUILDDIR/etc/resolv.conf"
			echo root:x:0:0:root:/root:/bin/sh > $BUILDDIR/etc/passwd
			chmod 755 $BUILDDIR/etc/passwd
			cp -prfv $BUILDDIR/*  $DESTDIR/
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

.. raw:: pdf

   PageBreak
   	
Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/base-file/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **base-file** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız. 

Yukarı verilen script kodlarını **build** adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra **build** scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları **base-file** dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build


Paket Derleme Yöntemi
---------------------

**base-file** paketleri ilk paketler olmasından dolayı detaylıca anlatıldı. Bu paketten sonraki paketlerde **şablon script** dosyası yapında verilecektir. Script dosya altında ise ek dosyalar varsa **files.tar** şeklinde link olacaktır. Her paket için istediğiniz bir konumda bir dizin oluşturunuz. **files.tar** dosyasını oluşturulan dizin içinde açınız. Test amaçlı derleme yaptığım paketler ve **base-file** için yaptığımız dizin yapısı aşağıda gösterilmiştir.

.. image:: /_static/images/base-file-0.png
  	:width: 600


Derleme scripti için **build** dosyası oluşturup içine yapıştırın ve kaydedin. 
**build**  dosyasının bulunduğu dizininde terminali açarak aşağıdaki gibi çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build

.. raw:: pdf

   PageBreak


glibc
+++++

**glibc** linux dağıtımlarında bütün uygulamaların çalışmasını sağlayan en temel C kütüphanesidir. **glibc** dışında diğer C standart kütüphaneler şunlardır: Bionic libc, dietlibc, EGLIBC, klibc, musl, Newlib ve uClibc. **glibc** en çok tercih edilen ve uygulama uyumluluğu bulunduğu için bu dokümanda glibc üzerinden anlatım yapılacaktıdır. **glibc** listemizde derleyeceğimiz tüm paketlerin çalışması için temel kütüphanedir. Bundan dolayı ilk olarak derleyeceğiz pakettir.

glibc Script Dosyası
--------------------

Debian ortamında bu paketin derlenmesi için;
**sudo apt install make bison gawk diffutils gcc gettext grep perl sed texinfo libtool** komutuyla paketin kurulması gerekmektedir.

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
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
		    wget ${source}
		    for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $BUILDDIR
	}

	setup()	{
			cp -prvf $PACKAGEDIR/files $BUILDDIR/            
			echo "slibdir=/lib64" >> configparms
			echo "rtlddir=/lib64" >> configparms
			$SOURCEDIR/configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --enable-bind-now \
			--enable-multi-arch --enable-stack-protector=strong --enable-stackguard-randomization --disable-crypt --disable-profile --disable-werror --enable-static-pie --enable-static-nss--disable-nscd \
			--host=x86_64-pc-linux-gnu --libdir=/lib64 --libexecdir=/lib64/glibc
	}
	build(){
		  	make -j5 #-C $DESTDIR all
	}
	package(){
			mkdir -p ${DESTDIR}/lib64
			cd $DESTDIR
			ln -s lib64 lib
			cd $BUILDDIR
			make install DESTDIR=$DESTDIR

			mkdir -p ${DESTDIR}/etc/ld.so.conf.d/ ${DESTDIR}/etc/sysconf.d/ ${DESTDIR}/bin
			install $BUILDDIR/files/ld.so.conf ${DESTDIR}/etc/ld.so.conf
			install $BUILDDIR/files/usr-support.conf ${DESTDIR}/etc/ld.so.conf.d/
			install $BUILDDIR/files/x86_64-linux-gnu.conf ${DESTDIR}/etc/ld.so.conf.d/
			
			rm -f ${DESTDIR}/etc/ld.so.cache	# remove ld.so.cache file
			install $BUILDDIR/files/glibc.sysconf ${DESTDIR}/etc/sysconf.d/glibc	# install sysconf trigger
			install $BUILDDIR/files/locale-gen ${DESTDIR}/bin/locale-gen 	# install extra tools
			install $BUILDDIR/files/revdep-rebuild ${DESTDIR}/bin/revdep-rebuild
			
			install $BUILDDIR/files/tr_TR ${DESTDIR}/usr/share/i18n/locales/tr_TR # replace buggy turkish format with better one
			# remove unused languages
			for l in ku hy ; do
		            rm -rf ${DESTDIR}/usr/lib/locale/${i}_*
		            rm -rf ${DESTDIR}/usr/share/locale/${i}_*
		            rm -rf ${DESTDIR}/usr/share/i18n/locales/${i}_*
			done
			sed -i "s|#!/bin/bash|#!/bin/sh|g" ${DESTDIR}/usr/bin/ldd	# fix ldd shebang
	   		cd ${DESTDIR}/lib64/ &&mkdir -p x86_64-linux-gnu&&cd x86_64-linux-gnu
	   		   
		         while read -rd '' file; do
		           ln -s $file $(basename "$file")
	   		done< <(find "../"  -maxdepth 1 -type f -iname "*" -print0)
			${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/glibc/files.tar>`_ tar dosyasını indirdikten sonra **glibc** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız. 

Yukarı verilen script kodlarını **build** adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra **build** scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları **glibc** dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build

.. raw:: pdf

   PageBreak

Test Etme
---------

glibc kütüphanemizi **$HOME/distro/rootfs** komununa yüklendi. Şimdi bu kütüphanenin çalışıp çalışmadığını test edelim. Aşağıdaki c kodumuzu derleyelim ve **$HOME/distro/rootfs** konumuna kopyalayalım. **$HOME/** (ev dizinimiz) konumuna dosyamızı oluşturup aşağıdaki kodu içine yazalım.

.. code-block:: shell

	#include<stdio.h>
	void main(){
	puts("Merhaba Dünya");
	}

Program Derleme
................

.. code-block:: shell
	
	cd $HOME
	gcc -o merhaba merhaba.c #merhaba.c dosyası derlenir.

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

Derlemede **glibc** kütüphanesinin derlemesine benzer bir yol izlenecektir. **glibc** temel kütüphane olması ve ilk derlediğimiz paket olduğu için detaylıca anlatılmıştır. Diğer paketlerimizde de **glibc** için paylaşılan script dosyası gibi dosyalar hazırlayıp derlenecektir.

.. raw:: pdf

   PageBreak



readline 
+++++++++++

libreadline, Linux işletim sistemi için geliştirilmiş bir kütüphanedir. Bu kütüphane, kullanıcıların komut satırında girdi almasını ve düzenlemesini sağlar. Bir programcı olarak, libreadline'i kullanarak kullanıcı girdilerini okuyabilir, düzenleyebilir ve işleyebilirsiniz.

Derleme
-------

Debian ortamında bu paketin derlenmesi için;
**sudo apt install libreadline-dev** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell

	#!/usr/bin/env bash
	version="8.2"
	name="readline"
	depends="glibc"
	description="readline kütüphanesi"
	source="https://ftp.gnu.org/pub/gnu/readline/${name}-${version}.tar.gz"
	groups="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	
	setup(){
		cp -prvf $PACKAGEDIR/files $SOURCEDIR/
		./configure --prefix=/usr \
			--libdir=/usr/lib64
	}

	build(){
		make SHLIB_LIBS="-L/tools/lib -lncursesw"
	}

	package(){
		make SHLIB_LIBS="-L/tools/lib -lncursesw" DESTDIR="$DESTDIR" install pkgconfigdir="/usr/lib64/pkgconfig"
		
		install -Dm644 $SOURCEDIR/files/inputrc "$DESTDIR"/etc/inputrc
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/readline/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **readline** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.

Paket adında(readline) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
Program Yazma
-------------

Altta görülen **readline**  kütüphanesini kullanarak terminalde kullanıcıdan mesaj alan ve mesajı ekrana yazan programı hazırladık.
$HOME(ev dizinimiz) dizinine merhaba.c dosyası oluşturup aşağıdaki kodları ekleyelim.

.. code-block:: shell

	# merhaba.c doayası
	#include<stdio.h>
	#include<readline/readline.h>
	void main()
	{
	char* msg=readline("Adını Yaz:");
	puts(msg);
	}

Program Derleme
---------------

.. code-block:: shell

	cd $HOME
	gcc -o merhaba merhaba.c -lreadline
	cp merhaba $HOME/distro/rootfs/merhaba

Program Test Etme
-----------------

.. code-block:: shell

	sudo chroot $HOME/distro/rootfs /merhaba

Program hatasız çalışıyorsa **readline** kütüphanemiz hatasız derlenmiş olacaktır.

.. raw:: pdf

   PageBreak


ncurses
+++++++

ncurses, Linux işletim sistemi için bir programlama kütüphanesidir. Bu kütüphane, terminal tabanlı kullanıcı arayüzleri oluşturmak için kullanılır. ncurses, terminal ekranını kontrol etmek, metin tabanlı menüler oluşturmak, renkleri ve stil özelliklerini ayarlamak gibi işlevlere sahiptir.

ncurses, kullanıcıya metin tabanlı bir arayüz sağlar ve terminal penceresinde çeşitli işlemler gerçekleştirmek için kullanılabilir. Örneğin, bir metin düzenleyici, dosya tarayıcısı veya metin tabanlı bir oyun gibi uygulamalar ncurses kullanarak geliştirilebilir.

Derleme
-------

Debian ortamında bu paketin derlenmesi için;
**sudo apt install libncurses-dev** komutuyla paketin kurulması gerekmektedir.


.. code-block:: shell
	
	#!/usr/bin/env bash
	version="6.4"
	so_ver="6"
	name="ncurses"
	depends="glibc"
	description="ncurses kütüphanesi"
	source="https://ftp.gnu.org/pub/gnu/ncurses/${name}-${version}.tar.gz"
	groups="sys.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
			./configure --prefix=/usr --libdir=/lib64 --with-shared --disable-tic-depends --with-versioned-syms  --enable-widec --with-cxx-binding \
			--with-cxx-shared --enable-pc-files --mandir=/usr/share/man --with-manpage-format=normal --with-xterm-kbs=del --with-pkg-config-libdir=/usr/lib64/pkgconfig
	}
	build(){
		 make -j5 #-C $DESTDIR all 
	}
	package(){
		make install DESTDIR=$DESTDIR
		cd $DESTDIR/lib64
		ln -s libncursesw.so.6 libtinfow.so.6
		ln -s libncursesw.so.6 libtinfo.so.6
		ln -s libncursesw.so.6 libncurses.so.6
	    	
	    	# make sure that anything linking against it links against libncurses.so instead
	    	for lib in ncurses ncurses++ form panel menu; do
			if [ ! -f "$DESTDIR/usr/lib64/pkgconfig/${lib}.pc" ]; then
			    ln -sv ${lib}w.pc "$DESTDIR/usr/lib64/pkgconfig/${lib}.pc"
			fi
	    	done
	    	
	    	 # make sure that anything linking against it links against libncursesw.so instead
		for lib in tic tinfo tinfow ticw; do 
			if [ ! -f "$DESTDIR/usr/lib64/pkgconfig/${lib}.pc" ]; then
				    ln -sv ncursesw.pc "$DESTDIR/usr/lib64/pkgconfig/${lib}.pc"
			fi
		done

		# legacy binary support
	    	for lib in libncursesw libncurses libtinfo libpanelw libformw libmenuw ; do
		ln -sv ${lib}.so.${so_ver} ${lib}.so.5
	    	done
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(ncurses) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak



bash
++++

Bash, Linux ve diğer Unix tabanlı işletim sistemlerinde kullanılan bir kabuk programlama dilidir. Kullanıcıların komutlar vererek işletim sistemini yönetmelerine olanak tanır. Bash, kullanıcıların işlemleri otomatikleştirmesine ve betik dosyaları oluşturmasına olanak tanır. Özellikle sistem yöneticileri ve geliştiriciler arasında yaygın olarak kullanılan güçlü bir araçtır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="5.2.21"
	name="bash"
	depends="glibc,readline,ncurses"
	description="GNU/Linux dağıtımında ön tanımlı kabuk"
	source="https://ftp.gnu.org/pub/gnu/bash/${name}-${version}.tar.gz"
	groups="app.shell"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()
	{
        ./configure --prefix=/usr \
			--libdir=/usr/lib64 \
			--bindir=/bin \
			--with-curses \
			--enable-readline \
			--without-bash-malloc
	}
	build()
	{
		 make -j5 #-C $DESTDIR all 
	}
	package()
	{
		make install DESTDIR=$DESTDIR
		cd $DESTDIR/bin
		ln -s bash sh
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(bash) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




openssl
+++++++

OpenSSL, açık kaynaklı bir kriptografik kütüphanedir ve SSL/TLS protokollerini uygulamak, şifreleme, dijital sertifikalar oluşturma ve doğrulama gibi işlemleri gerçekleştirmek için yaygın olarak tercih edilir. coreutils için gerekli olan paket.

Derleme
--------

Debian ortamında bu paketin derlenmesi için; **sudo apt install perl** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="3.2.0"
	name="openssl"
	depends="glibc,zlib"
	description="openssl"
	source="https://www.openssl.org/source/${name}-${version}.tar.gz"
	groups="dev.libs"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
			mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
			rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
			cd $ROOTBUILDDIR #dizinine geçiyoruz
			wget ${source}
			dowloadfile=$(ls|head -1)
			filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
			if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
			director=$(find ./* -maxdepth 0 -type d)
			directorname=$(basename ${director})
			if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
			mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		    cp -prfv $PACKAGEDIR/files/ $SOURCEDIR
		    wget -O $SOURCEDIR/files/cacert.pem https://curl.haxx.se/ca/cacert.pem
		    patch -Np1 -i $SOURCEDIR/files/ca-dir.patch
		    ./config --prefix=/usr  --openssldir=/etc/ssl --libdir=/usr/lib64 shared linux-x86_64
	}
	build(){
		    make depend
		    make -j5 #-C $DESTDIR all
	}
	package(){
		    mkdir -p "${DESTDIR}/etc/ssl/" "${DESTDIR}/sbin/"
		    install $SOURCEDIR/files/update-certdata "${DESTDIR}/sbin/update-certdata"
		    install $SOURCEDIR/files/cacert.pem "${DESTDIR}/etc/ssl/cert.pem"
		    make DESTDIR="${DESTDIR}" install_sw install_ssldirs install_man_docs  $jobs
		    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/openssl/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **openssl** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız. Oluşturuluna dizinde yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




acl
+++

ACL (Access Control List), dosya sistemlerinde veya ağ cihazlarında erişim kontrolünü yönetmek için kullanılan bir mekanizmadır. ACL'ler, belirli kullanıcıların veya kullanıcı gruplarının belirli dosya veya kaynaklara erişim düzeylerini tanımlamak için kullanılır. Bu, dosyalara veya kaynaklara erişim izinlerini hassas bir şekilde kontrol etmeyi sağlar. Örneğin, bir dosyaya sadece belirli kullanıcıların yazma izni vermek için ACL'ler kullanılabilir. Bu şekilde, güvenlik ve erişim kontrolü daha ayrıntılı bir şekilde yapılabilmektedir.coreutils için gerekli olan paket.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;
**sudo apt install libattr1-dev** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="acl"
	version="2.3.1"
	description="The acl package contains utilities to administer Access Control Lists"
	source="https://download.savannah.nongnu.org/releases/acl/acl-$version.tar.xz"
	depends="attr"
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
	    ./configure --prefix=/usr --libdir=/usr/lib64
	}
	build(){
	     make -j5 #-C $DESTDIR all
	}
	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(acl) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




attr
++++

coreutils için gerekli olan paket.

attr, dosya özniteliklerini ayarlamak veya görüntülemek için kullanılan bir komuttur. Bu komut, dosya veya dizinlerin özelliklerini (izinler, sahiplik, erişim zamanları vb.) yönetmek için kullanılır. Örneğin, bir dosyanın izinlerini değiştirmek veya bir dosyanın sahibini görmek için attr komutunu kullanabilirsiniz.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;
**sudo apt install libattr1-dev** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="attr"
	version="2.5.1"
	description="The attr package contains utilities to administer the extended attributes on filesystem objects."
	source="https://mirror.rabisu.com/savannah-nongnu/attr/attr-${version}.tar.gz"
	depends=""
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	
	setup(){
	    ./configure --prefix=/usr \
		--sysconfdir=/etc \
		--libdir=/usr/lib64
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(attr) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





libcap
++++++

libcap paketi, Linux işletim sistemlerinde kullanıcı ve grup yetkilendirmelerini yönetmek için kullanılan bir kütüphanedir. Bu kütüphane, sistem kaynaklarına erişim kontrolü sağlamak amacıyla çeşitli yetki seviyeleri tanımlamaktadır. coreutils için gerekli olan paket.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="2.69"
	name="libcap"
	depends="glibc,acl,openssl"
	description="shell ve network copy"
	source="https://mirrors.edge.kernel.org/pub/linux/libs/security/linux-privs/libcap2/${name}-${version}.tar.xz"
	groups="net.misc"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	_common_make_options=(
	  CGO_CPPFLAGS="$CPPFLAGS"
	  CGO_CFLAGS="$CFLAGS"
	  CGO_CXXFLAGS="$CXXFLAGS"
	  CGO_LDFLAGS="$LDFLAGS"
	  CGO_REQUIRED="1"
	  GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
	  GO_BUILD_FLAGS="-ldflags '-compressdwarf=false -linkmode=external'"
	)
	setup(){ echo ""   
	}
	build(){
        make "${_common_make_options[@]}" SUDO="" prefix=/usr KERNEL_HEADERS=include lib=lib64 sbindir=bin RAISE_SETFCAP=no  DYNAMIC=yes
	}
	package(){
		make "${_common_make_options[@]}" DESTDIR="$DESTDIR" RAISE_SETFCAP=no prefix=/usr lib=lib64 sbindir=bin install
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libcap) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




libpcre2
++++++++

libpcre2 paketi, Perl Compatible Regular Expressions (PCRE) kütüphanesinin ikinci versiyonunu temsil eder ve düzenli ifadelerle çalışmak için kullanılan bir araçtır. Bu kütüphane, özellikle metin işleme ve arama işlemlerinde yaygın olarak kullanılmaktadır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="10.40"
	name="libpcre2"
	description="Perl-compatible regular expression library"
	source="https://github.com/PCRE2Project/pcre2/releases/download/pcre2-${version}/pcre2-${version}.tar.gz"
	depends="readline"
	group="dev.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()
	{
	    ./configure --prefix=/usr \
	    --enable-shared \
	    --enable-static \
		--enable-pcre2-16 \
		--enable-pcre2-32 \
		--enable-jit \
		--enable-pcre2test-libreadline 
	}
	build()
	{
		make -j5 #-C $DESTDIR all
	}
	package()
	{
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libpcre2) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




gmp
++++

GMP (GNU Multiple Precision Arithmetic Library) paketi, yüksek hassasiyetli aritmetik işlemler gerçekleştirmek için kullanılan bir kütüphanedir. Özellikle büyük sayılarla çalışırken, standart veri türlerinin yetersiz kaldığı durumlarda devreye girer.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="6.3.0"
	name="gmp"
	depends="glibc"
	description="Library for arbitrary-precision arithmetic on different type of numbers"
	source="https://gmplib.org/download/gmp/gmp-${version}.tar.xz"
	groups="dev.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()
	{
		./configure --prefix=/usr --libdir=/usr/lib64 \
			$(use_opt cxx --enable-cxx --disable-cxx) \
		--enable-fat
	}
	build()
	{
		make -j5 #-C $DESTDIR all
	}
	package()
	{
		make install DESTDIR=${DESTDIR}
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(gmp) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





coreutils
+++++++++

coreutils, Linux işletim sistemlerinde temel dosya yönetimi ve sistem komutlarını içeren bir paket olup, kullanıcıların dosyalarla etkileşimde bulunmalarını sağlayan temel araçları sunar. Bu paket, dosya kopyalama, taşıma, silme, listeleme gibi işlemleri gerçekleştiren komutları içerir. Örneğin, cp, mv, rm, ls gibi komutlar coreutils paketinin bir parçasıdır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="coreutils"
	version="9.5"
	description="The basic file, shell and text manipulation utilities of the GNU operating system"
	source="https://ftp.gnu.org/gnu/coreutils/coreutils-$version.tar.xz"
	depends="acl,attr,gmp,libcap,openssl"
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	export CFLAGS="-static-libgcc -static-libstdc++ -fPIC"
	setup(){
    	export FORCE_UNSAFE_CONFIGURE=1 
    	./configure --prefix=/usr \
        --libdir=/usr/lib64 \
        --libexecdir=/usr/libexec \
        --enable-largefile \
        --enable-single-binary=symlinks \
        --enable-no-install-program=groups,hostname,kill,uptime \
        --without-selinux --without-openssl
	}

	build(){
	    make -j5 #-C $DESTDIR all
	}
	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(coreutils) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




util-linux
++++++++++

Util-linux paketi, Linux tabanlı sistemlerde kritik öneme sahip bir bileşendir. Bu paket, dosya sistemleri, disk yönetimi, kullanıcı yönetimi ve sistem izleme gibi çeşitli işlevleri yerine getiren bir dizi araç içerir. Örneğin, mount ve umount komutları, dosya sistemlerini bağlamak ve ayırmak için kullanılırken, fdisk ve parted disk bölümlerini yönetmek için kullanılır. Ayrıca, login, su, ve passwd gibi komutlar, kullanıcı kimlik doğrulama ve yönetimi için önemli işlevler sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="util-linux"
	version="2.40.1"
	description="Various useful Linux utilities"
	source="https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v${version%.*}/util-linux-${version}.tar.gz"
	depends=""
	buildepend="libcap-ng,python,eudev,sqlite,eudev,cryptsetup,libxcrypt"
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
 		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		cp -prvf $PACKAGEDIR/files/ $SOURCEDIR/
		patch -Np1 -i $SOURCEDIR/files/0001-util-linux-tmpfiles.patch
		./configure --prefix=/usr --libdir=/usr/lib64 --bindir=/usr/bin \
				--enable-shared --enable-static --disable-su --disable-runuser --disable-chfn-chsh --disable-login \
				--disable-sulogin --disable-makeinstall-chown --disable-makeinstall-setuid --disable-pylibmount \
				--disable-raw --without-systemd --without-libuser --without-utempter --without-econf --with-python --with-udev
	}
	build(){
		make -j5 #-C $DESTDIR all
	}
	package(){
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
	
	
Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/util-linux/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **util-linux** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(util-linux) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




grep
++++

Grep, Linux işletim sistemlerinde metin arama işlemleri için kullanılan güçlü bir komut satırı aracıdır. Kullanıcıların belirli bir desen veya kelimeyi dosyalar içinde hızlı bir şekilde bulmalarını sağlar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="grep"
	version="3.11"
	description="GNU regular expression matcher"
	source="https://ftp.gnu.org/gnu/grep/grep-$version.tar.xz"
	depends="libpcre2"
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		./configure --prefix=/usr --libdir=/usr/lib64/
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(grep) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




sed
+++

sed, "stream editor" anlamına gelen bir Linux komut satırı aracıdır. Temel görevi, metin akışını düzenlemek ve dönüştürmektir. sed, dosyalar üzerinde arama, değiştirme, silme ve ekleme işlemleri yaparak metin verilerini işlemek için kullanılır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="sed"
	version="4.9"
	description="Super-useful stream editor"
	source="https://ftp.gnu.org/gnu/sed/sed-$version.tar.xz"
	depends="acl"
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	
	setup(){
	   ./configure --prefix=/usr \
		--libdir=/usr/lib64/
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(sed) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




mpfr
++++

MPFR (Multiple Precision Floating-Point Reliable) paketi, yüksek hassasiyetli kayan nokta hesaplamaları yapmak için kullanılan bir kütüphanedir. Bu kütüphane, matematiksel hesaplamalarda doğruluğu artırmak amacıyla tasarlanmıştır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="4.2.0"
	name="mpfr"
	depends="glibc,gmp"
	description="multiple precision floating-point computation"
	source="https://ftp.gnu.org/gnu/mpfr/mpfr-${version}.tar.xz"
	groups="dev.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()
	{
		./configure --prefix=/usr \
		--libdir=/usr/lib64 \
		--enable-shared \
		--enable-static \
		--disable-maintainer-mode \
		--enable-thread-safe
	}
	build()
	{
		make
	}
	package()
	{
		make install DESTDIR=${DESTDIR}
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(mpfr) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





gawk
++++

gawk, GNU projesinin bir parçası olarak geliştirilmiş bir metin işleme aracıdır. "awk" dilinin GNU versiyonu olan gawk, özellikle metin dosyalarındaki verileri analiz etmek, düzenlemek ve raporlamak için kullanılır. gawk, satır ve sütun bazında veri işleme yeteneği ile kullanıcıların karmaşık metin manipülasyonları gerçekleştirmesine olanak tanır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="gawk"
	version="5.3.0"
	description="GNU awk pattern-matching language"
	source="https://ftp.gnu.org/gnu/gawk/gawk-$version.tar.xz"
	depends="mpfr,readline"
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
	    ./configure --prefix=/usr \
		--libdir=/usr/lib64/ \
		--sysconfdir=/etc \
		--without-libsigsegv
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(gawk) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




findutils
+++++++++

Finutils paketi, Linux işletim sistemlerinde dosya ve dizin yönetimi ile ilgili çeşitli işlevler sunan bir araç setidir. Bu paket, özellikle dosya sistemleri üzerinde işlem yaparken kullanıcıların işini kolaylaştırmayı hedefler.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="findutils"
	version="4.9.0"
	description="GNU utilities for finding files"
	source="https://ftp.gnu.org/gnu/findutils/findutils-$version.tar.xz"
	depends=""
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
	   	./configure --prefix=/usr --libdir=/usr/lib64/
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(findutils) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




gcc
+++

gcc paketi, GNU Compiler Collection (GCC) ile birlikte gelen ve C, C++ gibi dillerde yazılmış programların çalışması için gerekli olan temel kütüphaneleri içeren bir bileşendir. Bu paket, derleyici tarafından üretilen kodun çalışabilmesi için gerekli olan düşük seviyeli işlevleri sağlar. Debian ortamında derlemek için **sudo apt install libmpc-dev libmpfr-dev libgmp-dev libisl-dev** komutuyla paketleri kurmalıyız.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="13.1.0"
	name="gcc"
	depends="glibc,gmp,mpfr,libmpc,zlib,libisl"
	builddepend="flex,elfutils,curl,linux-headers"
	description="DOS filesystem tools - provides mkdosfs, mkfs.msdos, mkfs.vfat"
	source="https://ftp.gnu.org/gnu/gcc/gcc-${version}/gcc-${version}.tar.xz"
	groups="sys.devel"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $BUILDDIR
	}


	export CFLAGS="-O2 -s"
	export CXXFLAGS="-O2 -s"
	unset LDFLAGS
	setup()
	{
	case $(uname -m) in
	  x86_64)
	    sed -i.orig '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64
	  ;;
	esac

	    cd $SOURCEDIR
	    mkdir build
	    cd build
	    ../configure --prefix=/usr --libexecdir=/usr/libexec --mandir=/usr/share/man --infodir=/usr/share/info --enable-languages=c,c++ --with-linker-hash-style=gnu \
	    --with-system-zlib --enable-__cxa_atexit --enable-cet=auto --enable-checking=release --enable-clocale=gnu --enable-default-pie \
	      --enable-default-ssp --enable-gnu-indirect-function--enable-gnu-unique-object --enable-libstdcxx-backtrace --enable-link-serialization=1 --enable-linker-build-id --enable-lto --disable-multilib --enable-plugin \
	      --enable-shared --enable-threads=posix --disable-libssp --disable-libstdcxx-pch --disable-werror --without-zstd --disable-nls	--libdir=/usr/lib64 --target=x86_64-pc-linux-gnu 	
	}
	build(){
		cd $SOURCEDIR/build
		make
	}
	package(){
		cd $SOURCEDIR/build
		make install DESTDIR=${DESTDIR}
	    	
		mkdir -p ${DESTDIR}/usr/lib64/
		ln -s gcc ${DESTDIR}/usr/bin/cc
		ln -s g++ ${DESTDIR}/usr/bin/cxx
		cd $DESTDIR
		while read -rd '' file; do
		case "$(file -Sib "$file")" in
		    application/x-executable\;*)     # Binaries
		        strip "$file" ;;
		    application/x-pie-executable\;*) # Relocatable binaries
		        strip "$file" ;;
		esac
	    done< <(find "./" -type f -iname "*" -print0)	 
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(gcc) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




libcap-ng
+++++++++

libcap-ng paketi, Linux işletim sistemlerinde yetki yönetimi ve güvenlik uygulamaları için kullanılan bir kütüphanedir. Bu kütüphane, kullanıcıların ve süreçlerin sahip olduğu yetkileri daha esnek bir şekilde yönetmelerine olanak tanır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="0.8.3"
	name="libcap-ng"
	depends="glibc,acl,openssl,libtool"
	description="shell ve network copy"
	source="https://github.com/stevegrubb/libcap-ng/archive/refs/tags/v${version}.zip"
	groups="sys.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()
	{	
        ./autogen.sh
        ./configure --prefix=/usr \
          --libdir=/lib64 \
         --with-python \
   		--with-python3
		
	}
	build()
	{
		make 
	}
	package()
	{
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libcap-ng) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak






sqlite
++++++

SQLite, C dilinde yazılmış ve gömülü bir veritabanı motoru olarak bilinen bir yazılımdır. Özellikle hafifliği ve taşınabilirliği ile dikkat çeker. SQLite, bir dosya sistemi üzerinde çalışarak verileri depolar ve bu sayede herhangi bir sunucuya ihtiyaç duymadan uygulama içinde kullanılabilir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="sqlite"
	version="3.45.2"
	description="A C library that implements an SQL database engine"
	srcver="3450200"
	source="https://www.sqlite.org/2024/sqlite-autoconf-$srcver.tar.gz"
	depends="zlib,readline"
	group="dev.db"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}


	setup(){
	    ./configure --prefix=/usr --libdir=/usr/lib64 --enable-fts3 --enable-fts4 --enable-fts5 --enable-rtree \
		CPPFLAGS="-DSQLITE_ENABLE_FTS3=1            \
		          -DSQLITE_ENABLE_FTS4=1            \
		          -DSQLITE_ENABLE_COLUMN_METADATA=1 \
		          -DSQLITE_ENABLE_UNLOCK_NOTIFY=1   \
		          -DSQLITE_ENABLE_DBSTAT_VTAB=1     \
		          -DSQLITE_SECURE_DELETE=1          \
		          -DSQLITE_ENABLE_FTS3_TOKENIZER=1"
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(sqlite) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




gzip
++++

Gzip, "GNU zip" ifadesinin kısaltmasıdır ve dosyaları sıkıştırmak için kullanılan bir yazılımdır. Temel amacı, dosya boyutunu azaltarak depolama alanından tasarruf sağlamak ve veri iletimini hızlandırmaktır. Gzip, genellikle metin dosyaları gibi tekrarlayan verilerde yüksek sıkıştırma oranları sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.13"
	name="gzip"
	depends=""
	description="Standard GNU compressor"
	source="https://ftp.gnu.org/gnu/gzip/${name}-${version}.zip"
	groups="app.arch"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	
	setup()
	{
		export DEFS="NO_ASM"
		./autoreconf -fvi
		./configure --prefix=/usr \
		--libdir=/usr/lib64/
	}
	build()
	{
		make 
	}
	package()
	{
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(gzip) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





xz-utils
++++++++

xz-utils, Linux işletim sistemlerinde dosyaları sıkıştırmak ve açmak için kullanılan bir yazılım paketidir. Bu paket, LZMA (Lempel-Ziv-Markov chain algorithm) algoritmasını temel alarak yüksek sıkıştırma oranları sağlar. xz-utils, genellikle büyük dosyaların depolanması ve aktarılması sırasında disk alanından tasarruf sağlamak amacıyla tercih edilir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="xz-utils"
	version="5.4.5"
	description="lzma compression utilities"
	source="https://tukaani.org/xz/xz-${version}.tar.gz"
	md5sums="66f82a9fa24623f5ea8a9ee6b4f808e2"
	group="app.arch"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
	    ./configure --prefix=/usr \
		--libdir=/usr/lib64 \
		--enable-static \
		--enable-shared \
		--enable-doc \
		--enable-nls
	}
	build(){
	    make $jobs
	}
	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(xz-utils) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




zstd
++++

Zstd (Zstandard), Facebook tarafından geliştirilen bir veri sıkıştırma algoritmasıdır. Bu paket, verilerin boyutunu azaltarak depolama alanından tasarruf sağlamak ve veri iletimini hızlandırmak amacıyla kullanılır. Zstd, hem sıkıştırma hem de açma işlemlerinde yüksek hız ve verimlilik sunar. Özellikle büyük veri setleri ile çalışırken, Zstd'nin sunduğu sıkıştırma oranları, diğer geleneksel algoritmalara göre daha üstündür.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.5.5"
	name="zstd"
	depends="glibc,readline,ncurses"
	description="şıkıştırma kütüphanesi"
	source="https://github.com/facebook/zstd/releases/download/v1.5.5/${name}-${version}.tar.gz"
	groups="libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()
	{
		echo ""
	}
	build()
	{
		make 
	}
	package()
	{
		make prefix=/usr install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(zstd) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




bzip2
+++++

bzip2, dosyaları sıkıştırmak için kullanılan bir yazılımdır ve genellikle Unix tabanlı sistemlerde tercih edilmektedir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.0.8"
	name="bzip2"
	depends="glibc,readline,ncurses"
	description="şıkıştırma kütüphanesi"
	source="https://sourceware.org/pub/bzip2/${name}-${version}.tar.gz"
	groups="app.arch"

	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"      #Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')    #Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
		    wget ${source}
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		    cp -prvf $PACKAGEDIR/files/ $SOURCEDIR
		    sed -i -e 's:\$(PREFIX)/man:\$(PREFIX)/share/man:g' -e 's:ln -s -f $(PREFIX)/bin/:ln -s :' Makefile
		    sed -i -e "s:1\.0\.4:$version:" bzip2.1 bzip2.txt Makefile-libbz2_so manual.*
	}
	build(){
		     make -f Makefile-libbz2_so all
		     make all
	}
	package(){
		    cd $SOURCEDIR
		    make DESTDIR=$DESTDIR/usr install
		    install -D libbz2.so.$version "$DESTDIR"/usr/lib64/libbz2.so.$version
		    ln -s libbz2.so.$version "$DESTDIR"/usr/lib64/libbz2.so
		    ln -s libbz2.so.$version "$DESTDIR"/usr/lib64/libbz2.so.${version%%.*}
		    mkdir -p "$DESTDIR"/usr/lib64/pkgconfig/
		    install -Dm644 files/bzip2.pc -t "$DESTDIR"/usr/lib64/pkgconfig
		    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/bzip2/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **bzip2** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.

Paket adında(bzip2) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





elfutils
++++++++

elfutils, ELF dosyalarının oluşturulması, düzenlenmesi ve incelenmesi için gerekli araçları sağlayan bir yazılım paketidir. Bu paket, özellikle derleyiciler ve bağlantı editörleri tarafından üretilen ikili dosyaların yapısını anlamak ve analiz etmek için kullanılır.

Paket, readelf, objdump, eu-strip gibi araçları içerir. Örneğin, readelf komutu, bir ELF dosyasının içeriğini detaylı bir şekilde görüntülemeye olanak tanırken, objdump ise ikili dosyaların iç yapısını analiz etmek için kullanılır. Bu araçlar, geliştiricilerin yazılımlarını optimize etmelerine ve hata ayıklama süreçlerini kolaylaştırmalarına yardımcı olur.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="elfutils"
	version="0.190"
	description="Libraries/utilities to handle ELF objects (drop in replacement for libelf)"
	source="https://sourceware.org/elfutils/ftp/${version}/elfutils-${version}.tar.bz2"
	depends="bzip2,xz-utils,zstd,zlib"
	group="dev.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
	    ./configure --prefix=/usr --libdir=/usr/lib64 \
			--enable-shared --disable-debuginfod --enable-libdebuginfod=dummy \
			--disable-thread-safety --disable-valgrind --disable-nls --program-prefix="eu-" --with-bzlib --with-lzma 
	}
	build(){
	    make
	}
	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(elfutils) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




libselinux
++++++++++

libselinux paketi, Linux işletim sistemlerinde güvenlik politikalarının uygulanmasına yardımcı olan bir kütüphanedir. Bu kütüphane, SELinux (Security-Enhanced Linux) mekanizmasının temel bileşenlerinden biridir.

Derleme
--------

Debian ortamında bu paketin derlenmesi için; **sudo apt install libpcre2-dev libsepol-dev** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell

	#!/usr/bin/env bash
	version="3.6"
	name="libselinux"
	depends=""
	description="lib"
	source="https://github.com/SELinuxProject/selinux/releases/download/3.6/${name}-${version}.tar.gz"
	groups="app.arch"

	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"      #Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')    #Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
			mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
			rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
			cd $ROOTBUILDDIR #dizinine geçiyoruz
			wget ${source}
			for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
			dowloadfile=$(ls|head -1)
			filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
			if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
			director=$(find ./* -maxdepth 0 -type d)
			directorname=$(basename ${director})
			if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
			mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()	{
			cp -prvf $PACKAGEDIR/files/ $SOURCEDIR
	}
	build()	{
		    patch -Np1 -i files/lfs64.patch
		    make FTS_LDLIBS="-lfts"
	}
	package()	{
		    make install DESTDIR=$DESTDIR
		    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.	

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/libselinux/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **libselinux** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(libselinux) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





tar
+++

Tar paketi, Unix ve Linux sistemlerinde dosya arşivleme ve sıkıştırma işlemleri için kullanılan bir dosya formatıdır. "tar" kelimesi, "tape archive" ifadesinin kısaltmasıdır ve başlangıçta manyetik bantlarda veri saklamak amacıyla geliştirilmiştir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="tar"
	version="1.35"
	description="Utility used to store, backup, and transport files"
	source="https://ftp.gnu.org/gnu/tar/tar-$version.tar.xz"
	depends="glibc,acl"
	builddepend=""
	groups="app.arch"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		export FORCE_UNSAFE_CONFIGURE=1
		./configure --prefix=/usr \
			--libdir=/usr/lib64 \
			--sbindir=/usr/bin \
			--libexecdir=/usr/lib64/tar \
			--localstatedir=/var \
			--enable-backup-scripts
	}
	build(){
		make 
	}
	package(){
		make DESTDIR=$DESTDIR install
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(tar) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





zlib
++++

Zlib, veri sıkıştırma ve açma işlemleri için geliştirilmiş açık kaynaklı bir kütüphanedir. Genellikle, Gzip ve PNG gibi formatların temelini oluşturur. Zlib, Deflate algoritmasını kullanarak verileri sıkıştırır ve bu sayede dosya boyutunu önemli ölçüde azaltır. Bu özellik, özellikle ağ üzerinden veri transferi sırasında bant genişliğinden tasarruf sağlamak için oldukça faydalıdır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.3"
	name="zlib"
	depends="glibc,readline,ncurses,flex"
	description="Compression library implementing the deflate compression method found in gzip and PKZIP"
	source="https://github.com/madler/zlib/archive/refs/tags/v$version.tar.gz"
	groups="app.arch"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		./configure --prefix=/usr
	}
	build(){
		make 
	}
	package(){
		make install pkgconfigdir="/usr/lib64/pkgconfig" DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(zlib) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





brotli
++++++

Brotli, Google tarafından geliştirilen ve özellikle web tarayıcıları için optimize edilmiş bir veri sıkıştırma algoritmasıdır. Bu algoritma, HTTP/2 ve HTTPS protokolleri ile birlikte kullanıldığında, web sayfalarının daha hızlı yüklenmesine olanak tanır. Brotli, gzip'e göre daha yüksek sıkıştırma oranları sunarak, veri transferini optimize eder.

Derleme
--------


Debian ortamında bu paketin derlenmesi için;

- **sudo apt install cmake** komutuyla paketin kurulması gerekmektedir.


.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.1.0"
	name="brotli"
	depends="glibc,zlib"
	description="Generic-purpose lossless compression algorithm"
	source="https://github.com/google/brotli/archive/refs/tags/v$version.tar.gz"
	groups="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
	    cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=True
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		mkdir -p $DESTDIR/lib
		mkdir -p $DESTDIR/lib/pkgconfig
		cp -prfv $DESTDIR/usr/lib/x86_64-linux-gnu/* $DESTDIR/lib/
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(brotli) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





curl
++++

Curl, "Client URL" ifadesinin kısaltmasıdır ve internet protokolleri üzerinden veri transferi yapabilen bir komut satırı aracıdır. Özellikle HTTP, HTTPS, FTP gibi protokollerle çalışarak, web sunucularına istek göndermek ve yanıt almak için kullanılır. Linux sistemlerinde yaygın olarak kullanılan bu araç, geliştiricilere ve sistem yöneticilerine API'lerle etkileşim kurma, dosya indirme veya yükleme gibi işlemleri kolaylaştırır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="8.4.0"
	name="curl"
	depends="glibc,acl,openssl"
	description="shell ve network copy"
	source="https://curl.se/download/${name}-${version}.tar.xz"
	groups="net.misc"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		        mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		        rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		        cd $ROOTBUILDDIR #dizinine geçiyoruz
		        wget ${source}
		        dowloadfile=$(ls|head -1)
		        filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		        if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		        director=$(find ./* -maxdepth 0 -type d)
		        directorname=$(basename ${director})
		        if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		        mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		    opts=(
		    --prefix=/usr --libdir=/usr/lib64 --disable-ldap --disable-ldaps --disable-versioned-symbols
		    --enable-doh --enable-ftp --enable-ipv6 --with-ca-path=/etc/ssl/certs --with-ca-bundle=/etc/ssl/cert.pem
		    --enable-threaded-resolverl --enable-websockets --without-libidn2 --without-libpsl --without-nghttp2)
		      #--without-zstd --without-zlib --without-brotli --without-libssh)
		    ./configure ${opts[@]} --with-openssl
	}
	build(){
		    make
	}
	package(){
			make install DESTDIR=$DESTDIR
		    cd $DESTDIR
		    for ver in 3 4.0.0 4.1.0 4.2.0 4.3.0 4.4.0 4.5.0 4.6.0 4.7.0; do
		    ln -s $DESTDIR/lib/libcurl.so.4.8.0 $DESTDIR/lib/libcurl.so.${ver}
			done
			${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Paket adında(curl) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





shadow
++++++

Shadow paketi, Linux işletim sistemlerinde kullanıcı hesaplarının şifrelerini güvenli bir şekilde saklamak için kullanılan bir mekanizmadır. Bu paket, kullanıcı bilgilerini ve şifrelerini içeren dosyaların yönetiminde önemli bir rol oynamaktadır.

Derleme
--------

Debian ortamında bu paketin derlenmesi için; **sudo apt install libreadline-dev libcap-dev libcap2-bin** komutları çalıştırıldıktan sonra derleme yapılmalıdır.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="shadow"
	version="4.13"
	description="Password and account management tool suite with support for shadow files and PAM"
	source="https://github.com/shadow-maint/shadow/releases/download/$version/shadow-$version.tar.xz"
	depends="pam,libxcrypt,acl,attr"
	group="sys.apps"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		cp -prvf $PACKAGEDIR/files/ $SOURCEDIR/
		autoreconf -fiv      
		./configure --prefix=/usr --libdir=/usr/lib64 --sysconfdir=/etc --bindir=/usr/bin --sbindir=/usr/sbin \
		--disable-account-tools-setuid --without-sssd --with-fcaps --with-libpam --without-group-name-max-length --with-bcrypt --with-yescrypt --without-selinux
	}

	build(){
	    make
	}
	package(){
		make install DESTDIR=$DESTDIR
		mkdir -p "${DESTDIR}/etc" "${DESTDIR}/etc/default/"
		sed -i "/.*selinux.*/d" ${DESTDIR}/etc/pam.d/*
		install -vDm 600 $SOURCEDIR/files/useradd.defaults "${DESTDIR}/etc/default/useradd"
		install -vDm 600 $SOURCEDIR/files/system-auth "${DESTDIR}/etc/pam.d/system-auth"
		if [ ! -f ${DESTDIR}/etc/group ] ; then install -vDm 600 $SOURCEDIR/files/group "${DESTDIR}/etc/group"; fi
		if [ ! -f ${DESTDIR}/etc/shadow ] ; then echo "root:*::0:::::" > ${DESTDIR}/etc/shadow; fi
		chmod 600 ${DESTDIR}/etc/shadow
		chmod 644 ${DESTDIR}/etc/group
		chown root ${DESTDIR}/etc/group  ${DESTDIR}/etc/shadow
		chgrp root ${DESTDIR}/etc/group  ${DESTDIR}/etc/shadow

		if [ ! -f "${DESTDIR}/etc/passwd" ]; then echo -e "root:x:0:0:root:/root:/bin/sh">${DESTDIR}/etc/passwd; fi
		    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/shadow/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **shadow** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.

Paket adında(shadow) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




file
++++

Linux'ta "file" komutu, dosyaların türlerini tanımlamak için kullanılan bir araçtır. Bu komut, dosyanın içeriğini analiz ederek, dosyanın ne tür bir veri içerdiğini belirler. Örneğin, bir dosyanın metin dosyası mı, ikili dosya mı yoksa bir resim dosyası mı olduğunu tespit edebilir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="file"
	version="5.45"
	description="Identify a files format by scanning binary data for patterns"
	source=("http://ftp.astron.com/pub/file/file-${version}.tar.gz")
	group=(sys.apps)
	depends=""
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
		    wget ${source}
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
	    opts=(
	    	--prefix=/usr
		--libdir=/usr/lib64
		--enable-static
		--enable-elf
		--enable-elf-core
	    )
	    ./configure ${opts[@]} \
		$(use_opt zlib --enable-zlib --disable-zlib) \
		$(use_opt lzma --enable-xzlib --disable-xzlib) \
		$(use_opt bzip2 --enable-bzlib --disable-bzlib) \
		$(use_opt seccomp --enable-libseccomp --disable-libseccomp)
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(file) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




eudev
+++++

Eudev, Linux tabanlı sistemlerde cihaz yönetimi için kullanılan bir kullanıcı alanı aracı olan udev'in bir fork'udur. Udev, sistemdeki donanım bileşenlerinin tanınması, yönetilmesi ve olay bildirimlerinin gerçekleştirilmesi için kritik bir rol oynar.

Derleme
--------

Debian ortamında bu paketin derlenmesi için; **sudo apt install libkmod-dev l libgperf-dev** komutuyla paketin kurulması gerekmektedir.


.. code-block:: shell
	
	#!/usr/bin/env bash
	version="3.2.14"
	name="eudev"
	depends="glibc,readline,ncurses,gperf"
	description="modül ve sistem iletişimi sağlayan paket"
	source="https://github.com/eudev-project/eudev/releases/download/v3.2.14/${name}-${version}.tar.gz"
	groups="sys.fs"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		cp $PACKAGEDIR/files/eudev.hook $SOURCEDIR
		cp $PACKAGEDIR/files/eudev.init-bottom $SOURCEDIR
		cp $PACKAGEDIR/files/eudev.init-top $SOURCEDIR

		./configure --prefix=/usr --bindir=/sbin --sbindir=/sbin --libdir=/lib64 --disable-manpages --disable-static --disable-selinux --enable-modules \
		   	--enable-kmod --sysconfdir=/etc --exec-prefix=/ --with-rootprefix=/ --with-rootrundir=/run --with-rootlibexecdir=/lib64/udev --enable-split-usr 
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		mkdir -p ${DESTDIR}/usr/share/initramfs-tools/{hooks,scripts}
	  	mkdir -p ${DESTDIR}/usr/share/initramfs-tools/scripts/init-{top,bottom}
	  	install $SOURCEDIR/eudev.hook         ${DESTDIR}/usr/share/initramfs-tools/hooks/udev
	    install $SOURCEDIR/eudev.init-top         ${DESTDIR}/usr/share/initramfs-tools/scripts/init-top/udev
	    install $SOURCEDIR/eudev.init-bottom         ${DESTDIR}/usr/share/initramfs-tools/scripts/init-bottom/udev
	    	
		cd ${DESTDIR}
		mkdir -p bin
		cd bin
		ln -s ../sbin/udevadm udevadm
		ln -s ../sbin/udevd udevd
		mkdir -p  ${DESTDIR}/usr/lib64/pkgconfig/
		cd ${DESTDIR}/usr/lib64/pkgconfig/
		ln -s ../../../lib64/pkgconfig/libudev.pc libudev.pc
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/eudev/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **eudev** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.

Paket adında(eudev) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




cpio
++++

CPIO (Copy In and Out), Unix ve Linux işletim sistemlerinde dosyaları arşivlemek ve taşımak için kullanılan bir komut satırı aracıdır. CPIO, dosyaları bir arşiv dosyası içinde saklayarak, bu dosyaların daha sonra kolayca geri yüklenmesini sağlar. CPIO, genellikle tarayıcılar ve diğer arşivleme araçları ile birlikte kullanılır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="cpio"
	version="2.15"
	description="A tool to copy files into or out of a cpio or tar archive"
	source="https://ftp.gnu.org/gnu/cpio/cpio-$version.tar.gz"
	depends="glibc"
	group="app.arch"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
	    CFLAGS+=' -fcommon'
	    ./configure --prefix=/usr
	}
	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(cpio) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




libsepol
++++++++

libsepol, SELinux'un güvenlik politikalarını oluşturmak, düzenlemek ve uygulamak için gerekli olan temel bir kütüphanedir. SELinux, Linux çekirdeği üzerinde güvenlik katmanları ekleyerek sistemin güvenliğini artırmayı amaçlar. libsepol, bu güvenlik politikalarının tanımlanması ve yönetilmesi için gerekli olan araçları sağlar.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install flex** 

komutuyla paketin kurulması gerekmektedir.



.. code-block:: shell
	
	#!/usr/bin/env bash
	version="3.6"
	name="libsepol"
	depends=""
	description="lib"
	source="https://github.com/SELinuxProject/selinux/releases/download/3.6/${name}-${version}.tar.gz"
	groups="app.arch"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()	{
		echo ""
	}
	build()	{
		make 
	}
	package()	{
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libsepol) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





kmod
++++

Bash, Linux ve diğer Unix tabanlı işletim sistemlerinde kullanılan bir kabuk programlama dilidir. Kullanıcıların komutlar vererek işletim sistemini yönetmelerine olanak tanır. Bash, kullanıcıların işlemleri otomatikleştirmesine ve betik dosyaları oluşturmasına olanak tanır. Özellikle sistem yöneticileri ve geliştiriciler arasında yaygın olarak kullanılan güçlü bir araçtır.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install libkmod-dev** 

komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="kmod"
	version="32"
	description="library and tools for managing linux kernel modules"
	source="https://mirrors.edge.kernel.org/pub/linux/utils/kernel/kmod/kmod-$version.tar.xz"
	depends="zlib,xz-utils"
	group=(sys.apps)

	export PATH=$HOME:$PATH
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
	    touch libkmod/docs/gtk-doc.make
	    ./configure --prefix=/usr --libdir=/usr/lib64/ --bindir=/bin --with-rootlibdir=/lib --with-zlib --with-openssl
	}
	build(){
	    make
	}
	package(){
	    make install DESTDIR=$DESTDIR
	    mkdir -p ${DESTDIR}/sbin
	    for i in lsmod rmmod insmod modinfo modprobe depmod; do
			ln -sf ../bin/kmod "$DESTDIR"/sbin/$i
		done
		for i in lsmod modinfo; do
			ln -s kmod "$DESTDIR"/bin/$i
		done
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(kmod) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
 
Linux çekirdeği ile donanım arasındaki haberleşmeyi sağlayan kod parçalarıdır. Bu kod parçalarını kernele eklediğimizde kerneli tekrardan derlememiz gerekmektedir. Her kod ekleme ve her kod çıkartma işleminden sonra kernel derlemek ciddi bir iş yükü ve karmaşa oluşturacaktır.

Bu sorunların çözümü için modul vardır. Moduller kernele istediğimiz kod parçalarını ekleme ya da çıkartma yapabilmemizi sağlar. Bu işlemleri yaparken kernel derleme işlemi yapmamıza gerek yoktur.

kmod Komutları
--------------

- **lsmod :** yüklü modulleri listeler
- **insmod:** tek bir modul yükler
- **rmmod:** tek bir modul siler
- **modinfo:** modul hakkında bilgi alınır 
- **modprobe:** insmod komutunun aynısı fakat daha işlevseldir. module ait bağımlı olduğu modülleride yüklemektedir. modprobe  modülü /lib/modules/ dizini altında aramaktadır.
- **depmod:** /lib/modules dizinindeki modüllerin listesini günceller. Fakat başka bir dizinde ise basedir=konum şeklinde belirtmek gerekir. konum dizininde /lib/modules/** şeklinde kalsörler olmalıdır.

Test Edilmesi
-------------

Bir modül eklendiğinde veya çıkartıldığında modülle ilgili mesajları dmesg logları ile görebiliriz.

.. raw:: pdf

   PageBreak




audit
+++++

Audit paketi, Linux sistemlerinde güvenlik denetimlerini gerçekleştirmek için tasarlanmış bir yazılımdır. Bu paket, sistemdeki önemli olayları, kullanıcı aktivitelerini ve dosya erişimlerini kaydederek, sistem yöneticilerine kapsamlı bir denetim ve izleme imkanı sunar. 

Derleme
--------

Debian ortamında bu paketin derlenmesi için; **sudo apt install libaudit-dev** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="audit"
	version='3.1.1'
	depends=""
	description="servis yöneticisi"
	source="https://github.com/linux-audit/audit-userspace/archive/refs/tags/v$version.tar.gz"
	groups="sys.process"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"      #Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')    #Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
		        mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		        rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		        cd $ROOTBUILDDIR #dizinine geçiyoruz
		        wget ${source}
		        for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		        dowloadfile=$(ls|head -1)
		        filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		        if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		        director=$(find ./* -maxdepth 0 -type d)
		        directorname=$(basename ${director})
		        if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		        mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		cp -prvf $PACKAGEDIR/files/ $SOURCEDIR
		./autogen.sh
		./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib64 --disable-zos-remote --disable-listener --disable-systemd \
		--disable-gssapi-krb5 --enable-shared=audit --with-arm --with-aarch64 --without-python --without-python3 --with-libcap-ng=no
	}
	build(){
		    make
	}
	package(){
		make install DESTDIR=$DESTDIR
		install -Dm755 files/auditd.initd "$DESTDIR"/etc/init.d/auditd
		install -Dm755 files/auditd.confd "$DESTDIR"/etc/conf.d/auditd
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/audit/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **audit** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(audit) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





libxcrypt
+++++++++

libxcrypt, Unix benzeri sistemlerde parolaların şifrelenmesi için kullanılan bir kütüphanedir. Bu kütüphane, geleneksel crypt() fonksiyonunun yerini alarak daha güvenli ve esnek bir şifreleme yöntemi sunar. libxcrypt, çeşitli şifreleme algoritmalarını destekler; bunlar arasında bcrypt, scrypt ve Argon2 gibi modern algoritmalar bulunmaktadır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="libxcrypt"
	version="4.4.36"
	description="libxcrypt"
	source=("https://github.com/besser82/libxcrypt/releases/download/v4.4.36/libxcrypt-4.4.36.tar.xz")
	group=(net.libs)
	depends=""
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		   mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup() {
	    ./configure --prefix=/usr --libdir=/usr/lib64/ --sbindir=/usr/bin 
	}
	build() {
	    make -C $SOURCEDIR
	}
	package() {
	    make -C $SOURCEDIR install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libxcrypt) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




libnsl
++++++

libnsl, "Network Services Library" anlamına gelen bir kütüphanedir ve genellikle Unix sistemlerinde ağ hizmetleri ile ilgili işlevsellik sağlamak amacıyla kullanılır. Bu kütüphane, uzaktan prosedür çağrıları (RPC) ve diğer ağ iletişim protokollerinin uygulanmasında kritik bir bileşendir. libnsl, özellikle eski sistemlerde ve uygulamalarda yaygın olarak bulunur ve modern sistemlerde de bazı uygulamalar için gereklidir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="libnsl"
	version="2.0.0"
	url="https://github.com/thkukuk/libnsl"
	description="Public client interface library for NIS(YP)"
	source="https://github.com/thkukuk/libnsl/releases/download/v$version/libnsl-$version.tar.xz"
	depends="libtirpc"
	group="net.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
	    ./configure --prefix=/usr --libdir=/usr/lib64
	}
	build(){
	    make $jobs
	}
	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libnsl) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




libbsd
++++++

libbsd, geliştiricilere daha güvenli ve taşınabilir kod yazma imkanı tanırken, aynı zamanda BSD sistemlerinde yaygın olarak kullanılan işlevlerin Linux üzerinde de kullanılmasını sağlar. Bu kütüphane, sistem programlama ve ağ programlama gibi alanlarda sıkça tercih edilmektedir.

Derleme
--------

Derlemek için **sudo apt-get install libbsd-dev** paketi kurulmalı.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="libbsd"
	version="0.11.7"
	description="Library to provide useful functions commonly found on BSD systems"
	source="https://libbsd.freedesktop.org/releases/libbsd-$version.tar.xz"
	depends=""
	group="dev.libs"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"      #Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')    #Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
		    wget ${source}
		    for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		autoreconf -fvi
		./configure --prefix=/usr --libdir=/usr/lib64
	}

	build(){
		make
	}

	package(){
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libbsd) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build

.. raw:: pdf

   PageBreak




libtirpc
++++++++

libtirpc, UNIX sistemlerinde yaygın olarak kullanılan bir RPC kütüphanesidir. Bu kütüphane, istemci ve sunucu uygulamaları arasında uzaktan prosedür çağrıları yapmayı mümkün kılar. libtirpc, özellikle dağıtık sistemlerde veri paylaşımını ve iletişimi kolaylaştırmak amacıyla geliştirilmiştir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="libtirpc"
	version="1.3.3"
	description="Transport Independent RPC library (SunRPC replacement)"
	source="https://downloads.sourceforge.net/libtirpc/libtirpc-$version.tar.bz2"
	depends=""
	group="net.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}


	setup(){
		./configure --prefix=/usr \
		--libdir=/usr/lib64 \
		--sysconfdir=/etc \
		--disable-gssapi
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libtirpc) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




e2fsprogs
+++++++++

e2fsprogs, Linux tabanlı sistemlerde yaygın olarak kullanılan bir dosya sistemi yönetim aracıdır. Bu paket, ext2, ext3 ve ext4 dosya sistemleri üzerinde çeşitli işlemler yapabilmek için gerekli olan araçları içerir. Örneğin, dosya sistemi oluşturma, onarma, kontrol etme ve boyutlandırma gibi işlemler e2fsprogs ile gerçekleştirilebilir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.47.0"
	name="e2fsprogs"
	depends="glibc,readline,ncurses"
	description="modül ve sistem iletişimi sağlayan paket"
	source="https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v${version}/${name}-${version}.tar.xz"
	groups="sys.fs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		./configure --sbindir=/usr/bin --libdir=/usr/lib64/  
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		rm -rf $DESTDIR/usr/share/man/man8/fsck.8
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(e2fsprogs) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





dostools
++++++++

Dostools, Linux işletim sistemlerinde kullanılan bir dizi araç ve komut setidir. Bu araçlar, sistem yöneticilerine ve geliştiricilere, sistem yönetimi, dosya işlemleri ve ağ yönetimi gibi çeşitli görevleri daha verimli bir şekilde gerçekleştirme imkanı sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="4.2"
	name="dosfstools"
	depends="glibc"
	description="DOS filesystem tools - provides mkdosfs, mkfs.msdos, mkfs.vfat"
	source="https://github.com/dosfstools/dosfstools/archive/refs/tags/v$version.tar.gz"
	groups="sys.block"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		./autogen.sh
		./configure --prefix=/usr --libdir=/usr/lib64/ --enable-compat-symlinks
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(dostools) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





initramfs-tools
+++++++++++++++

initramfs-tools, Debian tabanlı sistemlerde kullanılan bir araçtır ve initramfs (initial RAM file system) oluşturmak için kullanılır. Bu araç, sistem açılırken kullanılan geçici bir dosya sistemini oluşturur ve gerekli modülleri yükler. initramfs için farklı araçlarda kullanılabilir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="0.142"
	name="initramfs-tools"
	depends="glibc,readline,ncurses"
	description="initramfs  generate sağlayan paket"
	source="https://salsa.debian.org/kernel-team/initramfs-tools/-/archive/v$version/initramfs-tools-v$version.tar.gz"
	groups="sys.fs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
		        mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		        rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		        cd $ROOTBUILDDIR #dizinine geçiyoruz
		        wget ${source}
		        for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		        dowloadfile=$(ls|head -1)
		        filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		        if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		        director=$(find ./* -maxdepth 0 -type d)
		        directorname=$(basename ${director})
		        if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		        mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup()	{
		    cp -prfv $PACKAGEDIR/files/* $SOURCEDIR/
		    patch -Np1 < $SOURCEDIR/patches/remove-zstd.patch
		    patch -Np1 < $SOURCEDIR/patches/remove-logsave.patch
		    patch -Np1 < $SOURCEDIR/patches/non-debian.patch
	}
	build()	{
	echo ""
	}
	package()	{
		    cat debian/*.install | sed "s/\t/ /g" | tr -s " " | while read line ; do
		    file=$(echo $line | cut -f1 -d" ")
		    target=$(echo $line | cut -f2 -d" ")
		    mkdir -p ${DESTDIR}/$target
		    cp -prvf $file ${DESTDIR}/$target/
		    done
		    # install mkinitramfs
		    cp -pvf mkinitramfs ${DESTDIR}/usr/sbin/mkinitramfs
		    sed -i "s/@BUSYBOX_PACKAGES@/busybox/g" ${DESTDIR}/usr/sbin/mkinitramfs
		    sed -i "s/@BUSYBOX_MIN_VERSION@/1.22.0/g" ${DESTDIR}/usr/sbin/mkinitramfs
		    # Remove debian stuff
		    rm -rvf ${DESTDIR}/etc/kernel
		    # install sysconf
		    mkdir -p ${DESTDIR}/etc/sysconf.d
		    install $SOURCEDIR/initramfs-tools.sysconf ${DESTDIR}/etc/sysconf.d/initramfs-tools
		    install $SOURCEDIR/zzz-busybox ${DESTDIR}/usr/share/initramfs-tools/hooks/
		    install $SOURCEDIR/modules ${DESTDIR}/usr/share/initramfs-tools/
		    install $SOURCEDIR/modules ${DESTDIR}/etc/initramfs-tools/

		    mkdir -p ${DESTDIR}/usr/share/initramfs-tools/conf-hooks.d
		    install $SOURCEDIR/conf-hooks.d/busybox ${DESTDIR}/usr/share/initramfs-tools/conf-hooks.d/
		    mkdir -p ${DESTDIR}/etc/initramfs-tools/scripts
			${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	  }
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


.. raw:: pdf

   PageBreak

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/initramfs-tools/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **initramfs-tools** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(initramfs-tools) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build

**/etc/initramfs-tools/modules**
---------------------------------

**modules** dosyası initrd oluşturulma ve güncelleme durumunda isteğe bağlı olarak modullerin eklenmesisini ve **initrd** açıldığında modülün yüklenmesini istiyorsak **/etc/initramfs-tools/modules** komundaki dosyayı  aşağıdaki gibi düzenlemeliyiz. Bu dosya içinde **ext4**, **vfat** ve diğer yardımcı moduller eklenmiş durumdadır. 

.. code-block:: shell

	### This file is the template for /etc/initramfs-tools/modules.
	### It is not a configuration file itself.
	###
	# List of modules that you want to include in your initramfs.
	# They will be loaded at boot time in the order below.
	#
	# Syntax:  module_name [args ...]
	#
	# You must run update-initramfs(8) to effect this change.
	#
	# Examples:
	#
	# raid1
	# sd_mod
	vfat
	fat
	nls_cp437
	nls_ascii
	nls_utf8
	ext4
 
**initramfs-tools Ayarları**
----------------------------

**/usr/share/initramfs-tools/hooks/** konumundaki dosyaları dikkatlice düzenlemek gerekmektedir.
Dosyaları alfabetik sırayla çalıştırdığı için **busybox** **zzz-busybox** şeklinde ayarlanmıştır.

**initrd Oluşturma/Güncelleme**
-------------------------------

Sistemin initrd.img dosyasının güncellenmesi/oluşturulması için çalıştığınız sistemde  aşağıdaki komutlarla yapılabilir. 

.. code-block:: shell

	/usr/sbin/update-initramfs -u -k $(uname -r) #initrd günceller

Eğer bir dizin içinde bir sisteme initrd oluşturlacaksa, yani chroot ile sisteme erişiliyorsa yukarıdaki komut yeterli olmayacaktır. chroot öncesinde sistemin **dev sys proc run** dizinlerinin  bağlanılması gerekmektedir. Dizindeki sistemimizin dizin konumu **/$HOME/distro/rootfs** olsun. Buna göre aşağıda sisteme yukarıdaki komutu çalıştırmadan önce çalıştırılması gereken komutlar aşağıda verilmiştir. Dikkat edilmesi gereken en önemli noktalardan biriside bu komutlar **root** yetkisiyle çalıştırılmalıdır.

.. code-block:: shell

	rootfs="$HOME/distro/rootfs"
	distro="$HOME/distro"
	mkdir -p $rootfs/dev
	mkdir -p $rootfs/sys
	mkdir -p $rootfs/proc 
	mkdir -p $rootfs/run
	mkdir -p $rootfs/tmp
	mount --bind /dev $rootfs/dev
	mount --bind /sys $rootfs/sys
	mount --bind /proc $rootfs/proc
	mount --bind /run$rootfs/run
	mount --bind /tmp $rootfs/tmp
	
	### update-initrd
	fname=$(basename $rootfs/boot/config*)
	kversion=${fname:7}
	mv $rootfs/boot/config* $rootfs/boot/config-$kversion
	cp $rootfs/boot/config-$kversion $rootfs/etc/kernel-config
	
	chroot $rootfs update-initramfs -u -k $kversion
	
	umount -lf -R $rootfs/dev 2>/dev/null
	umount -lf -R $rootfs/sys 2>/dev/null
	umount -lf -R $rootfs/proc 2>/dev/null
	umount -lf -R $rootfs/run 2>/dev/null
	umount -lf -R $rootfs/tmp 2>/dev/null
	#### Copy initramfs
	cp -pf $rootfs/boot/initrd.img-* $distro/iso/boot/initrd.img
	 
Güncelleme ve oluşturma aşamasında **/usr/share/initramfs-tools/hooks/** konumundaki dosyarı çalıştırarak yeni initrd dosyasını oluşturacaktır.
Oluşturma **/var/tmp** olacaktır. Ayrıca **/boot/config-6.6.0-amd64** gibi sistemde kullanılan kernel versiyonuyla config dosyası olmalıdır. Burada verilen **6.6.0-amd64** örnek amaçlı verilmiştir.

**initrd açılma Süreci**
------------------------

Sistemin açılması için **vmlinuz**, **initrd.img** ve **grub.cfg** dosyalarının olması yeterlidir. **initrd.img** sistemin açılma sürecini yürüten bir kernel yardımcı ön sistemidir. **initrd.img** açıldığında aşğıdaki gibi bir dizin yapısı olur. Bu dizinler içindeki **script** dizini çok önemlidir. Bu dizin içindeki scriptler belirli bir sırayla çalışarak sistemin açılması sağlanır.

.. image:: /_static/images/initrd-2.png
  	:width: 600

**initrd script İçeriği**
-------------------------
**script** içerindeki dizinler  aşağıdaki gibidir. Bu dizinler içinde scriptler vardır. Bu dizinlerin içeriği sırayla şöyle çalışmaktadır.

1. init-top
2. init-premount
3. init-bottom

.. image:: /_static/images/initrd-3.png
  	:width: 600
  	
Oluşan initrd.img dosyası sistemin açılmasını sağlayamıyorsa script açılış sürecini takip ederek sorunları çözebilirsiniz.

.. raw:: pdf

   PageBreak

libxml2
+++++++

libxml2, özellikle XML ve HTML belgeleri ile çalışmak için tasarlanmış, yüksek performanslı bir C kütüphanesidir. Geliştiricilere, XML belgelerini analiz etme, oluşturma ve düzenleme gibi işlemleri gerçekleştirme imkanı sunar. libxml2, DOM (Document Object Model) ve SAX (Simple API for XML) gibi iki farklı API ile çalışabilme yeteneğine sahiptir. Bu sayede, hem bellek dostu hem de hızlı bir şekilde veri işleme imkanı sağlar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="2.12.6"
	name="libxml2"
	depends="glibc,acl,openssl,libtool,icu"
	builddepend="python3"
	description="XML C parser and toolkit"
	source="https://github.com/GNOME/libxml2/archive/refs/tags/v${version}.tar.gz"
	groups="dev.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
        ./autogen.sh
       	./configure --prefix=/usr --libdir=/usr/lib64 --with-history --with-icu --with-legacy --with-threads
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		mkdir -p $DESTDIR/usr/lib64/python3.11
		mv $DESTDIR/usr/lib/* $DESTDIR/usr/lib64/
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libxml2) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





expat
+++++

Expat, özellikle C dilinde geliştirilmiş bir XML ayrıştırma kütüphanesidir. Bu kütüphane, XML belgelerini okuma ve işleme süreçlerini kolaylaştırmak amacıyla tasarlanmıştır. Expat, olay tabanlı bir ayrıştırma modeli kullanarak, XML belgelerinin içeriğini parçalara ayırır ve bu parçaları işlemek için geliştiricilere bir dizi geri çağırma (callback) fonksiyonu sunar. Bu sayede, büyük XML dosyaları ile çalışırken bellek verimliliği sağlanır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="expat"
	version="2.6.2"
	vrsn="2_6_2"
	description="An XML parser library"
	#source="https://github.com/libexpat/libexpat/archive/refs/tags/R_${version}.tar.gz"
	source="https://github.com/libexpat/libexpat/releases/download/R_${vrsn}/expat-${version}.tar.bz2"
	depends=""
	builddepend=""
	group="dev.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
	    cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib64 \
		-DCMAKE_BUILD_TYPE=None \
		-DEXPAT_BUILD_DOCS=false \
		-W no-dev \
		-B $BUILDDIR
	}
	build(){
	    make -C $BUILDDIR
	}
	package(){
	    make DESTDIR="$DESTDIR" install -C $BUILDDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(expat) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




libmd
+++++

libmd, özellikle BSD tabanlı sistemlerde bulunan bir kütüphanedir ve çeşitli kriptografik hash fonksiyonlarını (MD5, SHA-1, SHA-256 gibi) destekler. Bu kütüphane, veri bütünlüğünü sağlamak ve şifreleme işlemlerini gerçekleştirmek için kullanılır. Örneğin, bir dosyanın hash değerini hesaplamak, dosyanın değiştirilip değiştirilmediğini kontrol etmek için yaygın bir yöntemdir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="libmd"
	version="1.1.0"
	description="Message Digest functions from BSD systems"
	depends=""
	group="app.crypt"
	source="https://archive.hadrons.org/software/libmd/libmd-$version.tar.xz"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
	    ./configure --prefix=/usr --libdir=/usr/lib64/
	}
	build(){
	    make 
	}
	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libmd) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




libaio
++++++

Libio, C dilinde girdi/çıktı işlemlerini kolaylaştıran bir kütüphanedir. Temel olarak, dosya okuma ve yazma işlemlerini, bellek yönetimini ve veri akışını yönetmek için kullanılır. Libio, performansı artırmak amacıyla tamponlama (buffering) mekanizmaları kullanır. Bu sayede, verilerin daha verimli bir şekilde işlenmesini sağlar. Örneğin, bir dosyadan veri okurken, veriler önce bir tampon belleğe alınır ve ardından işlenir. Bu, disk erişimlerini azaltarak programın genel performansını artırır.

Derleme
-------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="libaio"
	version="0.3.113"
	description="Asynchronous input/output library that uses the kernels native interface"
	source="https://pagure.io/libaio/archive/libaio-$version/libaio-libaio-$version.tar.gz"
	depends=""
	builddepend=""
	group="dev.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup (){
		echo ""
	}
	build(){
		
	    make
	}
	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libio) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




lvm2
++++

LVM2 (Logical Volume Manager 2), Linux işletim sistemlerinde disk alanını yönetmek için kullanılan bir araçtır. LVM2, fiziksel disklerin mantıksal birimlere dönüştürülmesine olanak tanır. Bu sayede, disk alanı dinamik olarak genişletilebilir veya daraltılabilir. LVM2, sistem yöneticilerine disk alanını daha verimli bir şekilde kullanma imkanı sunar. Örneğin, bir fiziksel disk üzerinde birden fazla mantıksal birim oluşturabilir ve bu birimlerin boyutlarını ihtiyaçlara göre değiştirebilirsiniz.

Debian ortamında derlemek lvm2 paketinde sorunlar çıkmaktadır. Bunun sebebi kernel derlenmesi sırasında lvm ile ilgili özellikleri aktif etmek gerekiyor. Bundan dolayı isteyen aşağıda derleme bölümünde verilen derleme talimatını kullanarak başka dağıtımlarda derleme yapabilir. Burada geliştirilmesi anlatılan sistem üzerinde derlenen paketi indirip hazırladığımız sisteme kuran script aşağıda verilmiştir.

lvm2 Kurma Scripti
------------------

.. code-block:: shell

	#!/usr/bin/env bash
	name="lvm2"
	version="2_03_21"
	description="User-land utilities for LVM2 (device-mapper) software"
	source=""
	depends="libaio"
	builddepend=""
	group="sys.fs"

	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
 		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		mkdir -p $SOURCEDIR
		cd $SOURCEDIR
		wget -O lvm2.bps https://kendilinuxunuyap.github.io/_static/files/lvm2/lvm2-2_03_21.bps 				#dosya indiriliyor
		# tar -xf lvm2.bps
		tar -xf lvm2.bps
		tar -xf rootfs.tar.xz
	}
	build(){
		echo ""
	}
	package(){
		cd $SOURCEDIR
		cp -prfv etc  ${DESTDIR}/
		cp -prfv usr  ${DESTDIR}/
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(lvm2) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build

  
.. raw:: pdf

   PageBreak
 
Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="lvm2"
	version="2_03_21"
	description="User-land utilities for LVM2 (device-mapper) software"
	source="https://github.com/lvmteam/lvm2/archive/refs/tags/v$version.tar.gz"
	depends="libaio"
	builddepend=""
	group="sys.fs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
			./configure --prefix=/usr --libdir=/usr/lib64/  CONFIG_SHELL=/bin/bash --sbindir=/usr/bin \ 
			--sysconfdir=/etc --localstatedir=/var \
			--enable-cmdlib --enable-dmeventd --enable-lvmpolld --enable-pkgconfig --enable-readline \
			--enable-udev_rules --enable-udev_sync --enable-write_install --disable-systemd \
			--with-cache=internal --with-default-dm-run-dir=/run --with-default-locking-dir=/run/lock/lvm \
			--with-default-pid-dir=/run --with-default-run-dir=/run/lvm --with-thin=internal --with-udev-prefix=/usr
	}
	build(){
	    make
	}
	package() {
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(lvm2) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




popt
++++

Popt, "Portable Options Parsing Library" ifadesinin kısaltmasıdır ve özellikle C programlama dilinde geliştirilmiş bir kütüphanedir. Bu kütüphane, komut satırı argümanlarını analiz etmek ve yönetmek için kullanılır. Popt, kullanıcıların programlarına daha anlaşılır ve esnek bir seçenek yönetimi eklemelerine olanak tanır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="popt"
	version="1.19"
	description="A commandline option parser"
	source="http://ftp.rpm.org/popt/releases/popt-${version%.*}.x/popt-${version}.tar.gz"
	depends=""
	builddepend=""
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		CFLAGS+=" -ffat-lto-objects" ./configure --prefix=/usr
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(popt) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




icu
+++

ICU, çok dilli uygulamalar geliştirmek için gerekli olan metin işleme, tarih ve saat formatlama, sayı biçimlendirme gibi işlevleri sağlayan bir kütüphanedir. Unicode standardını destekleyerek, farklı dillerdeki karakterlerin doğru bir şekilde işlenmesini ve görüntülenmesini mümkün kılar. Özellikle, uluslararasılaşma (i18n) ve yerelleştirme (l10n) süreçlerinde kritik bir rol oynar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="icu"
	version="74-2"
	description="icu International Components for Unicode"
	source=("https://github.com/unicode-org/icu/releases/download/release-${version}/icu4c-74_2-src.tgz")
	depends=()
	group=(dev.libs)
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
	    cd source
	    ./configure --prefix=/usr \
		--libdir=/usr/lib64/
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    chmod +x "$DESTDIR"/usr/bin/icu-config
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(icu) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




iproute2
++++++++

iproute2, Linux tabanlı sistemlerde ağ yönetimi için geliştirilmiş bir araç setidir. Bu araç seti, özellikle ağ yönlendirmesi ve trafik kontrolü gibi karmaşık işlemleri gerçekleştirmek için kullanılır. iproute2, ip komutu ile birlikte gelir ve bu komut, ağ arayüzlerini, yönlendirme tablolarını ve diğer ağ yapılandırmalarını yönetmek için kapsamlı bir arayüz sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="iproute2"
	version="6.10.0"
	description="GNU regular expression matcher"
	source="https://mirrors.edge.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.10.0.tar.xz"
	depends=""
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		cp -prvf ${PACKAGEDIR}/files/ $SOURCEDIR/
		patch -Np1 -i $SOURCEDIR/files/0001-make-iproute2-fhs-compliant.patch
		patch -Np1 -i $SOURCEDIR/files/0002-bdb-5-3.patch
		sed -i 's/-Werror//' Makefile
		export CFLAGS+=' -ffat-lto-objects'
		./configure
	}
	build(){
	   make DBM_INCLUDE='/usr/include/db5.3'
	}
	package(){
		make DESTDIR=$DESTDIR SBINDIR="/sbin" install
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/iproute2/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **iproute2** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(iproute2) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




net-tools
+++++++++

net-tools, Linux tabanlı sistemlerde ağ yönetimi için kullanılan klasik bir araçlar paketidir. Bu paket, ifconfig, route, netstat, arp gibi komutları içerir. ifconfig komutu, ağ arayüzlerinin durumunu görüntülemek ve yapılandırmak için kullanılırken, route komutu yönlendirme tablolarını yönetmekte kullanılır. netstat ise ağ bağlantılarını ve istatistiklerini gösterir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="net-tools"
	version="2.10"
	description="GNU regular expression matcher"
	source="https://sourceforge.net/projects/net-tools/files/net-tools-2.10.tar.xz"
	depends=""
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		export BINDIR='/usr/bin' SBINDIR='/usr/bin'
	}

	build(){
	   yes "" | make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    # the following is provided by yp-tools
	  	rm "${DESTDIR}"/usr/bin/{nis,yp}domainname
	  	# hostname is provided by inetutils
	  	rm "${DESTDIR}"/usr/bin/{hostname,dnsdomainname,domainname}
	  	rm -r "${DESTDIR}"/usr/share/man/man1
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(net-tools) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




dhcp
++++

Bu protokol, bir istemci cihazın ağa bağlandığında, DHCP sunucusuna bir istek göndererek IP adresi talep etmesiyle başlar. Sunucu, istemciye uygun bir IP adresi, alt ağ maskesi, varsayılan ağ geçidi ve DNS sunucusu gibi bilgileri iletir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="dhcp"
	version="4.4.3"
	description="GNU regular expression matcher"
	source="https://downloads.isc.org/isc/dhcp/4.4.3/dhcp-4.4.3.tar.gz"
	depends=""
	group="sys.apps"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		cp -prvf ${PACKAGEDIR}/files $SOURCEDIR/
    	./configure --prefix=/usr --libdir=/usr/lib64/
	}
	build(){
	    make
	}
	package(){
		mkdir -p $DESTDIR/sbin/
	    make install DESTDIR=$DESTDIR
	    install  $SOURCEDIR/client/scripts/linux $DESTDIR/sbin/dhclient-script
	    mkdir -p $DESTDIR/etc/init.d    
	    for level in boot default nonetwork shutdown sysinit ; do
	    mkdir -p ${DESTDIR}/etc/runlevels/$level
	    done
		install -Dm755  $SOURCEDIR/files/dhclient.init.d $DESTDIR/etc/init.d/dhclient
		install -Dm755  $SOURCEDIR/files/dhclient.init.d ${DESTDIR}/etc/runlevels/default/dhclient
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/dhcp/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **dhcp** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.

Paket adında(dhcp) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




openrc
++++++

OpenRC, sistem başlangıcını ve hizmetlerin yönetimini sağlamak amacıyla geliştirilmiş bir init sistemidir. 

Derleme
-------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="openrc"
	version="0.53"
	description="The OpenRC init system"
	source="https://github.com/OpenRC/openrc/archive/refs/tags/$version.zip"
	depends=""
	group="sys.apps,pam"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){

		cp -prfv $PACKAGEDIR/files $SOURCEDIR/
		cp -prfv $PACKAGEDIR/extras $SOURCEDIR/
	    meson setup $BUILDDIR --sysconfdir=/etc --prefix=/ --libdir=/lib64 --includedir=/usr/include \
		-Ddefault_library=both -Dzsh-completions=true -Dbash-completions=true -Dpam=true -Dselinux=disabled -Dpkgconfig=true
	}
	build(){
	    meson compile -C $BUILDDIR
	}
	package(){
	    export DESTDIR=${DESTDIR}//
	    DESTDIR="$DESTDIR" meson install --no-rebuild -C $BUILDDIR
	    rm -f ${DESTDIR}/etc/runlevels/*/*	    # disable all services
	    rm ${DESTDIR}//etc/init.d/functions.sh
	    ln -s ../../lib/rc/sh/functions.sh ${DESTDIR}/etc/init.d/functions.sh
	    mkdir -p ${DESTDIR}/etc/sysconf.d/	    # install sysconf script
	    install $SOURCEDIR/files/openrc.sysconf ${DESTDIR}/etc/sysconf.d/openrc
	    mkdir -p ${DESTDIR}/usr ${DESTDIR}/sbin
	    mv ${DESTDIR}/{,usr}/share	    # move /share to /usr/share

	    install $SOURCEDIR/files/reboot ${DESTDIR}/sbin/reboot	    # reboot and poweroff script
	    install $SOURCEDIR/files/poweroff ${DESTDIR}/sbin/poweroff
	    ln -s openrc-shutdown ${DESTDIR}/sbin/shutdown
	    mkdir -p ${DESTDIR}/usr/libexec
	    install $SOURCEDIR/extras/disable-secondary-gpu.sh ${DESTDIR}/usr/libexec/disable-secondary-gpu
	    install $SOURCEDIR/extras/disable-secondary-gpu.initd ${DESTDIR}/etc/init.d
	    install $SOURCEDIR/extras/backlight-restore.initd ${DESTDIR}/etc/init.d
	    install $SOURCEDIR/files/0modules.init.d ${DESTDIR}/etc/init.d/0modules
	    
	    for level in boot default nonetwork shutdown sysinit ; do
	    mkdir -p ${DESTDIR}/etc/runlevels/$level
	    done
	    touch ${DESTDIR}/etc/fstab
	    install $SOURCEDIR/files/0modules.init.d ${DESTDIR}/etc/init.d/0modules
	    install $SOURCEDIR/files/0modules.init.d ${DESTDIR}/etc/runlevels/default/0modules
	    
	    install ${DESTDIR}/etc/init.d/hostname ${DESTDIR}/etc/runlevels/default/hostname
	    cd ${DESTDIR}/etc/init.d/
	    ln -s agetty agetty.tty1
	    install ${DESTDIR}/etc/init.d/agetty.tty1 ${DESTDIR}/etc/runlevels/default/agetty.tty1
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

.. raw:: pdf

   PageBreak
   
Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/openrc/files.tar>`_

Bu extras dosyalarını indirmek için `tıklayınız.. <https://kendilinuxunuyap.github.io/_static/files/openrc/extras.tar>`_

tar dosyalarını indirdikten sonra istediğiniz bir konumda **openrc** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.

Paket adında(openrc) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build

Çalıştırılması
--------------

Openrc servis yönetiminin çalışması için boot parametrelerine yazılması gerekmektedir. 
**/boot/grub.cfg** içindeki **linux /vmlinuz init=/usr/sbin/openrc-init root=/dev/sdax** olan satırda **init=/usr/sbin/openrc-init** yazılması gerekmektedir. Artık sistem openrc servis yöneticisi tarafından uygulamalar çalıştırılacak ve sistem hazır hale getirilecek.

Basit kullanım
--------------

Servis etkinleştirip devre dışı hale getirmek için **rc-update** komutu kullanılır. Aşağıda **udhcpc** internet servisi örnek olarak gösterilmiştir. **/etc/init.d/** konumunda **udhcpc** dosyamızın olması gerekmektedir.

.. code-block:: shell

	# servis etkinleştirmek için
	$ rc-update add udhcpc boot
	# servisi devre dışı yapmak için
	$ rc-update del udhcpc boot
	# Burada udhcpc servis adı boot ise runlevel adıdır.
	
 
.. raw:: pdf

   PageBreak




rsync
+++++

rsync, dosya transferi ve senkronizasyonu için geliştirilmiş bir yazılımdır. Temel işlevi, yerel veya uzak sistemler arasında dosyaların ve dizinlerin hızlı ve verimli bir şekilde kopyalanmasını sağlamaktır. rsync, yalnızca değişen verileri transfer ederek bant genişliği kullanımını optimize eder. Bu özellik, büyük dosyaların veya dizinlerin güncellenmesi gerektiğinde önemli bir avantaj sunar.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install libzstd-dev libacl1-dev libacl1** 

komutuyla paketin kurulması gerekmektedir.


.. code-block:: shell
	
	#!/usr/bin/env bash
	version="3.2.7"
	name="rsync"
	depends="glibc,acl,openssl"
	description="shell ve network copy"
	source="https://download.samba.org/pub/rsync/src/${name}-${version}.tar.gz"
	groups="net.misc"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		./configure --prefix=/usr --libdir=/lib64/ --with-included-popt --with-included-zlib --disable-xxhash --disable-lz4
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(rsync) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




kbd
+++

KBD paketi, Linux tabanlı sistemlerde klavye ile etkileşimi yönetmek için kritik bir bileşendir. Bu paket, farklı klavye düzenlerini destekler ve kullanıcıların ihtiyaçlarına göre özelleştirilmiş tuş atamaları yapmalarına olanak tanır. Örneğin, bir kullanıcı farklı bir dilde yazmak istediğinde, KBD paketi sayesinde o dilin klavye düzenine geçiş yapabilir.


Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="kbd"
	version="2.6.4"
	description="Keytable files and keyboard utilities"
	source="https://www.kernel.org/pub/linux/utils/kbd/kbd-${version}.tar.gz"
	depends="pam"
	makedepend="flex,autoconf,automake"
	group="sys.apps"

	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"      #Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')    #Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		        mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		        rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		        cd $ROOTBUILDDIR #dizinine geçiyoruz
				wget ${source}
				for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		        dowloadfile=$(ls|head -1)
		        filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		        if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		        director=$(find ./* -maxdepth 0 -type d)
		        directorname=$(basename ${director})
		        if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		        mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		    cp -prfv $PACKAGEDIR/files $SOURCEDIR/
		autoreconf -fvi
		./configure --prefix=/usr --sysconfdir=/etc --datadir=/usr/share/kbd --enable-optional-progs
	}
	build(){
		make KEYCODES_PROGS=yes RESIZECONS_PROGS=yes
	}
	package(){
		make DESTDIR=${DESTDIR} install
		for level in boot default nonetwork shutdown sysinit ; do
		mkdir -p ${DESTDIR}/etc/runlevels/$level
		done
		install -Dm755 $SOURCEDIR/files/loadkeys.initd "$DESTDIR"/etc/init.d/loadkeys
		install -Dm755  $SOURCEDIR/files/loadkeys.initd ${DESTDIR}/etc/runlevels/default/loadkeys

		install -Dm644 $SOURCEDIR/files/loadkeys.confd "$DESTDIR"/etc/conf.d/loadkeys
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/kbd/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **kbd** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(kbd) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




kernel
++++++

Kernel, bilgisayar sistemlerinde işletim sisteminin kalbini oluşturan bir yazılım katmanıdır. Donanım kaynaklarını yönetir, sistem çağrılarını işler ve uygulama yazılımlarının donanım ile etkileşimini sağlar. Linux işletim sisteminde, kernel, çoklu görev yönetimi, bellek yönetimi, dosya sistemi erişimi ve ağ iletişimi gibi kritik işlevleri yerine getirir.

Aşağıda nasıl derlendiği detaylıca anlatılmıştır. Derleme işlemi zaman ve tecrübe gerektirdiği için hazır derlenmiş olanı kullanacağız. Aslında debian, arch vb. dağıtımların kernelini derlemeden kullanabiliriz. Bir uyumsuzluk yaratmayacaktır. Bundan dolayı kendi derlediğimiz kernelini indirip kendi sistemimize yükleyen bir işlem yapacağız. Fakat derlemek isterseniz Derleme başlığı altında paylaşılan scripti kullanabilirsiniz. Kerneli hazırladığımız sistemem kurmak için aşağıda script verilmiştir.

Debian Kernel
-------------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="6.10.6"
	name="linux-image"
	depends=""
	description="temel dağıtım kernel dosyası ve moduller"
	source=""
	groups="sys.base"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		mkdir -p $SOURCEDIR
		cd $SOURCEDIR
		wget -O kernel.bps https://github.com/basitdagitim/kly-binary-packages/raw/master/kernel/kernel-6.10.8.bps
		tar -xf kernel.bps
		tar -xf rootfs.tar.xz
	}
	build(){
		echo ""
	}
	package(){
		cd $SOURCEDIR
		cp -prfv boot  ${DESTDIR}/
		cp -prfv lib/*  ${DESTDIR}/lib/
		find ${DESTDIR}/ -iname "*" -exec unxz {} \;
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


.. raw:: pdf

   PageBreak

Kernel Derleme
--------------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="kernel-headers"
	version="6.9.9"
	description="Linux kernel"
	source="https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$version.tar.xz"
	depends="kernel"
	builddepend="rsync,bc,cpio,gettext,elfutils,pahole,perl,python,tar,xz-utils"
	group="sys.kernel"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		cp -prvf $PACKAGEDIR/files/ $SOURCEDIR/
		patch -Np1 -i $PACKAGEDIR/files/patch-$version
		cp $PACKAGEDIR/files/config $SOURCEDIR/.config
		make olddefconfig
	}
	build(){
		make bzImage -j$(nproc)
		make modules -j$(nproc)
	}
	package(){
		#-------------------------------------- 						install 			-------------------------------------
		arch="x86"
		kernelbuilddir="${DESTDIR}/lib/modules/${version}/build"
		# install bzImage
		mkdir -p "$DESTDIR/boot"
		install -Dm644 "$(make -s image_name)" "$DESTDIR/boot/vmlinuz-${version}"
		#make INSTALL_PATH=$DESTDIR install ARCH=amd64
		# install modules
		mkdir -p ${DESTDIR}/lib/modules/${version}
		mkdir -p $DESTDIR/usr/src
		mkdir -p ${DESTDIR}/lib/modules/${version}/build
		make INSTALL_MOD_PATH=$DESTDIR modules_install INSTALL_MOD_STRIP=1 -j$(nproc)
		rm "${DESTDIR}/lib/modules/${version}"/{source,build} || true
		depmod --all --verbose --basedir="$DESTDIR" "${version}" || true
		# install build directories
		install .config "$DESTDIR/boot/config-${version}"
		install -Dt "$kernelbuilddir/kernel" -m644 kernel/Makefile
		install -Dt "$kernelbuilddir/arch/$arch" -m644 arch/$arch/Makefile
		cp -t "$kernelbuilddir" -a scripts
		install -Dt "$kernelbuilddir/tools/objtool" tools/objtool/objtool
		mkdir -p "$kernelbuilddir"/{fs/xfs,mm}
		ln -s "../../lib/modules/${version}/build" "$DESTDIR/usr/src/linux-headers-${version}"
		install -Dt "$kernelbuilddir" -m644 Makefile Module.symvers System.map vmlinux
		# install libc headers
		mkdir -p "$DESTDIR/usr/include/linux"
		cp -v -t "$DESTDIR/usr/include/" -a include/linux/
		cp -v -t "$DESTDIR/usr/" -a tools/include	
		make headers_install INSTALL_HDR_PATH=$DESTDIR/usr
		#-------------------------------------- 					install headers				-------------------------------------
		mkdir -p "$kernelbuilddir" "$kernelbuilddir/arch/$arch"
		cp -v -t "$kernelbuilddir" -a include
	   	cp -v -t "$kernelbuilddir/arch/$arch" -a arch/$arch/include
		install -Dt "$kernelbuilddir/arch/$arch/kernel" -m644 arch/$arch/kernel/asm-offsets.*
		install -Dt "$kernelbuilddir/drivers/md" -m644 drivers/md/*.h
		install -Dt "$kernelbuilddir/net/mac80211" -m644 net/mac80211/*.h
		install -Dt "$kernelbuilddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h
		install -Dt "$kernelbuilddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
		install -Dt "$kernelbuilddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
		install -Dt "$kernelbuilddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h
		install -Dt "$kernelbuilddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h 		# https://bugs.archlinux.org/task/71392
		find . -name 'Kconfig*' -exec install -Dm644 {} "$kernelbuilddir/{}" \;
		find -L "$kernelbuilddir" -type l -printf 'Removing %P\n' -delete					# clearing
		find "$kernelbuilddir" -type f -name '*.o' -printf 'Removing %P\n' -delete
		#-------------------------------------- 					install 										------------------------------------
		if [[ -d "$kernelbuilddir" ]] ; then
	    while read -rd '' file; do
		case "$(file -Sib "$file")" in
		    application/x-sharedlib\;*)      # Libraries (.so)
		        strip "$file" ;;
		    application/x-executable\;*)     # Binaries
		        strip "$file" ;;
		    application/x-pie-executable\;*) # Relocatable binaries
		        strip "$file" ;;
		esac
	    done < <(find "$kernelbuilddir" -type f -perm -u+x ! -name vmlinux -print0)
		fi
		if [[ -f "$kernelbuilddir/vmlinux" ]] ; then
	    strip "$kernelbuilddir/vmlinux"
		fi
		mkdir -p "$DESTDIR/usr/src"
		ln -sr "$kernelbuilddir" "$DESTDIR/usr/src/linux"
	    mv -vf System.map $DESTDIR/boot/System.map-$version
	    find ${DESTDIR}/ -iname "*" -exec unxz {} \;
	    depmod -b "$DESTDIR" -F $DESTDIR/boot/System.map-$version $version
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/kernel/files.tar>`_ tar dosyasını indirdikten sonra istediğiniz bir konumda **kernel** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build&&sudo ./build
  
.. raw:: pdf

   PageBreak


dialog
++++++

Dialog paketi, terminal tabanlı uygulamalar için kullanıcı ile etkileşim kurmayı kolaylaştıran bir araçtır. Bu paket, kullanıcıdan bilgi almak veya kullanıcıya bilgi sunmak amacıyla çeşitli diyalog kutuları oluşturmanıza olanak tanır. Örneğin, metin kutuları, onay kutuları, seçim kutuları gibi farklı türde diyaloglar oluşturabilirsiniz.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.3-20230209"
	name="dialog"
	depends="glibc,readline,ncurses"
	description="shell box kütüphanesi"
	source="https://invisible-island.net/archives/dialog/${name}-${version}.tgz"
	groups="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
    	./configure --prefix=/usr --libdir=/lib64/ --with-ncursesw
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(dialog) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





live-boot
+++++++++

Live-boot paketi, kullanıcıların bir işletim sistemini kurmadan önce denemelerine olanak tanıyan bir araçtır. Genellikle bir USB bellek veya CD/DVD gibi taşınabilir bir ortamda bulunur. Bu paket, sistemin kurulu olduğu ortamdan bağımsız olarak çalışır ve kullanıcıların işletim sisteminin özelliklerini, performansını ve uyumluluğunu test etmelerine imkan tanır.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install po4a** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1230131"
	name="live-boot"
	depends="glibc,acl,openssl"
	description="shell ve network copy"
	source="https://salsa.debian.org/live-team/live-boot/-/archive/debian/1%2520230131/live-boot-debian-1%2520230131.tar.gz"
	groups="sys.kernel"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		echo ""
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		sed -i "s/copy_exec \/bin\/mount \/bin/copy_exec \/usr\/bin\/mount \/bin/g" $DESTDIR/usr/share/initramfs-tools/hooks/live
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(live-boot) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak






live-config
+++++++++++

Live-Config, özellikle canlı CD veya USB ortamlarında kullanılan bir yapılandırma paketidir. Bu paket, sistemin başlangıçta otomatik olarak belirli ayarlarla başlatılmasını sağlar. Örneğin, ağ ayarları, kullanıcı hesapları ve diğer sistem yapılandırmaları gibi unsurlar, Live-Config aracılığıyla önceden tanımlanabilir.

Kullanıcılar, Live-Config ile özelleştirilmiş bir canlı sistem oluşturabilir ve bu sistemin her açılışında belirli ayarların otomatik olarak uygulanmasını sağlayabilir. Bu, özellikle eğitim, test veya kurtarma senaryolarında büyük bir avantaj sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="11.0.4"
	name="live-config"
	depends="glibc,acl,openssl"
	description="shell ve network copy"
	source="https://salsa.debian.org/live-team/live-config/-/archive/debian/11.0.4/live-config-debian-11.0.4.tar.gz"
	groups="sys.kernel"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
			wget ${source}
			for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		echo ""
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(live-config) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





parted
++++++

Parted, Linux tabanlı sistemlerde disk bölümlerini oluşturmak, silmek, boyutlandırmak ve düzenlemek için kullanılan bir komut satırı aracıdır. Kullanıcıların disk alanlarını daha verimli bir şekilde yönetmelerine yardımcı olur. Parted, hem MBR (Master Boot Record) hem de GPT (GUID Partition Table) bölümlendirme şemalarını destekler.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install libparted-dev** 

komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="3.6"
	name="parted"
	depends="glibc"
	description="disks tools"
	source="https://ftp.gnu.org/gnu/parted/parted-${version}.tar.xz"
	groups="sys.block"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
		    wget ${source}
		    for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
    	./configure --prefix=/usr --libdir=/usr/lib64/ --sbindir=/usr/bin --disable-rpath --disable-device-mapper	
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(parted) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





busybox
+++++++

BusyBox, Linux tabanlı sistemlerde "İsviçre Çakısı" benzeri bir işlevsellik sunarak, çeşitli komutları tek bir ikili dosya altında toplar. 

BusyBox, ls, cp, mv, rm gibi temel komutların yanı sıra, ağ yönetimi, dosya sistemleri ve sistem yönetimi gibi birçok alanda işlevsellik sunar. Kullanıcılar, bu komutları BusyBox ile çağırarak bir dosyayı kopyalamak için aşağıdaki komut kullanılabilir:

.. code-block:: shell
	
	busybox cp kaynak_dosya hedef_dosya

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.36.1"
	name="busybox"
	depends="glibc"
	description="minimal linux araç paketi static derlenmiş hali"
	source="https://busybox.net/downloads/${name}-${version}.tar.bz2"
	group="sys.base"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		cp -prfv $PACKAGEDIR/files $SOURCEDIR/
		make defconfig
		sed -i "s|.*CONFIG_STATIC_LIBGCC .*|CONFIG_STATIC_LIBGCC=y|" .config
		sed -i "s|.*CONFIG_STATIC .*|CONFIG_STATIC=y|" .config
	}
	build(){ 
		make 
	}
	package(){
		mkdir -p $DESTDIR/bin
		install busybox ${DESTDIR}/bin/busybox
		mkdir -p ${DESTDIR}/usr/share/udhcpc/ ${DESTDIR}/etc/init.d/
		install $SOURCEDIR/files/udhcpc.script ${DESTDIR}/usr/share/udhcpc/default.script	 	# install udhcpc script and service	
		install $SOURCEDIR/files/udhcpc.openrc ${DESTDIR}/etc/init.d/udhcpc
		cd $DESTDIR/bin&&ln -s busybox hostname
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/busybox/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **busybox** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(busybox) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





nano
++++

Nano, terminal tabanlı bir metin düzenleyici olup, GNU projesinin bir parçasıdır. Kullanıcıların metin dosyalarını kolayca oluşturmasına, düzenlemesine ve kaydetmesine olanak tanır. Nano, vi veya emacs gibi daha karmaşık metin düzenleyicilere göre daha basit bir kullanım sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="7.2"
	name="nano"
	depends="glibc,readline,ncurses,file"
	description="şıkıştırma kütüphanesi"
	source="https://www.nano-editor.org/dist/v7/${name}-${version}.tar.xz"
	groups="app.editor"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
		    wget ${source}
		    for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		./configure --prefix=/usr
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		cd $DESTDIR
		mkdir -p $DESTDIR/lib
		echo "INPUT(-lncursesw)" > $DESTDIR/lib/libncurses.so
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(nano) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





grub
++++

GRUB (GRand Unified Bootloader), çoklu işletim sistemlerini destekleyen ve kullanıcıların sistemlerini başlatmalarını sağlayan bir önyükleyici yazılımıdır. GRUB yapılandırma dosyası genellikle /boot/grub/grub.cfg konumunda bulunur.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="grub"
	version="2.12"
	description="GNU GRand Unified Bootloader"
	source="https://ftp.gnu.org/gnu/grub/grub-$version.tar.xz"
	depends="glibc,readline,ncurses,xz-utils,efibootmgr"
	builddepend="rsync,freetype,ttf-dejavu"
	group="sys.boot"
	uses=(efi bios)
	uses_extra=(ia32)
	dontstrip=1
	efi_dp=(efibootmgr)
	ia32_dp=(efibootmgr)
	unset CFLAGS
	unset CXXFLAGS

	get_grub_opt(){ echo -n "--disable-efiemu "
		if [[ "$1" == "efi" ]] ; then echo -n "--with-platform=efi --target=x86_64"
		elif [[ "$1" == "ia32" ]] ; then echo -n "--with-platform=efi --target=i386"
		elif [[ "$1" == "bios" ]] ; then echo -n "--with-platform=pc"
		fi
		}
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
		        mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		        rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		        cd $ROOTBUILDDIR #dizinine geçiyoruz
		        wget ${source}
		        for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		        dowloadfile=$(ls|head -1)
		        filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		        if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		        director=$(find ./* -maxdepth 0 -type d)
		        directorname=$(basename ${director})
		        if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		        mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){	cd $ROOTBUILDDIR
	 echo depends bli part_gpt > $SOURCEDIR/grub-core/extra_deps.lst
		for tgt in ${uses[@]} ; do cp -prfv $name-$version $tgt; done
		for tgt in ${uses[@]} ; do
		    cd $tgt
		    autoreconf -fvi
		    ./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib64/ --disable-nls --disable-werror --disable-grub-themes $(get_grub_opt $tgt)
		    cd ..
		done
	}
	build(){ for tgt in ${uses[@]} ; do make $jobs -C $tgt; done	}
	package(){
		for tgt in ${uses[@]} ; do make $jobs -C $tgt install DESTDIR=$DESTDIR; done
		mkdir -p $DESTDIR/etc/default $DESTDIR/usr/bin/
		install $PACKAGEDIR/files/grub $DESTDIR/etc/default/grub
		install -vDm 755  $PACKAGEDIR/files/update-grub $DESTDIR/usr/bin/update-grub
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/grub/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **grub** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız. Oluşturuluna dizinde yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




efibootmgr
++++++++++

efibootmgr, UEFI (Unified Extensible Firmware Interface) tabanlı sistemlerde önyükleme yöneticisi olarak işlev gören bir Linux aracıdır. Bu paket, UEFI önyükleme seçeneklerini yönetmek için kullanılır ve sistemin önyükleme sırasını, önyükleme girişlerini ve diğer ilgili ayarları düzenlemeye olanak tanır.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install libefiboot-dev** 
- **sudo cp -prfv /usr/include/efivar/* /usr/include/**

komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="efibootmgr"
	version="16"
	description="Linux user-space application to modify the Intel Extensible Firmware Interface (EFI) Boot Manager."
	source="https://github.com/rhboot/efibootmgr/archive/refs/tags/$version.tar.gz"
	depends="efivar,popt"
	builddepend=""
	group="sys.boot"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		echo ""
	}
	build(){
	    make sbindir=/usr/bin EFIDIR=/boot/efi PCDIR=/usr/lib64/pkgconfig
	}
	package(){
		EFIDIR="/boot/efi" sbindir=/usr/bin make DESTDIR="$DESTDIR" install
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(efibootmgr) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




efivar
++++++

efivar paketi, UEFI tabanlı sistemlerde, firmware ile işletim sistemi arasında veri alışverişini sağlamak için kritik bir rol oynamaktadır. UEFI, BIOS'un yerini alarak daha modern bir arayüz sunmakta ve sistem başlangıcında daha fazla esneklik sağlamaktadır. efivar, UEFI değişkenlerini okuma, yazma ve silme işlemlerini gerçekleştirmek için bir dizi komut sunar.

Derleme
--------

Debian ortamında bu paketin derlenmesi için; **sudo apt install libefivar-dev** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="efivar"
	version="39"
	description="Tools and libraries to work with EFI variables"
	source="https://github.com/rhboot/efivar/archive/refs/tags/$version.tar.gz"
	depends=""
	builddepend=""
	group="sys.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		export ERRORS=''
		export PATH=$PATH:$HOME
	    echo "exit 0" > $HOME/mandoc		# fake mandoc for ignore extra dependency
	    chmod +x $HOME/mandoc
	}
	build(){
	    make
	}
	package(){
		local make_options=(V=1 libdir=/usr/lib64/ bindir=/usr/bin/ mandir=/usr/share/man/ includedir=/usr/include/)
	    make DESTDIR=$DESTDIR "${make_options[@]}" install
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(efivar) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





libssh
++++++

libssh, SSH protokolünü uygulamak için kullanılan açık kaynaklı bir C kütüphanesidir. Bu kütüphane, geliştiricilere güvenli bir şekilde veri iletimi, uzaktan erişim ve dosya transferi gibi işlevleri gerçekleştirme imkanı tanır. libssh, hem istemci hem de sunucu tarafında kullanılabilir ve çoklu platform desteği sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="libssh"
	version="0.10.4"
	description="C library implenting the SSHv2 protocol on client and server side"
	source=("https://www.libssh.org/files/0.10/libssh-${version}.tar.xz")
	group="net.libs"
	depends="openssl,zlib"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup() {
	    cmake -S $SOURCEDIR -B $BUILDDIR -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib64 \
		-DWITH_EXAMPLES=NO -DBUILD_SHARED_LIBS=YES -DBUILD_STATIC_LIB=YES -DWITH_NACL=OFF \
		-DWITH_GCRYPT=OFF -DWITH_MBEDTLS=OFF -DWITH_GSSAPI=OFF \
		-DWITH_PCAP=OFF -DWITH_SERVER=ON -DWITH_SFTP=ON -DWITH_ZLIB=ON
	}
	build() {
	    make -C $BUILDDIR
	}
	package() {
	    make -C $BUILDDIR install DESTDIR=$DESTDIR
	    install $BUILDDIR/src/libssh.a ${DESTDIR}/usr/lib64/
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libssh) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




openssh
+++++++

OpenSSH, Secure Shell (SSH) protokolünü uygulayan bir yazılım paketidir ve genellikle Linux ve Unix tabanlı sistemlerde kullanılır. Bu paket, kullanıcıların uzak sunuculara güvenli bir şekilde bağlanmalarını, dosya transferi yapmalarını ve uzaktan komut çalıştırmalarını sağlar. OpenSSH, veri iletimini şifreleyerek, ağ üzerinden yapılan iletişimlerin güvenliğini artırır.

OpenSSH, genellikle ssh, scp, sftp ve sshd gibi araçları içerir. 

Derleme
--------

Debian ortamında bu paketin derlenmesi için; **sudo apt install libcrypt-dev** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="openssh"
	version="9.6p1"
	description="OpenBSD ssh server & client"
	source="https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-$version.tar.gz"
	depends="zlib,libxcrypt,openssl,libmd,libssh"
	group="net.misc"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		cp -prfv $PACKAGEDIR/files $SOURCEDIR/
		./configure --prefix=/usr --libdir=/usr/lib64/ --sysconfdir=/etc/ssh --without-pam --disable-strip \
		    --with-ssl-engine --with-privsep-user=nobody --with-pid-dir=/run --with-default-path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
	}
	build(){
		make
	}
	package(){
		make install DESTDIR=$DESTDIR
		mkdir -p "$DESTDIR"/etc/{passwd,group,sysconf,init,conf}.d
		install -m755 -D $SOURCEDIR/files/sshd.initd "$DESTDIR"/etc/init.d/sshd
		install $SOURCEDIR/files/sshd.initd  ${DESTDIR}/etc/runlevels/default/sshd
		install -m755 -D $SOURCEDIR/files/sshd.confd "$DESTDIR"/etc/conf.d/sshd
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
		sed -i "/nobody/d"  ${DESTDIR}/etc/group
		sed -i "/nobody/d"  ${DESTDIR}/etc/passwd
		mkdir -p  ${DESTDIR}/var/empty
		chown root:root  ${DESTDIR}/var/empty
		chmod 755  ${DESTDIR}/var/empty
		echo "nobody:!:65534:" >>  ${DESTDIR}/etc/group
		echo "nobody:!:65534:65534::/var/empty:/usr/sbin/nologin" >>  ${DESTDIR}/etc/passwd
		sed -i "/PermitRootLogin/d" /etc/ssh/sshd_config
		echo -e "\nPermitRootLogin yes">> /etc/ssh/sshd_config
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/openssh/files.tar>`_ 

tar dosyasını indirdikten sonra istediğiniz bir konumda **openssh** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.

Paket adında(openssh) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build

.. raw:: pdf

   PageBreak




pam
+++

PAM, "Pluggable Authentication Modules" ifadesinin kısaltmasıdır ve Linux işletim sistemlerinde kimlik doğrulama süreçlerini esnek bir şekilde yönetmek için tasarlanmıştır. PAM, sistem yöneticilerine, kimlik doğrulama yöntemlerini modüler bir yapıda değiştirme ve özelleştirme imkanı sunar. Örneğin, bir sistem yöneticisi, kullanıcıların şifre ile kimlik doğrulamasını sağlarken, aynı zamanda iki faktörlü kimlik doğrulama gibi ek güvenlik önlemleri de ekleyebilir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="pam"
	version="1.6.0"
	depends="libtirpc,libxcrypt,libnsl,audit"
	description="PAM (Pluggable Authentication Modules) library'"
	source="https://github.com/linux-pam/linux-pam/releases/download/v$version/Linux-PAM-$version.tar.xz"
	groups="sys.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
	    ./configure --prefix=/usr --sbindir=/usr/sbin --libdir=/usr/lib64 \
		--enable-securedir=/usr/lib64/security --enable-static --enable-shared --disable-nls --disable-selinux
		}
	build(){
		make
	}
	package(){
		make install DESTDIR=$DESTDIR
		chmod +s "$DESTDIR"/usr/sbin/unix_chkpwd
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(pam) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




.. _paketderleme:
Paket Derleme
=============

kernel-headers
++++++++++++++

Kernel-headers paketi, Linux çekirdeği başlık dosyalarını barındırır. Kernel-headers paketi derleme yaparsanız lazım olacaktır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="kernel-headers"
	version="6.9.9"
	description="Linux kernel"
	source="https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$version.tar.xz"
	depends="kernel"
	builddepend="rsync,bc,cpio,gettext,elfutils,pahole,perl,python,tar,xz-utils"
	group="sys.kernel"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		cp -prvf $PACKAGEDIR/files/ $SOURCEDIR/
		patch -Np1 -i $PACKAGEDIR/files/patch-$version
		cp $PACKAGEDIR/files/config $SOURCEDIR/.config
		make olddefconfig
	}
	build(){
		make bzImage -j$(nproc)
		make modules -j$(nproc)
	}
	package(){
		arch="x86"
		kernelbuilddir="${DESTDIR}/lib/modules/${version}/build"
		# install bzImage
		mkdir -p "$DESTDIR/boot"
		install -Dm644 "$(make -s image_name)" "$DESTDIR/boot/vmlinuz-${version}"
		#make INSTALL_PATH=$DESTDIR install ARCH=amd64
		# install modules
		mkdir -p ${DESTDIR}/lib/modules/${version}
		mkdir -p $DESTDIR/usr/src
		mkdir -p ${DESTDIR}/lib/modules/${version}/build
		make INSTALL_MOD_PATH=$DESTDIR modules_install INSTALL_MOD_STRIP=1 -j$(nproc)
		rm "${DESTDIR}/lib/modules/${version}"/{source,build} || true
		depmod --all --verbose --basedir="$DESTDIR" "${version}" || true
		# install build directories
		install .config "$DESTDIR/boot/config-${version}"
		install -Dt "$kernelbuilddir/kernel" -m644 kernel/Makefile
		install -Dt "$kernelbuilddir/arch/$arch" -m644 arch/$arch/Makefile
		cp -t "$kernelbuilddir" -a scripts
		install -Dt "$kernelbuilddir/tools/objtool" tools/objtool/objtool
		mkdir -p "$kernelbuilddir"/{fs/xfs,mm}
		ln -s "../../lib/modules/${version}/build" "$DESTDIR/usr/src/linux-headers-${version}"
		install -Dt "$kernelbuilddir" -m644 Makefile Module.symvers System.map vmlinux
		# install libc headers
		mkdir -p "$DESTDIR/usr/include/linux"
		cp -v -t "$DESTDIR/usr/include/" -a include/linux/
		cp -v -t "$DESTDIR/usr/" -a tools/include	
		make headers_install INSTALL_HDR_PATH=$DESTDIR/usr
		mkdir -p "$kernelbuilddir" "$kernelbuilddir/arch/$arch"
		cp -v -t "$kernelbuilddir" -a include
	   	cp -v -t "$kernelbuilddir/arch/$arch" -a arch/$arch/include
		install -Dt "$kernelbuilddir/arch/$arch/kernel" -m644 arch/$arch/kernel/asm-offsets.*
		install -Dt "$kernelbuilddir/drivers/md" -m644 drivers/md/*.h
		install -Dt "$kernelbuilddir/net/mac80211" -m644 net/mac80211/*.h
		install -Dt "$kernelbuilddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h
		install -Dt "$kernelbuilddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
		install -Dt "$kernelbuilddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
		install -Dt "$kernelbuilddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h
		install -Dt "$kernelbuilddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h 		# https://bugs.archlinux.org/task/71392
		find . -name 'Kconfig*' -exec install -Dm644 {} "$kernelbuilddir/{}" \;
		find -L "$kernelbuilddir" -type l -printf 'Removing %P\n' -delete					# clearing
		find "$kernelbuilddir" -type f -name '*.o' -printf 'Removing %P\n' -delete
		#-------------------------------------- 					install 										------------------------------------
		if [[ -d "$kernelbuilddir" ]] ; then
	    while read -rd '' file; do
		case "$(file -Sib "$file")" in
		    application/x-sharedlib\;*)      # Libraries (.so)
		        strip "$file" ;;
		    application/x-executable\;*)     # Binaries
		        strip "$file" ;;
		    application/x-pie-executable\;*) # Relocatable binaries
		        strip "$file" ;;
		esac
	    done < <(find "$kernelbuilddir" -type f -perm -u+x ! -name vmlinux -print0)
		fi
		if [[ -f "$kernelbuilddir/vmlinux" ]] ; then
	    strip "$kernelbuilddir/vmlinux"
		fi
		mkdir -p "$DESTDIR/usr/src"
		ln -sr "$kernelbuilddir" "$DESTDIR/usr/src/linux"
	    mv -vf System.map $DESTDIR/boot/System.map-$version
	    find ${DESTDIR}/ -iname "*" -exec unxz {} \;
	    depmod -b "$DESTDIR" -F $DESTDIR/boot/System.map-$version $version
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/kernel-headers/files.tar>`_ tar dosyasını indirdikten sonra istediğiniz bir konumda **kernel-headers** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build&&sudo ./build
  
.. raw:: pdf

   PageBreak




lz4
+++

LZ4, yüksek hızda veri sıkıştırma ve açma işlemleri gerçekleştiren bir algoritmadır. Genellikle, büyük veri setlerini hızlı bir şekilde sıkıştırmak ve açmak için kullanılır. LZ4, özellikle performansın kritik olduğu durumlarda tercih edilir. Örneğin, oyun verileri, veri tabanları ve ağ iletişimi gibi alanlarda sıkça kullanılır.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install liblz4-dev** 

komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
		
	#!/usr/bin/env bash
	name="lz4"
	version="1.9.4"
	description="Extremely fast compression algorithm"
	source="https://github.com/lz4/lz4/archive/refs/tags/v1.9.4.tar.gz"
	depends=""
	builddepend=""
	group="app.arch"


	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"      #Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')    #Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		        mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		        rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		        cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		        dowloadfile=$(ls|head -1)
		        filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		        if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		        director=$(find ./* -maxdepth 0 -type d)
		        directorname=$(basename ${director})
		        if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		        mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		echo ""
	}

	build(){
		cd $SOURCEDIR
		make PREFIX=/usr
	}

	package(){
		make install DESTDIR=$DESTDIR PREFIX=/usr
		mv ${DESTDIR}/usr/{lib,lib64}
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
	
Paket adında(lz4) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build

.. raw:: pdf

   PageBreak




lzo
+++

LZO (Lempel-Ziv-Oberhumer), hızlı veri sıkıştırma ve açma işlemleri için tasarlanmış bir algoritmadır. Özellikle, yüksek hızda sıkıştırma ve açma işlemleri gerektiren uygulamalarda tercih edilir. LZO, kayıpsız bir sıkıştırma yöntemi sunar; yani, sıkıştırılmış veriyi açtığınızda orijinal veriyi tam olarak geri alırsınız.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install liblz4-dev** 

komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
		
	#!/usr/bin/env bash
	version="2.10"
	name="lzo"
	depends=""
	description="squashfs lzo"
	source="https://www.oberhumer.com/opensource/lzo/download/lzo-2.10.tar.gz"
	groups="app.shell"

	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"      #Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')    #Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		        mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		        rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		        cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		        dowloadfile=$(ls|head -1)
		        filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		        if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		        director=$(find ./* -maxdepth 0 -type d)
		        directorname=$(basename ${director})
		        if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		        mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()
	{
		cd $SOURCEDIR
	  ./configure --prefix=/usr --enable-shared
	 
		
	}
	build()
	{
		make
	  # build minilzo
	  gcc $CPPFLAGS $CFLAGS -fpic -Iinclude/lzo -o minilzo/minilzo.o -c minilzo/minilzo.c
	  gcc $LDFLAGS -shared -o libminilzo.so.0 -Wl,-soname,libminilzo.so.0 minilzo/minilzo.o
	}
	package()
	{

	  make DESTDIR="${DESTDIR}" install

	  # install minilzo
	  install -m 755 libminilzo.so.0 "${DESTDIR}"/usr/lib
	  install -p -m 644 minilzo/minilzo.h ${DESTDIR}/usr/include/lzo
	  cd "${DESTDIR}"/usr/lib
	  ln -s libminilzo.so.0 libminilzo.so

	}


	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
	
Paket adında(lzo) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build

.. raw:: pdf

   PageBreak




squashfs-tools
++++++++++++++

squashfs-tools, Linux tabanlı sistemlerde sıkıştırılmış dosya sistemleri oluşturmak ve yönetmek için kullanılan bir araç setidir. SquashFS, özellikle depolama alanını verimli bir şekilde kullanmak amacıyla dosyaları sıkıştırarak depolayan bir dosya sistemidir. Bu paket, mksquashfs ve unsquashfs gibi komutları içerir. 

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install liblz4-dev** 

komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
		
	#!/usr/bin/env bash
	version="4.6.1"
	name="squashfs-tools"
	depends="squashfs"
	description="squashfs"
	source="https://github.com/plougher/squashfs-tools/archive/refs/tags/4.6.1.tar.gz"
	groups="app.shell"

	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"      #Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')    #Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		cd $SOURCEDIR/squashfs-tools
	}

	build(){
		make GZIP_SUPPORT=1 LZ4_SUPPORT=1 LZMA_XZ_SUPPORT=1 LZO_SUPPORT=1 XATTR_SUPPORT=1 XZ_SUPPORT=1 ZSTD_SUPPORT=1
	}
	package(){
	  	make INSTALL_PREFIX="$DESTDIR/usr" INSTALL_MANPAGES_DIR='$(INSTALL_PREFIX)/share/man/man1' install
	  	install -vDm 644 $SOURCEDIR/{ACTIONS-README,CHANGES,"README-$version",USAGE*} -t "$DESTDIR/usr/share/doc/$name/"
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
	
Paket adında(squashfs-tools) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build

.. raw:: pdf

   PageBreak




.. _paketsistemi:

**Paket Sitemi**
++++++++++++++++

Paket yönetim sistemleri bir dağıtımda bulunan en temel parçadır.
Sistem üzerine paket kurma ve kaldırma güncelleme yapma gibi işlemlerden sorumludur.
Başlıca 2 tip paket sistemi vardır:

* Binary (ikili) paket sistemi
* Source (kaynak) paket sistemi

Bir paket sistemi hem binary hem source paket sistemi özelliklerine sahip olabilir. Bununla birlikte son kullanıcı dağıtımlarında genellikle binary paket sistemleri tercih edilir.


**Binary Paket Sistemi**
------------------------

Bu tip paket sistemlerinde önceden derlenmiş olan paketler hazır şekilde indirilir ve açılarak sistem ile birleştirilir. 
Binary paket sistemlerinde paketler önceden derleme talimatları ile oluşturulmalıdır.

Binary paket sistemine örnek olarak **apt**, **dnf**, **pacman** örnek verilebilir.

**Source Paket Sistemi**
------------------------

Bu tip paket sistemlerinde derleme talimatları kurulum yapılacak bilgisayar üzerinde kullanılarak paketler kurulum yapılacak bilgisayarda oluşturulur ve kurulur.

Source paket sistemine örnek olarak **portage** örnek verilebilir.


**Paket sisteminin temel yapısı**
---------------------------------

Dağıtımlarda uygulamalar paketler halinde hazırlanır. Bu paketleri dağıtımda kullanabilmek için temel işlemler şunlardır;

1. Paket Oluşturma
2. Paket Liste İndexi Güncelleme
3. Paket Kurma
4. Paket Kaldırma
5. Paket Yükseltme gibi işlemleri yapan uygulamaların tamamı paket sistemi olarak adlandırılır.

Paket sisteminde, uygulama paketi haline getirilip sisteme kurulur. Genelde paket sistemi dağıtımın temel bir parçası olması sebebiyle üzerinde yüklü gelir.

Bazı dağıtımların kullandığı paket sistemeleri şunlardır.

- apt: Debian dağıtımının kullandığı paket sistemi.
- emerge :Gentoo dağıtımının kullandığı paket sistemi.

**bps Paket Sistemi**
---------------------

Bu dokümanda hazırlanan dağıtımın paket sistemi için ise bps(basit/basic/base paket sistemi) olarak ifade edeceğimiz paket sistemi adını kullandık. Bps paket sistemindeki beş temel işlemin nasıl yapılacağı ayrı başlıklar altında anlatılacaktır. Paket sistemi derlemeli bir dil yerine bash script ile yapılacaktır. Bu dokumanı takip eden kişi, bu dokümanda yazılanları anlaması için orta seviye bash script bilmesi gerekmektedir.


.. raw:: pdf

   PageBreak


Paket Oluşturma
+++++++++++++++

Paket sisteminde en önemli kısımlardan birisi paket oluşturmadır. Bu işlem paketin derlenmesi ve derlenmiş paketin belirli bir yapıyla saklanması olayıdır. Bu saklanan paket daha sonra ihtiyaç halinde uzaktan(internet üzerinden) ve yerelden istediğimiz sisteme kurma işlemidir. Bu başlıkta paketin derlenmesi ve saklanması(paket oluşturma) anlatılacaktır.

Paket oluşturma işlemi sırayla şu aşamalardan oluşmaktadır.

1. Paketin indirilmesi
2. Paketin derleme öncesi hazırlanması(configure)
3. Paketin derlenmesi
4. Derlenmiş paketin bir dizine yüklenmesi
5. Yüklenen dizindeki dosya ve dizin yapısının konum listesini tutan file.index oluşturulması
6. Derlenmiş paketin bir dizinin sıkıştırılması
7. Sıkıştırılmış derlenmiş dizin, file.index ve derleme talimatının paket isim ve versiyonuyla tekrardan sıkıştırılması

Burada maddeler halinde anlatılan işlem adımlarını bir paket oluşturma amacıyla sırasıyla yapmamız gerekmektedir. 7. maddede anlatılan son sıkıştırılma öncesi yapı aşağıda gösterilmiştir.

.. image:: /_static/images/bpspaketle-0.png
  	:width: 600


.. raw:: pdf

   PageBreak
   

**bps Paket Oluşturma**
-----------------------

bps paket sisteminin temel parçalarından en önemlisi paket oluşturma uygulamasıdır. Dokümanda temel paketlerin nasıl derlendiği **Paket Derleme** başlığı altında anlatılmıştı. Bir paket üzerinden(readline) örneklendirerek paketimizi oluşturacak scriptimizi yazalım.

Dokümanda readline paketi nasıl derleneceği aşağıdaki script olarak verilmiştir.

.. code-block:: shell

	#!/usr/bin/env bash
	version="8.2"
	name="readline"
	depends="glibc"
	description="readline kütüphanesi"
	source="https://ftp.gnu.org/pub/gnu/readline/${name}-${version}.tar.gz"
	groups="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	
	setup(){
		cp -prvf $PACKAGEDIR/files $SOURCEDIR/
		./configure --prefix=/usr \
			--libdir=/usr/lib64
	}

	build(){
		make SHLIB_LIBS="-L/tools/lib -lncursesw"
	}

	package(){
		make SHLIB_LIBS="-L/tools/lib -lncursesw" DESTDIR="$DESTDIR" install pkgconfigdir="/usr/lib64/pkgconfig"
		
		install -Dm644 $SOURCEDIR/files/inputrc "$DESTDIR"/etc/inputrc
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Bu script readline kodunu internetten indirip derliyor ve kurulumu yapıyor. Aslında bu scriptle **paketleme**, **paket kurma** işlemini bir arada yapıyor. Bu işlem mantıklı gibi olsada paket sayısı arttıkça ve rutin yapılan işlemleri tekrar tekrar yapmak gibi işlem fazlalığına sebep olmaktadır.

Bu sebeplerden dolayı **readline** paketleme scriptini yeniden düzenleyelim. Yeni düzenlenen halini  **bpspaketle** ve **bpsbuild** adlı script dosyaları olarak düzenleyeceğiz. Genel yapısı aşağıdaki gibi olacaktır. Script dosyasının yeniden bpspaketle ve bpsbuild şeklinde ayrıştırılmış hali resimde gözükmektedir. Devamında ise **packageindex** ve **packagecompress** fonksiyonları bpspaketle dosyasına eklenecektir.

.. image:: /_static/images/bpspaketle-1.png
  	:width: 600


**bpsbuild** Dosyası
--------------------

.. code-block:: shell
	
	setup()	{}
	build()	{}
	package() {}

**bpspaketle** Dosyası
----------------------

.. code-block:: shell
	
	#genel değişkenler tanımlanır
	initsetup() {}
	
	#bpsbuild dosya fonksiyonları birleştiriliyor
	source bpsbuild # bu komutla setup build package fonsiyonları bpsbuild doyasından alınıp birleştiriliyor
	
	packageindex() {}
	packagecompress() {}

.. raw:: pdf

   PageBreak
   
Aslında yukarıdaki **bpspaketle** ve **bpsbuild** adlı script dosyaları tek bir script dosyası olarak **bpspaketle** dosyası. İki dosyayı birleştiren **source bpsbuild** komutudur. **bpspaketle** dosyası aşağıdaki gibi düşünebiliriz.

.. code-block:: shell
	
	#genel değişkenler tanımlanır
	initsetup() {}
	
	setup()	{} #bpsbuild dosyasından gelen fonksiyon, "source bpsbuild" komutu sonucu gelen fonksiyon
	build()	{} #bpsbuild dosyasından gelen fonksiyon, "source bpsbuild" komutu sonucu gelen fonksiyon
	package() {} #bpsbuild dosyasından gelen fonksiyon, "source bpsbuild" komutu sonucu gelen fonksiyon
	
	packageindex() {}
	packagecompress() {}

Bu şekilde ayrılmasının temel sebebi  **bpspaketle** scriptinde hep aynı işlemler yapılırken **bpsbuild** scriptindekiler her pakete göre değişmektedir. Böylece paket yapmak için ilgili pakete özel **bpsbuild** dosyası düzenlememiz yeterli olacaktır. **bpspaketle** dosyamızda **bpsbuild** scriptini kendisiyle birleştirip paketleme yapacaktır.

**bpsbuild** Dosyamızın Son Hali
----------------------------------

.. code-block:: shell

	#!/usr/bin/env bash
	version="8.2"
	name="readline"
	depends="glibc"
	description="readline kütüphanesi"
	source="https://ftp.gnu.org/pub/gnu/readline/${name}-${version}.tar.gz"
	groups="sys.apps"
	#2. madde, derleme öncesi hazırlık 
	setup(){
		cp -prvf $PACKAGEDIR/files $BUILDDIR/
		$SOURCEDIR/configure --prefix=/usr \
			--libdir=/usr/lib64
	}
	#3. madde, paketin derlenmesi 	
	build(){
		make SHLIB_LIBS="-L/tools/lib -lncursesw"
	}
	#4. madde, derlenen paketin bir dizine yüklenmesi 
	package(){
		make SHLIB_LIBS="-L/tools/lib -lncursesw" DESTDIR="$DESTDIR" install pkgconfigdir="/usr/lib64/pkgconfig"
		
		install -Dm644 files/inputrc "$DESTDIR"/etc/inputrc
	}



**bpspaketle** Dosyamızın Son Hali
----------------------------------

.. code-block:: shell
	
	#!/usr/bin/env bash
	set -e
	paket=$1
	dizin=$(pwd)
	if [ ! -d ${paket} ]; then echo "Bir paket değil!"; exit; fi
	if [ ! -f "${paket}/bpsbuild" ]; then echo "Paket dosyası bulunamadı!"; exit; fi
	echo "Paket : $paket"
	source ${paket}/bpsbuild
	ROOTBUILDDIR="/tmp/bps/build"
	BUILDDIR="/tmp/bps/build/build-${name}-${version}" #Derleme yapılan dizin
	DESTDIR="/tmp/bps/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd)
	SOURCEDIR="/tmp/bps/build/${name}-${version}"
	#1. madde, paketin indirilmesi
	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
		    wget ${source}
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $BUILDDIR
	}


	#6. madde, paketlenecek dosların listesini tutan file.index dosyası oluşturulur
	packageindex() 
		rm -rf file.index
		cd /tmp/bps/build/rootfs-${name}-${version}
		find . -type f | while IFS= read file_name; do if [ -f ${file_name} ]; then echo ${file_name:1}>>../file.index; fi done
		find . -type l | while IFS= read file_name; do if [ -L ${file_name} ]; then echo ${file_name:1}>>../file.index; fi done
	}

	# paket dosyası oluşturulur;
	# kurulacak data rootfs.tar.xz, file.index ve bpsbuild dosyaları tek bir dosya olarak tar.gz dosyası olarak  hazırlanıyor.
	
	#7. madde, tar.gz dosyası olarak hazırlanan dosya bps ismiyle değiştirilip paketimiz hazırlanır.
	packagecompress() 
	{
	cd /tmp/bps/build/rootfs-${name}-${version}
	tar -cf ../rootfs.tar ./*
	cd /tmp/bps/build/
	xz -9 rootfs.tar
	tar -cvzf paket-${name}-${version}.tar.gz rootfs.tar.xz file.index bpsbuild
	cp paket-${name}-${version}.tar.gz ${dizin}/${paket}/${name}-${version}.bps
	}

	# fonksiyonlar aşağıdaki sırayla çalışacaktır.
	
	initsetup #bu dosya içindeki fonksiyon (indirilmesi)
	setup #bpsbuild dosyasından gelen fonksiyon (derleme öncesi hazırlık)
	build #bpsbuild dosyasından gelen fonksiyon (derleme)
	package #bpsbuild dosyasından gelen fonksiyon (derlenen paketin dizine yüklenemesi)
	packageindex #bu dosya içindeki fonksiyon (dizine yüklelen paketin indexlenmesi)
	packagecompress #bu dosya içindeki fonksiyon (index.lst, derleme talimatı ve dizinin sıkıştırılmas)

Burada **readline** paketini örnek alarak **bpspaketle** dosyasının ve **bpsbuild** dosyasının nasıl hazırlandığı anlatıldı.
Diğer paketler için sadece hazırlanacak pakete uygun şekilde **bpsbuild** dosyası hazırlayacağız. **bpspaketle**  dosyamızda değişiklik yapmayacağız. Artık  **bpspaketle**  dosyası paketimizi oluşturan script **bpsbuild** ise hazırlanacak paketin bilgilerini bulunduran script doyasıdır.

.. raw:: pdf

   PageBreak
   
**Paket Yapma**
---------------

Bu bilgilere göre readline paketi nasıl oluşturulur onu görelim. Paketlerimizi oluşturacağımız bir dizin oluşturarak aşağıdaki işlemleri yapalım. Burada yine **readline** paketi anlatılacaktır.


.. code-block:: shell

	mkdir readline
	cd readline
	#readline için hazırlanan bpsbuild dosyası bu konuma oluşturulur ve içeriği readline için oluşturduğumuz bpsbuild dosyası bu konuma kopyalayın
	cd ..
	./bpspaketle readline # bpspaketle dosyamızın bu konumda olduğu varsayılmıştır ve parametre olarak readline dizini verilmiştir.

Komut çalışınca readline/readline-8.1.bps dosyası oluşacaktır. Aşağıda resimde nasıl yapıldığı gösterilmiştir. Burada anlatılan **bpspaketle** script dosyasını **/bin/** konumuna oluşturnuz ve **chmod 755 /bin/bpspaketle** komutuyla çalıştırma izni vermeliyiz. **bps** paket sistemi için yapılacak olan **bsppaketle, bpsupdate, bpskur, bpskaldir** scriptlerinide **/bin/** konumunda oluşturulmalı veya kopyalanmalı ve çalıştırma izni verilmeli.

.. image:: /_static/images/bpspaketle-2.png
  	:width: 600

Artık sisteme kurulum için ikili dosya, kütüphaneleri ve dizinleri barındıran paketimiz oluşturuldu. Bu paketi sistemimize nasıl kurarız? konusu **Paket Kurma** başlığı altında anlatılacaktır.

.. raw:: pdf

   PageBreak


Depo indexleme
++++++++++++++

Depo paketlerimizin olduğu alandır. Paketler genel olarak;

1. Sıkıştırılmış bir dosyadır
2. İçerisinde sisteme yüklenecek derlenmiş paket dizini(sıkıştırılmış olur genelde)
3. Sisteme yüklenecek derlenmiş paket dizini içindeki dosyaların ve dizinleri konumu ve listesi(file.LST)
4. Paket derleme talimatı.

Depoada ne kadar paket varsa bunların isimleri sürüm numaraları gibi bilgiler ile adreslerini liste halinde oluşturma işlemine **depo indexleme** denir.
Depo indexlenirken genellikle bilgiler **paket derleme talimatı** dosyasından alınır.
Paketlerin listesi oluşturlduktan sonra paketler kurulurken, silinirken ve güncellenirken bu listeden yararlanılır.

.. code-block:: yaml

	Name: bash
	Version: 1.0
	Dependencies: glibc, ncurses, readline
	Path: b/bash/bash_1.0.zip
	
	Name: test
	Version: 1.1
	Dependencies:
	Path: t/test/test_2.0.zip
	
	...

Yukarıdaki örnekte paket adı bilgisi sürüm bilgisi ve bağımılılıklar gibi bilgiler ile paketin sunucu içerisindeki konumu yer almaktadır.
Depo indexi paketlerin içinde yer alan paket bilgileri okunarak otomatik olarak oluşturulur.

Örneğin paketlerimiz zip dosyası olsun ve paket bilgisini **build** dosyası taşısın. Aşağıdaki gibi depo indexi alabiliriz.

.. code-block:: shell

	function index {
	    > index.txt
	    for i in $@ ; do
	        unzip -p $i build >> index.txt
	        echo "Path: $i" >> index.txt
	    done
	}
	
	index t/test/test_2.0.zip b/bash/bash_1.0.zip ...

Bu örnekte paketlerin içindeki paket bilgisi içeren dosyaları uç uca ekledik.
Buna ek olarak paketin nerede olduğunu anlamak için paket konumunu da ekledik. Çıktısı aşağıdaki gibidir.

.. code-block:: shell

	Path: t/test/test_2.0.zip
	Path: b/bash/bash_1.0.zip

.. raw:: pdf

   PageBreak


bps github Depo Yapma
---------------------

Bu doküman kullanılarak hazırlanan paketleri bilgisayarınızda bir dizinde tutabiliriz. Fakat bu çok kısıtlı bir sistem olmasına sebep olacaktır. Paketleri bir internet ortamında bir yerde saklayarak, kurmak istediğimizde internet(uzak) üzwerinden kurulması daha doğru bir yöntemdir. Bu dağıtımda paketlerimizi github.com üzerinde oluşturulan bir repostory üzerinden çekilmektedir. İnternetteki paketlerimizin listesi her yeni paketi yükleme sırasında güncellenmektedir. Bu işlem github hesabı üzerinden yapılmaktadır. github hakkında temel işlemler için `tıklayınız. <../10.yardimci-konular/39-github.html>`_

**github üzerinde depolamak için;**

- github hesabı açılır(basitdagitim)
- github repository oluşturulur(kly-binary-packages)
- kly-binary-packages deposuna aşağıda verilen index dosyasını oluşturunuz.
- kly-binary-packages deposuna .github/workflows dizinini ouşturarak aşağıda verilen main.yml dosyasını oluşturunuz.
- internet üzerinden kly-binary-packages reposunda settings->action->general->Workflow permissions->Read and write permissions  işaretlenmelidir.
- Yapılan paketler github üzerinde gönderilmelidir.

index Dosyası
-------------

Bu script bps paket dosyalarımızın olduğu dizinde tüm paketleri açarak içerisinden **bpsbuild** dosyalarını çıkartarak paketle ilgili bilgileri alıp **index.lst** dosyası oluşturmaktadır. istersek paketler local ortamdada index oluşturabiliriz. Bu dokümanda github üzerinde oluşturacak şekilde anlatılmıştır.Paket indeksi oluşturan **index.lst** dosyası aşağıdaki gibi olacaktır. Listede name, version ve depends(bağımlı olduğu paketler) bilgileri bulunmaktadır. Bilgilerin arasında **|** karekteri kullanılmıştır.

.. code-block:: shell

	#!/bin/sh
	#set -ex
	mkdir /output -p
	mkdir -p /bpssource
	>index.lst
	find * -type f -name *.bps |
			while IFS= read file_name; do
				dosya="$(dirname $file_name)/bpsbuild"
				version=$(cat $dosya|grep version=)
				name=$(cat $dosya|grep name=)
				depends=$(cat $dosya|grep depends=)
				echo "$name|$version|$depends|$(dirname $file_name)">>index.lst
			done
	cp -rf index.lst /output

	# *****************************source files******************************
	cp -prfv ./* /bpssource/

	find /bpssource/* -type f -name *.bps |
			while IFS= read file_name; do
			rm -rf "$file_name"
			done
	tar -cf /output/bpssourcepackage.tar /bpssource/
	rm -rf /bpssource


index.lst İçeriği
.................

https://github.com/basitdagitim/kly-binary-packages/releases/download/current/index.lst adresinde bulunan dosya aşağıdaki gibi liste oluşturacaktır.

.. code-block:: shell

	name="acl"|version="2.3.1"|depends="attr"|acl
	name="attr"|version="2.5.1"|depends=""|attr
	name="audit"|version='3.1.1'|depends=""|audit
	name="bash"|version="5.2.21"|depends="glibc,readline,ncurses"|bash

main.yml
--------

.. code-block:: shell

	name: CI

	on:
	  push:
		branches: [ master ]
	  schedule:
		- cron: "0 0 1 2 6"

	jobs:
		compile:
		    name: depoindex
		    runs-on: ubuntu-latest
		    steps:
		      - name: Check out the repo
		        uses: actions/checkout@v2
		      - name: Run the build process with Docker
		        uses: addnab/docker-run-action@v3
		        with:
		            image: debian:testing
		            options: -v ${{ github.workspace }}:/root -v /output:/output
		            run: |
		                cd /root
		                sh index
		      - uses: "marvinpinto/action-automatic-releases@latest"
		        with:
		            repo_token: "${{ secrets.GITHUB_TOKEN }}"
		            automatic_release_tag: "current"
		            prerelease: false
		            title: "Latest release"
		            files: |
		              /output/*


.. raw:: pdf

   PageBreak



index Güncelleme
++++++++++++++++

İndex güncelleme uzak(internet) depodaki paketlerin index listesinin yerelde tutulan index dosyasıyla eşitlemek işlemidir.
Depoda olan paketlerin listesi yerelde tutulan index.lst dosyasındada olması gerekmetedir. Bu işlemi yapan bpsupdate dosya içeriği aşağıdadır.

**bpsupdate** 
-------------

.. code-block:: shell
	
	#!/bin/sh
	curl -Lo /etc/bps/index.lst https://github.com/basitdagitim/kly-binary-packages/releases/download/current/index.lst

**index.lst** dosyamızı github üzerinden indiren scriptimiz tek bir satırdan oluşmaktadır. Bu hali şimdilik ihtiyacımızı görecektir.
Bu komut https://github.com/basitdagitim/kly-binary-packages/releases/download/current/index.lst adresindeki dosyayı index.lst dosyasını /etc/bps/index.lst konumuna indirecektir.

Fakat birden fazla depo(github repository) olması durumunda birazdah karmaşık bir yapısı olacaktır. Bu durumda debian sisteminde /etc/apt/source.list gibi bir yapıkullanılarak her depo indexi çekilip tek bir index.lst dosyası oluşturulabilir. Bu sistem için ise /etc/bps/source.list dosyası kullanılmaktadır. Birden fazla index dosyasını birleştiren ve güncelleyen scriptimiz aşağıdadır.
 
.. code-block:: shell
	
	#!/bin/sh
	curl -Lo /tmp/index.lst https://github.com/basitdagitim/kly-binary-packages/releases/download/current/index.lst
	target=""
	if [ -n "${1}" ];then target="$1"; else target="/";fi
	mkdir -p $target/etc/bps
	rm -rf $target/etc/bps/index.lst
	rm -rf $target/tmp/temp.lst
	while IFS= read -r adres
	do
	rm -rf $target/tmp/temp.lst 1>$target/dev/null 2>$target/dev/null
	github_adres=$(echo $adres|cut -d"/" -f1)
	binary_package_adres=$(echo $adres|cut -d"/" -f2)
	#echo $github_adres
	#echo $binary_package_adres

	curl -Lo /tmp/temp.lst "https://github.com/${github_adres}/${binary_package_adres}/releases/download/current/index.lst"
	if [ ! -f "$target/tmp/temp.lst"  ]; then echo "Paket adresleri hatalı /etc/bps/sources.list dosya içeriğini kontrol ediniz!"; continue; fi

		while IFS= read -r liste
		do
			echo "${liste}|https://github.com/${adres}/raw/master/">>$target/etc/bps/index.lst
		done < $target/tmp/temp.lst
		
	done < $target/etc/bps/sources.list
    
**bpsupdate** Kullanma
----------------------

Script bir parametre almaktadır. Parametremiz --update veya -u olmalıdır. Bu scripti kullanarak /etc/bps/index.lst dosyasını github depomuzdaki paket listesiyle güncelleyecektir. 

.. code-block:: shell
	
	./bpsupdate -u	


.. raw:: pdf

   PageBreak



Paket Kurma
+++++++++++

Hazırlanan dağıtımda paketlerin kurulması için  sırasıyla aşağıdaki işlem adımları yapılmalıdır.

1. Paketin indirilmesi
2. İndirilen paketin /tmp/bps/kur/ konumunda açılması
3. Açılan paket dosyalarının / konumuna yüklenmesi(kopyalanması)

	- Paketin bağımlı olduğu paketler varmı kontrol edilir
	- Yüklü olmayan bağımlılıklar yüklenir
	
4. Yüklenen paket bilgileri(name, version ve bağımlılık) yüklü paketlerin index bilgilerini tutan paket sistemi dizininindeki index dosyasına eklenir.	
5. Açılan paket içindeki yüklenen dosyaların nereye yüklendiğini tutan file.index dosyası paket sistemi dizinine yüklenir


Bu işlemler daha detaylandırılabilir. Bu işlemlerin detaylı olması paket sisteminin kullanılabilirliğini ve yetenekleri olarak ifade edebiliriz. İşlem adımlarını kolaylıkla sıralarken bunları yapacak script yazmak ciddi planlamalar yapılarak tasarlanması gerekmektedir.


Örneğin bir paketimiz zip dosyası olsun ve içinde dosya listesini tutan **file.index** adında bir dosyamız olsun. Paketi aşağıdaki gibi kurabiliriz.

.. code-block:: shell

	cd /tmp/kur/
	unzip /dosya/yolu/paket.zip
	cp -rfp ./* /
	cp file.index /paket/veri/yolu/paket.index

- Bu örnekte ilk satırda geçici dizine gittik 
- Paketi oraya açtık.
- Paket içeriğini kök dizine kopyaladık.
- Paket dosya listesini verilerin tutulduğu yere kopyaladık.

Bu işlemden sonra paket kurulmuş oldu.


.. raw:: pdf

   PageBreak

**bps Paket Kurma Scripti Tasarlama**
-------------------------------------
Burada basit seviyede kurulum yapan script kullanılmıştır. Detaylandırıldıkça doküman güncellenecektir. Kurulum scripti aşağıda görülmektedir.

Paket kurulurken paket içerisinde bulunan dosyalar sisteme kopyalanır.
Daha sonra istenirse silinebilmesi için paket içeriğinde dosyaların listesi tutulur.
Bu dosya ayrıca paketin bütünlüğünü kontrol etmek için de kullanılır.


**bpskur** Scripti
..................

.. code-block:: shell
	
	#!/bin/sh
	#set -e
	paket=$1
	paketname="name=\"${paket}\""
	ROOTFS=$2
	#echo "$paket"
	indexpaket=$(cat /etc/bps/index.lst|grep $paketname)
	name=""
	version=""
	depends=""
	if [ -n "${indexpaket}" ]
		then
			namex=$(echo $indexpaket|cut -d"|" -f1)
			versionx=$(echo $indexpaket|cut -d"|" -f2)
			dependsx=$(echo $indexpaket|cut -d"\|" -f3)
			name=${namex:6:-1}
			version=${versionx:9:-1}
			depends=${dependsx:9:-1}
		else
		echo "***********Paket Bulunamadı**********"; exit
	fi

	# 1. adım paketi indirme
	mkdir -p /tmp/bps
	mkdir -p /tmp/bps/kur
	rm -rf /tmp/bps/kur/*
	curl -Lo /tmp/bps/kur/${name}-${version}.tar.gz https://github.com/basitdagitim/kly-binary-packages/raw/master/${name}/${name}-${version}.bps
	
	mkdir -p /var/lib/bps
	cd /tmp/bps/kur/

	#2. adım paketi açma
	tar -xf ${name}-${version}.tar.gz
	mkdir -p rootfs
	tar -xf rootfs.tar.xz -C rootfs

	#3. adım  paketi kurma
	cp -prfv rootfs/* $ROOTFS/

	#4. adım name version depends /var/lib/bps/index.lst eklenmesi
	echo "name=\"${name}\":"version=\"${version}\":"depends=\"${depends}\"">>var/bps/index.lst
	# 5. adım paket içinde gelen paket dosyalarının dosya ve dizin yapısını tutan file index dosyanının /var/lib/bps/ konumuna kopyalanması
	cp file.index /var/lib/bps/${name}-${version}.lst



**bpskur** Scriptini Kullanma
.............................

Script iki parametre almaktadır. İlk parametre paket adı. İkinci parametremiz ise nereye kuracağını belirten hedef olmalıdır. Bu scripti kullanarak readline paketi aşağıdaki gibi kurulabilir. 

.. code-block:: shell
	
	./bpskur readline /	

.. raw:: pdf

   PageBreak



Paket Kaldırma
++++++++++++++

Sistemde kurulu paketleri kaldırmak için işlem adımları şunlardır.

1. Paketin kullandığı bağımlılıkları başka paketler kullanıyor mu kontrol edilir. Eğer kullanılmıyorsa kaldırılır.
2. Paketin paket.LIST dosyası içerisindeki dosyalar, dizinler kaldırılır.
3. Kaldırılan dosyalardan sonra /paket/veri/yolu/paket.LIST dosyasından paket bilgisi kaldırılır.
4. sistemde kurulu paketler index dosyasından ilgili paket satırı kaldırılmalıdır.


Paketi kaldırmak için ise aşağıdaki örnek kullanılabilir.

.. code-block:: shell

	cat /paket/veri/yolu/paket.LIST | while read dosya ; do
	    if [[ -f "$dosya" ]] ; then
	        rm -f "$dosya"
	    fi
	done
	cat /paket/veri/yolu/paket.LIST | while read dizin ; do
	    if [[ -d "$dizin" ]] ; then
	        rmdir "$dizin" || true
	    fi
	done
	rm -f /paket/veri/yolu/paket.LIST

Bu örnekte paket listesini satır satır okuduk. Önce dosya olanları sildik.
Daha sonra tekrar okuyup boş kalan dizinleri sildik.
Son olarak palet listesi dosyamızı sildik.
Bu işlem sonunda paket silinmiş oldu.


.. raw:: pdf

   PageBreak
   

**bps Paket Kaldırma Scripti Tasarlama**
----------------------------------------

Dokumanda örnek olarak verilen bps paket sistemi için yukarıdaki paket kaldırma bilgilerini kullanarak tasarlanmıştır.

**bpskaldir** scripti
.....................

.. code-block:: shell
	
	#!/bin/sh
	#set -e
	paket=$1
	paketname="name=\"${paket}\""
	indexpaket=$(cat /var/lib/bps/index.lst|grep $paketname)
	name=""
	version=""
	depends=""
	if [ -n "${indexpaket}" ]; then
		namex=$(echo $indexpaket|cut -d":" -f1)
		versionx=$(echo $indexpaket|cut -d":" -f2)
		dependsx=$(echo $indexpaket|cut -d":" -f3)
		name=${namex:6:-1}
		version=${versionx:9:-1}
		depends=${dependsx:9:-1}
	else
		echo "***********Paket Bulunamadı**********"; exit
	fi
	# Bağımlılıkları başka paketler kullanıyor mu kontrol edilir
	echo "bağımlılık kontrolü yapılacak"
	 
	# Paketin file.lst dosyası içerisindeki dosyalar, dizinler kaldırılır.
	cat /var/lib/bps/${paket}-${version}.lst | while read dosya ; do if [[ -f "$dosya" ]] ; then rm -f "$dosya"; fi done
	cat /var/lib/bps/${paket}-${version}.lst  | while read dizin ; do if [[ -d "$dizin" ]] ; then rmdir "$dizin" || true; fi done

	#/var/lib/bps/paket-version.lst dosyasından paket bilgisi kaldırılır.
	rm -f /var/lib/bps/${paket}-${version}.lst
	#/var/lib/bps/index.lst dosyasından ilgili paket satırı kaldırılır.
	sed '/^name=\"${paket}\"/d' /var/lib/bps/index.lst
	
Bağımlılıkları başka paketler kullanıyor mu kontrol edilir. Script içinde bu işlem yapılmamıştır. Daha sonra güncellenecektir.
Bu örnekte paket listesini satır satır okuduk. Önce dosya olanları sildik.
Daha sonra tekrar okuyup boş kalan dizinleri sildik.
Son olarak paket listesi dosyamızı sildik.
Bu işlem sonunda paket silinmiş oldu.

**bpskaldir** Kullanma
......................

**bpskaldir** scripti aşağıdaki gibi kullanılır.

.. code-block:: shell
	
	./bpskaldir readline

.. raw:: pdf

   PageBreak


.. _paketsistemi:
Paket Sistemi
=============

İso Hazırlama
+++++++++++++

Önceki bölümlerde paketler derlendi. Bu paketler oturum açtığınız kullanıcı ev dizinde **$HOME/distro/rootfs** konumunda olacaktır. Burada **$HOME** açık olan kullanıcı neyse onun konumunu verecektir. Örneğin kullanıcı adımız **bd** olsun. Bu durumda **$HOME** değeri **/home/bd/** olacaktır. Bu örneğimize göre **$HOME/distro/rootfs** ifadesi aslında **/home/bd/distro/rootfs** dir.

İso hazırlama işlemini yazımızın başında minimal iso yapma anlatılmıştı. Burada da benzer yol izlenecek. Sistemimin yani oluşacak **iso** dosyasının yapısı aşağıdaki gibi olacaktır. Buradaki dört dsyanunda nasıl hazırlanacağı ayrı ayrı anlatılacak ve en son hepsini kapsayan iso yapma scriptimizi vereceğiz.

.. code-block:: shell
	
	$HOME/distro/iso/boot/grub/grub.cfg
	$HOME/distro/iso/boot/initrd.img
	$HOME/distro/iso/boot/vmlinuz
	$HOME/distro/iso/live/filesystem.squashfs
	
**grub.cfg Hazırlama**
----------------------

 Sistemin açılmasını sağlayan dosyalardan birisi **grub.cfg** dosyasıdır. Genel olarak grub.cfg dosyası aşağıdaki gibi olmalıdır.

.. code-block:: shell

	linux /boot/vmlinuz
	initrd /boot/initrd.img
	boot


 Bu sistem için grub.cfg dosyası aşağıdaki gibi düzenlendi. Burada dikkat edilmesi gereken menü seçeneklerinde **live** ifadesi kulllanılması. Ayrıca sistemimizin servis yönetici ile başlatılmasını istediğimiz için **linux /boot/vmlinuz boot=live init=/sbin/openrc-init net.ifnames=0 biosdevname=0** sistemi canlı açılmasını sağlıyor.
 Kurulum için ise canlı(**live**) açıp kurulum yapmasını sağlayan satırımız **linux /boot/vmlinuz boot=live init=/bin/kur quiet** dır.

.. code-block:: shell

	#### Write grub.cfg
	# Timeout for menu
	echo -e "set timeout=3\n"> $HOME/distro/iso/boot/grub/grub.cfg

	# Default boot entry
	echo -e "set default=1\n">> $HOME/distro/iso/boot/grub/grub.cfg

	# Menu Colours
	echo -e "set menu_color_normal=white/black\n">>$HOME/distro/iso/boot/grub/grub.cfg
	echo -e "set menu_color_highlight=white\/blue\n">> $HOME/distro/iso/boot/grub/grub.cfg
	echo -e "insmod all_video">> $HOME/distro/iso/boot/grub/grub.cfg
	echo -e "terminal_output console">> $HOME/distro/iso/boot/grub/grub.cfg
	echo -e "terminal_input console">> $HOME/distro/iso/boot/grub/grub.cfg

	echo 'menuentry "Canli(live) GNU/Linux 64-bit" --class liveiso  {' >> $HOME/distro/iso/boot/grub/grub.cfg
	echo '    linux /boot/vmlinuz boot=live init=/sbin/openrc-init net.ifnames=0 biosdevname=0' >> $HOME/distro/iso/boot/grub/grub.cfg
	echo '    initrd /boot/initrd.img' >> $HOME/distro/iso/boot/grub/grub.cfg
	echo '}' >> $HOME/distro/iso/boot/grub/grub.cfg

	echo 'menuentry "Kur GNU/Linux 64-bit" --class liveiso  {' >> $HOME/distro/iso/boot/grub/grub.cfg
	echo '    linux /boot/vmlinuz boot=live init=/bin/kur quiet' >> $HOME/distro/iso/boot/grub/grub.cfg
	echo '    initrd /boot/initrd.img' >> $HOME/distro/iso/boot/grub/grub.cfg
	echo '}' >> $HOME/distro/iso/boot/grub/grub.cfg


**initrd.img Hazırlanması**
---------------------------


**initrd Oluşturma/Güncelleme**
-------------------------------

Sistemin initrd.img dosyasının güncellenmesi/oluşturulması için çalıştığınız sistemde  aşağıdaki komutlarla yapılabilir. 

.. code-block:: shell

	/usr/sbin/update-initramfs -u -k $(uname -r) #initrd günceller

Eğer bir dizin içinde bir sisteme initrd oluşturlacaksa, yani chroot ile sisteme erişiliyorsa yukarıdaki komut yeterli olmayacaktır. chroot öncesinde sistemin **dev sys proc run** dizinlerinin  bağlanılması gerekmektedir. Dizindeki sistemimizin dizin konumu **/$HOME/distro/rootfs** olsun. Buna göre aşağıda sisteme yukarıdaki komutu çalıştırmadan önce çalıştırılması gereken komutlar aşağıda verilmiştir. Dikkat edilmesi gereken en önemli noktalardan biriside bu komutlar **root** yetkisiyle çalıştırılmalıdır.

.. code-block:: shell

	## --------------------------------------------- 		initrd.img oluşturma scripti		 ---------------------------------------------
	rootfs="$HOME/distro/rootfs"
	distro="$HOME/distro"
	## Dizinler Oluşturuluyor
	mkdir -p $rootfs/dev
	mkdir -p $rootfs/sys
	mkdir -p $rootfs/proc 
	mkdir -p $rootfs/run
	mkdir -p $rootfs/tmp
	## Dizinler bağlanıyor
	mount --bind /dev $rootfs/dev
	mount --bind /sys $rootfs/sys
	mount --bind /proc $rootfs/proc
	mount --bind /run$rootfs/run
	mount --bind /tmp $rootfs/tmp
	
	### initrd.img oluşturuluyor/güncelleniyor
	fname=$(basename $rootfs/boot/config*)
	kversion=${fname:7}
	mv $rootfs/boot/config* $rootfs/boot/config-$kversion
	cp $rootfs/boot/config-$kversion $rootfs/etc/kernel-config
	chroot $rootfs update-initramfs -u -k $kversion
	
	## Dizin bağlantıları kaldırılıyor
	umount -lf -R $rootfs/dev 2>/dev/null
	umount -lf -R $rootfs/sys 2>/dev/null
	umount -lf -R $rootfs/proc 2>/dev/null
	umount -lf -R $rootfs/run 2>/dev/null
	umount -lf -R $rootfs/tmp 2>/dev/null
	#### initrd kopyalanıyor
	cp -pf $rootfs/boot/initrd.img-* $distro/iso/boot/initrd.img	

**vmlinuz Hazırlanması**
------------------------

Kernelimizi iso dizinimize taşıyoruz.

.. code-block:: shell

	rootfs="$HOME/distro/rootfs"
	distro="$HOME/distro"
	#### Copy kernel
	cp -pf $rootfs/boot/vmlinuz-* $distro/iso/boot/vmlinuz
	#rm -rf $rootfs/boot #istenir boyut küçültmek için bu komut aktifleştirilebilir.

**filesystem.squashfs Hazırlama**
---------------------------------

Sistemi **live** kullanma ve yükleme yapabilmek için yapılan sistemi **squashfs** dosya sıkıştırma yöntemiyle sıkılştırıyoruz. Bu dosyayı **$HOME/distro/iso/live/filesystem.squashfs** konumunda olmalı. Aşağıdaki komutlar dosyayı oluşturup **$HOME/distro//iso/live/filesystem.squashfs** konumuna taşımaktadır.

.. code-block:: shell

	cd $HOME/distro/
	mksquashfs $HOME/distro/rootfs $HOME/distro/filesystem.squashfs -comp xz -wildcards
	mv $HOME/distro/filesystem.squashfs $HOME/distro/iso/live/filesystem.squashfs



**İso Dosyasının Oluşturulması**
--------------------------------

.. code-block:: shell
	
	cd $HOME/distro
	grub-mkrescue iso/ -o distro.iso #iso doyamız oluşturulur.

**İsonun Test Edilmesi**
------------------------ 

isolarımız qemu veya virtualbox ile test edilebilir. Linux ortamında terminalden qemu kullanarak aşıdaki gibi test edebilirsiniz. Sistemde qemu paketinin kurulu olması gerekir.

.. code-block:: shell
	
	**qemu-system-x86_64 -cdrom $HOME/distro/distro.iso -m 1G** #komutuyla çalıştırıp test edebiliriz. 


.. raw:: pdf

   PageBreak
   
iso Oluşturma Scripti
---------------------

Sisteme giriş yaptığımız kullanıcının ev dizinindeki **distro/rootfs** disininden **distro/iso** dizinini kullanarak **distro** dizinine **distro.iso** dosyasını oluşturan scriptimiz aşağıdadır.

.. code-block:: shell
	
	#!/bin/bash
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display

	distro="/home/$user/distro"
	rootfs="/home/$user/distro/rootfs"
	rm -rf "$distro/iso"
	### system chroot  bind/mount
	for dir in dev dev/pts proc sys; do mount -o bind /$dir $rootfs/$dir; done
	
	chroot $rootfs echo -e "1\n1\n"|chroot $rootfs passwd root
	chroot $rootfs useradd live -m -s /bin/sh  -d /home/live
	chroot $rootfs echo -e "live\nlive\n"|chroot $rootfs passwd live

	for grp in users tty wheel cdrom audio dip video plugdev netdev; do
		chroot $rootfs usermod -aG $grp live || true
	done

	sed -i "/agetty_options/d" $rootfs/etc/conf.d/agetty
	echo -e "\nagetty_options=\"-l /usr/bin/login\"" >> $rootfs/etc/conf.d/agetty


	### update-initrd
	fname=$(basename $rootfs/boot/config*)
	kversion=${fname:7}
	mv $rootfs/boot/config* $rootfs/boot/config-$kversion
	cp $rootfs/boot/config-$kversion $rootfs/etc/kernel-config

	chroot $rootfs update-initramfs -u -k $kversion
	
	#### system chroot umount
	for dir in dev dev/pts proc sys ; do    while umount -lf -R $rootfs/$dir 2>/dev/null ; do true; done done
		
	#************************iso *********************************
	mkdir -p $distro/iso
	mkdir -p $distro/iso/boot
	mkdir -p $distro/iso/boot/grub
	mkdir -p $distro/iso/live || true

	#### Copy initramfs
	cp -pf $rootfs/boot/initrd.img-* $distro/iso/boot/initrd.img

	#### Copy kernel
	cp -pf $rootfs/boot/vmlinuz-* $distro/iso/boot/vmlinuz
	#rm -rf $rootfs/boot

	#### Create squashfs
	mksquashfs $rootfs $distro/filesystem.squashfs -comp xz -wildcards
	mv $distro/filesystem.squashfs $distro/iso/live/filesystem.squashfs

	#### Write grub.cfg
	# Timeout for menu
	echo -e "set timeout=3\n"> $distro/iso/boot/grub/grub.cfg


	# Default boot entry
	echo -e "set default=1\n">> $distro/iso/boot/grub/grub.cfg

	# Menu Colours
	echo -e "set menu_color_normal=white/black\n">> $distro/iso/boot/grub/grub.cfg
	echo -e "set menu_color_highlight=white\/blue\n">> $distro/iso/boot/grub/grub.cfg
	echo -e "insmod all_video">> $distro/iso/boot/grub/grub.cfg
	echo -e "terminal_output console">> $distro/iso/boot/grub/grub.cfg
	echo -e "terminal_input console">> $distro/iso/boot/grub/grub.cfg

	echo 'menuentry "Canli(live) GNU/Linux 64-bit" --class liveiso  {' >> $distro/iso/boot/grub/grub.cfg
	echo '    linux /boot/vmlinuz boot=live init=/sbin/openrc-init net.ifnames=0 biosdevname=0' >> $distro/iso/boot/grub/grub.cfg
	echo '    initrd /boot/initrd.img' >> $distro/iso/boot/grub/grub.cfg
	echo '}' >> $distro/iso/boot/grub/grub.cfg

	echo 'menuentry "Kur GNU/Linux 64-bit" --class liveiso  {' >> $distro/iso/boot/grub/grub.cfg
	echo '    linux /boot/vmlinuz boot=live init=/bin/kur quiet' >> $distro/iso/boot/grub/grub.cfg
	echo '    initrd /boot/initrd.img' >> $distro/iso/boot/grub/grub.cfg
	echo '}' >> $distro/iso/boot/grub/grub.cfg

	grub-mkrescue $distro/iso/ -o $distro/distro.iso

.. raw:: pdf

   PageBreak


bps ile İso Yapma
+++++++++++++++++

Dağıtımlarda, dağıtıma ait paket sistemini kullanarak iso hazırlanabilir. Bu dokümanda paket sistemi(bps) önceki bölümde anlatılmıştı. **bsp** paket sistemini kullanarak bir iso nasıl oluşturulur aşağıda verilmiştir. Burada anlatılan iso yapma scripti **Debian** vb. dağıtımlarda da benzer bir yapıdadır. Başka dağıtımlarda iso hazırlayan(deneyimi olan) geliştiriciler iso yapma aşamalırını benzer yapıda olduğunu göreceklerdir.

iso Scripti
-----------

.. code-block:: shell
	
	#!/bin/bash
	#set -x
	rootfs="/tmp/distro/rootfs"
	distro="/tmp/distro"
	#rm -rf distro/iso
	rm -rf $rootfs
	mkdir -p $rootfs
	mkdir -p $rootfs/bin $rootfs/etc


	##Kurulum scripti
	cp -prf files/bin/* $rootfs/bin/
	cp -prf files/etc/* $rootfs/etc/

	# temel dizinler ve dosyalar oluşturuluyor
	cd $rootfs/
	mkdir  -p bin dev etc home lib64 proc root run sbin sys usr var etc/bps tmp tmp/bps/kur \
	var/log  var/tmp usr/lib64/x86_64-linux-gnu usr/lib64/pkgconfig \
	usr/local/{bin,etc,games,include,lib,sbin,share,src}
	ln -s lib64 lib
	cd var&&ln -s ../run run&&cd -
	cd usr&&ln -s lib64 lib&&cd -
	cd usr/lib64/x86_64-linux-gnu&&ln -s ../pkgconfig  pkgconfig&&cd -

	bash -c "echo -e \"/bin/sh \n/bin/bash \n/bin/rbash \n/bin/dash\" >> $rootfs/etc/shell"
	bash -c "echo 'tmpfs /tmp tmpfs rw,nodev,nosuid 0 0' >> $rootfs/etc/fstab"
	bash -c "echo '127.0.0.1 kly' >> $rootfs/etc/hosts"
	bash -c "echo 'kly' > $rootfs/etc/hostname"
	bash -c "echo 'nameserver 8.8.8.8' > $rootfs/etc/resolv.conf"

	# paket adresi ekleniyor
	echo "basitdagitim/kly-binary-packages">$rootfs/etc/bps/sources.list

	### installing bps package in rootfs

	echo root:x:0:0:root:/root:/bin/sh > $rootfs/etc/passwd 
	chmod 755 $rootfs/etc/passwd

	### system chroot  bind/mount
	for dir in dev dev/pts proc sys; do mount -o bind /$dir $rootfs/$dir; done
	## paket listesi güncelleniyor
	$rootfs/bin/bps -u $rootfs

	## paketler kuruluyor
	for paket in glibc readline ncurses \bash openssl acl attr libcap libpcre2 gmp coreutils util-linux \grep \sed mpfr \gawk findutils libgcc libcap-ng \
	sqlite \gzip xz-utils zstd \bzip2 \elfutils libselinux \tar \zlib brotli curl shadow \file eudev cpio libsepol \
	kmod audit libxcrypt libnsl pam libtirpc e2fsprogs dosfstools  initramfs-tools libxml2 expat libmd libaio lvm2 popt icu iproute2 net-tools  dhcp \
	openrc  rsync kbd busybox kernel kernel-headers live-boot live-config parted  nano grub dialog efibootmgr efivar libssh openssh
	do
	chroot $rootfs /bin/bps -ri $paket; 
	#$rootfs/bin/bps -ri  $paket $rootfs
	done

	#### system chroot umount
	for dir in dev dev/pts proc sys ; do    while umount -lf -R $rootfs/$dir 2>/dev/null ; do true; done done
	exit

	chroot $rootfs useradd live -m -s /bin/sh  -d /home/live
	chroot $rootfs echo -e "live\nlive\n"|chroot $rootfs passwd live

	for grp in users tty wheel cdrom audio dip video plugdev netdev; do
		chroot $rootfs usermod -aG $grp live || true
	done

	sed -i "/agetty_options/d" $rootfs/etc/conf.d/agetty
	echo -e "\nagetty_options=\"-l /usr/bin/login\"" >> $rootfs/etc/conf.d/agetty


	### update-initrd
	fname=$(basename $rootfs/boot/config*)
	kversion=${fname:7}
	mv $rootfs/boot/config* $rootfs/boot/config-$kversion
	cp $rootfs/boot/config-$kversion $rootfs/etc/kernel-config

	chroot $rootfs update-initramfs -u -k $kversion

	#### system chroot umount
	for dir in dev dev/pts proc sys ; do    while umount -lf -R $rootfs/$dir 2>/dev/null ; do true; done done

	#************************									iso 										*********************************
	mkdir -p $distro/iso
	mkdir -p $distro/iso/boot
	mkdir -p $distro/iso/boot/grub
	mkdir -p $distro/iso/live || true

	#### Copy kernel and initramfs
	cp -pf $rootfs/boot/initrd.img-* $distro/iso/boot/initrd.img
	cp -pf $rootfs/boot/vmlinuz-* $distro/iso/boot/vmlinuz
	rm -rf $rootfs/boot

	#### Create squashfs
	mksquashfs $rootfs $distro/filesystem.squashfs -comp xz -wildcards
	mv $distro/filesystem.squashfs $distro/iso/live/filesystem.squashfs

	#### Write grub.cfg
	# Timeout for menu
	echo -e "set timeout=3\n"> $distro/iso/boot/grub/grub.cfg

	# Default boot entry
	echo -e "set default=1\n">> $distro/iso/boot/grub/grub.cfg

	# Menu Colours
	echo -e "set menu_color_normal=white/black\n">> $distro/iso/boot/grub/grub.cfg
	echo -e "set menu_color_highlight=white\/blue\n">> $distro/iso/boot/grub/grub.cfg
	echo -e "insmod all_video">> $distro/iso/boot/grub/grub.cfg
	echo -e "terminal_output console">> $distro/iso/boot/grub/grub.cfg
	echo -e "terminal_input console">> $distro/iso/boot/grub/grub.cfg

	echo 'menuentry "Canli(live) GNU/Linux 64-bit" --class liveiso  {' >> $distro/iso/boot/grub/grub.cfg
	echo '    linux /boot/vmlinuz boot=live init=/sbin/openrc-init net.ifnames=0 biosdevname=0' >> $distro/iso/boot/grub/grub.cfg
	echo '    initrd /boot/initrd.img' >> $distro/iso/boot/grub/grub.cfg
	echo '}' >> $distro/iso/boot/grub/grub.cfg

	echo 'menuentry "Kur GNU/Linux 64-bit" --class liveiso  {' >> $distro/iso/boot/grub/grub.cfg
	echo '    linux /boot/vmlinuz boot=live init=/bin/kur quiet' >> $distro/iso/boot/grub/grub.cfg
	echo '    initrd /boot/initrd.img' >> $distro/iso/boot/grub/grub.cfg
	echo '}' >> $distro/iso/boot/grub/grub.cfg

	grub-mkrescue $distro/iso/ -o $distro/distro.iso

.. raw:: pdf

   PageBreak


.. _isohazirlama:
iso Hazırlama
=============

.. _sistemkurma:

**Sistem Kurma**
++++++++++++++++

Hazırlanmış bir iso ile çeşitli kurulum araçları gelebilir. Bu araçların farklı kurulum yapma yöntemleri olmaktadır.
Sık kullanılan yöntemler şunlardır;

1. Tek bölüme sistem kurma
2. iki bölüme sistem kurma(boot+sistem)
3. uefi sistem kurma(boot+sistem)

Burada üç farklı kurulum yöntemi sırayla anlatılacaktır. Bu anlatılan yöntemler birden fazla senaryo isteğine cevap vermektedir. Fakat bu yöntemler için ayrı ayrı seçenek sunarak son kullanıcının kurulum yapılmasını istemek kafa karışıklığına sebep olabilir.
Örneğin efi seçeneği olsa fakat sistem legacy olsa veya tam tersi bir durumda kullanıcı bu detayları bilmeyebilir. Ayrıca sda veya nvme disklerde farklı senaryolar gerekecektir. Bizim yapacağımız sistem aşağıdaki tüm senaryolara cevap vermelidir. Muhtemel senaryolar;

- legacy-->sd*
- legacy-->nvme* 
- uefi-->sd* 
- uefi-->nvme*  kurulum yapılmak istenebilir. 

Bu senaryolara göre sorunsuz çalışacak kurlum scriptimiz **dialog** kullanarak hazırlanmıştır. Bu kurulum scriplerinin **base-file** paketinin **files.rar** paketinde bulunmaktadır. Bu bölümde sadece legacy ve uefi kurulum hangi adımlarla yapıldığını anlatan genel bir yazıdır. Bu yöntemleri kendi ihtiyacınıza göre düzenleyip kullanabilirsiniz. 




.. raw:: pdf

   PageBreak


Tek Bölüm Kurulum
=================
Diskler üzerinde işlem yapabilmek için evdev veya udevd servisi çalışıyor olmalı.
Ayrıca aşağıdaki modüllerin yüklü olduğundan emin olun.
Anlatım boyunca **/dev/sda** diski üzerinden örnekleme yapılmıştır. Siz kendi diskinize göre düzenleyebilirsiniz.
Disk ve isoya erişim için aşağıdaki modüllerin yüklü olduğundan emin olun.

- loop
- squashfs
- ext4 modulleri **modprobe** komutuyla yüklenmeli.

Disk Hazırlanmalı(legacy)
^^^^^^^^^^^^^^^^^^^^^^^^^
Öncelikle **cfdisk** veya **fdisk** komutları ile diski bölümlendirelim. Ben bu anlatımda **cfdisk** kullanacağım.


0. cfdisk komutuyla disk bölümlendirilmeli.

.. code-block:: shell
		
	$ cfdisk /dev/sda
	
1. dos seçilmeli
2. type linux system
3. write
4. quit
5. Bu işlem sonucunda sadece sda1 olur
6. mkfs.ext2 ile disk biçimlendirilir.

.. code-block:: shell

	$ mkfs.ext2 /dev/sda1


Dosya sistemini kopyalama
^^^^^^^^^^^^^^^^^^^^^^^^^
Kurulum medyası **/cdrom** dizinine bağlanır.
Kurulacak sistemin imajını bir dizine bağlayalım.

.. code-block:: shell
		
	$ mkdir -p cdrom
	$ mkdir -p source
	$ mount -t iso9660 -o loop /dev/sr0 /cdrom/
	$ mount -t squashfs -o loop /cdrom/live/filesystem.squashfs /source

Şimdi de disk bölümümüzü bağlayalım.

.. code-block:: shell

	$ mkdir -p target
	$ mount /dev/sda1 /target
	$ mkdir -p /target/boot

Ardından dosyaları kopyalayalım.

.. code-block:: shell

	# -p dosya izinlerini korur
	# -r alt dizinlerle beraber kopyalar
	# -f soru sormayı kapatır
	# -v detaylı çıktıları gösterir
	$ cp -prfv /source/* /target

Daha sonra diski senkronize edelim.

.. code-block:: shell

	$ sync

Bootloader kurulumu
^^^^^^^^^^^^^^^^^^^
grub kurulumu yapmak için grub paketinini kurulu olduğundan emin olun.

.. code-block:: shell

	$ mkdir -p /target/dev
	$ mkdir -p /target/sys
	$ mkdir -p /target/proc 
	$ mkdir -p /target/run
	$ mkdir -p /target/tmp
	$ mount --bind /dev /target/dev
	$ mount --bind /sys /target/sys
	$ mount --bind /proc /target/proc
	$ mount --bind /run /target/run
	$ mount --bind /tmp /target/tmp
	
	# Bunun yerine aşağıdaki gibi de girilebilir.
	for dir in /dev /sys /proc /run /tmp ; do
		mount --bind /$dir /target/$dir
	done
	$ chroot /target


Grub Kuralım
^^^^^^^^^^^^
.. code-block:: shell

	$ grub-install --boot-directory=/boot  /dev/sda


Grub yapılandırması
^^^^^^^^^^^^^^^^^^^
1. /boot bölümünde initrd.img-<çekirdek-sürümü> dosyamızın olduğundan emin olalım.
2. /boot bölümünde vmlinuz-<çekirdek-sürümü>  kernel dosyamızın olduğundan emin olalım.
3. /boot/grub/grub.cfg konumunda dostamızı oluşturalım(vi, touch veya nano ile).
4. dev/sda1 diskimizim uuid değerimizi bulalım.


.. code-block:: shell

	$ blkid | grep /dev/sda1
	/dev/sda1: UUID="..." BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="..."

Şimdi aşağıdaki gibi bir yapılandırma dosyası yazalım ve /boot/grub/grub.cfg dosyasına kaydedelim.
Burada uuid değerini ve çekirdek sürümünü düzenleyin.

.. code-block:: shell

	linux /boot/vmlinuz-<çekirdek-sürümü>	root=UUID=<uuid-değeri> rw quiet
	initrd /boot/initrd.img-<çekirdek-sürümü>
	boot


Ayrıca otomatik yapılandırma da oluşturabiliriz.

.. code-block:: shell
	
	$ grub-mkconfig -o /boot/grub/grub.cfg

**Not:** Disk bölümü konumu yerine **UUID="<uuid-değeri>"** şeklinde yazmanızı öneririm.
Bölüm adları değişebilirken uuid değerleri değişmez.


.. raw:: pdf

   PageBreak

İki Bölüm Kurulum
+++++++++++++++++

Bu bölümde **Ext4** dosya sistemine grub kullanarak kurulum anlatılacaktır.
Anlatım boyunca **/dev/sda** diski üzerinden örnekleme yapılmıştır. Siz kendi diskinize göre düzenleyebilirsiniz.
Diskler üzerinde işlem yapabilmek için evdev veya udevd servisi çalışıyor olmalı.
Disk ve isoya erişim için aşağıdaki modüllerin yüklü olduğundan emin olun.


- loop
- squashfs
- ext4 modulleri **modprobe** komutuyla yüklenmeli.

Disk Hazırlanmalı
^^^^^^^^^^^^^^^^^
Öncelikle **cfdisk** veya **fdisk** komutları ile diski bölümlendirelim. Ben bu anlatımda **cfdisk** kullanacağım.

0. cfdisk komutuyla disk bölümlendirilmeli.
.. code-block:: shell
		
	$ cfdisk /dev/sda

1. gpt seçilmeli
2. 512 MB type vfat alan(sda1)
3. geri kalanı type linux system(sda2)
4. write
5. quit
6. Bu işlem sonucunda sadece sda1 sda2 olur
7. mkfs.vfat ve mkfs.ext4 ile diskler biçimlendirilir.

.. code-block:: shell

	$ mkfs.vfat /dev/sda1
	$ mkfs.ext4 /dev/sda2
		
e2fsprogs Paketi
^^^^^^^^^^^^^^^^
e2fsprogs paket sistemde mkfs.ext4, e2fsck, tune2fs vb sistem araçlarının yüklenmesini sağlar. Eğer sistemde bu sistem uygulamaları yoksa bu paketin yüklenmesi veya derlenmesi gerekmektedir.

Eğer /boot bölümünü ayırmayacaksanız grub yüklenirken **unknown filesystem** hatası almanız durumunda aşağıdaki yöntemi kullanabilirsiniz.

.. code-block:: shell

	$ e2fsck -f /dev/sda2
	$ tune2fs -O ^metadata_csum /dev/sda2

Dosya sistemini kopyalama
^^^^^^^^^^^^^^^^^^^^^^^^^
Kurulum medyası **/cdrom** dizinine bağlanır.
Kurulacak sistemin imajını bir dizine bağlayalım.

.. code-block:: shell
		
	$ mkdir -p cdrom
	$ mkdir -p source
	$ mount -t iso9660 -o loop /dev/sr0 /cdrom/
	$ mount -t squashfs -o loop /cdrom/live/filesystem.squashfs /source

Şimdi de disk bölümümüzü bağlayalım.

.. code-block:: shell

	$ mkdir -p target
	$ mkdir -p /target/boot
	$ mount /dev/sda2 /target
	$ mount -t vfat /dev/sda1 /target/boot

Ardından dosyaları kopyalayalım.

.. code-block:: shell

	# -p dosya izinlerini korur
	# -r alt dizinlerle beraber kopyalar
	# -f soru sormayı kapatır
	# -v detaylı çıktıları gösterir
	$ cp -prfv /source/* /target

Daha sonra diski senkronize edelim.

.. code-block:: shell

	$ sync


Bootloader kurulumu
^^^^^^^^^^^^^^^^^^^
grub kurulumu yapmak için grub paketinin kurulu olduğundan emin olun.

.. code-block:: shell

	$ mkdir -p /target/dev
	$ mkdir -p /target/sys
	$ mkdir -p /target/proc 
	$ mkdir -p /target/run
	$ mkdir -p /target/tmp
	$ mount --bind /dev /target/dev
	$ mount --bind /sys /target/sys
	$ mount --bind /proc /target/proc
	$ mount --bind /run /target/run
	$ mount --bind /tmp /target/tmp

	# Bunun yerine aşağıdaki gibi de girilebilir.
	for dir in /dev /sys /proc /run /tmp ; do
	mount --bind /$dir /target/$dir
	done
	$ chroot /target


Grub Kuralım
^^^^^^^^^^^^

.. code-block:: shell

	# kurulu sistemden bağımsız çalışması için --removable kullanılır.
	$ grub-install --removable --boot-directory=/boot --efi-directory=/boot /dev/sda

Grub yapılandırması
^^^^^^^^^^^^^^^^^^^
1. /boot bölümünde initrd.img-<çekirdek-sürümü> dosyamızın olduğundan emin olalım.
2. /boot bölümünde vmlinuz-<çekirdek-sürümü>  kernel dosyamızın olduğundan emin olalım.
3. /boot/grub/grub.cfg konumunda dostamızı oluşturalım(vi, touch veya nano ile).
4. dev/sda2 diskimizim uuid değerimizi bulalım.

.. code-block:: shell

	$ blkid | grep /dev/sda2
	/dev/sda2: UUID="..." BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="..."

Şimdi aşağıdaki gibi bir yapılandırma dosyası yazalım ve /boot/grub/grub.cfg dosyasına kaydedelim.
Burada uuid değerini ve çekirdek sürümünü düzenleyin.

.. code-block:: shell

	linux /vmlinuz-<çekirdek-sürümü>	root=UUID=<uuid-değeri> rw quiet
	initrd /initrd.img-<çekirdek-sürümü>
	boot


Ayrıca otomatik yapılandırma da oluşturabiliriz.

.. code-block:: shell

	$ grub-mkconfig -o /boot/grub/grub.cfg

**Not:** Disk bölümü konumu yerine **UUID="<uuid-değeri>"** şeklinde yazmanızı öneririm.
Bölüm adları değişebilirken uuid değerleri değişmez.


.. raw:: pdf

   PageBreak


Uefi Sistem Kurulumu
++++++++++++++++++++

Bu bölümde **Ext4** dosya sistemine grub kullanarak kurulum anlatılacaktır.
Anlatım boyunca **/dev/sda** diski üzerinden örnekleme yapılmıştır. Siz kendi diskinize göre düzenleyebilirsiniz.
Diskler üzerinde işlem yapabilmek için evdev veya udevd servisi çalışıyor olmalı.
Disk ve isoya erişim için aşağıdaki modüllerin yüklü olduğundan emin olun.


- loop
- squashfs
- ext4 modulleri **modprobe** komutuyla yüklenmeli.

Uefi - Legacy tespiti
^^^^^^^^^^^^^^^^^^^^^
**/sys/firmware/efi** dizini varsa uefi, yoksa legacy sisteme sahipsinizdir.
Eğer uefi ise ia32 veya x86_64 olup olmadığını anlamak için **/sys/firmware/efi/fw_platform_size** içeriğine bakın.

.. code-block:: shell

	[[ -d /sys/firmware/efi/ ]] && echo UEFI || echo Legacy
	[[ "64" == $(cat/sys/firmware/efi/fw_platform_size) ]] && echo x86_64 || ia32

Disk Hazırlanmalı
^^^^^^^^^^^^^^^^^
Uefi kullananlar ayrı bir disk bölümüne ihtiyaç duyarlar.
Bu bölümü **fat32** olarak bölümlendirmeliler.

Bu anlatımda kurulum için **/boot** dizinini ayırmayı ve efi bölümü olarak aynı diski kullanmayı tercih edeceğiz.
Öncelikle **cfdisk** veya **fdisk** komutları ile diski bölümlendirelim. Ben bu anlatımda **cfdisk** kullanacağım.

0. cfdisk komutuyla disk bölümlendirilmeli.

.. code-block:: shell
		
	$ cfdisk /dev/sda

1. gpt seçilmeli
2. 512 MB type uefi alan(sda1)
3. geri kalanı type linux system(sda2)
4. write
5. quit
6. Bu işlem sonucunda sadece sda1 sda2 olur
7. mkfs.vfat ve mkfs.ext4 ile diskler biçimlendirilir.

.. code-block:: shell

	$ mkfs.vfat /dev/sda1
	$ mkfs.ext4 /dev/sda2
		
e2fsprogs Paketi
^^^^^^^^^^^^^^^^
e2fsprogs paket sistemde mkfs.ext4, e2fsck, tune2fs vb sistem araçlarının yüklenmesini sağlar. Eğer sistemde bu sistem uygulamaları yoksa bu paketin yüklenmesi veya derlenmesi gerekmektedir.

Eğer /boot bölümünü ayırmayacaksanız grub yüklenirken **unknown filesystem** hatası almanız durumunda aşağıdaki yöntemi kullanabilirsiniz.

.. code-block:: shell

	$ e2fsck -f /dev/sda2
	$ tune2fs -O ^metadata_csum /dev/sda2

Dosya sistemini kopyalama
^^^^^^^^^^^^^^^^^^^^^^^^^
Kurulum medyası **/cdrom** dizinine bağlanır.
Kurulacak sistemin imajını bir dizine bağlayalım.

.. code-block:: shell
		
	$ mkdir -p cdrom
	$ mkdir -p source
	$ mount -t iso9660 -o loop /dev/sr0 /cdrom/
	$ mount -t squashfs -o loop /cdrom/live/filesystem.squashfs /source

Şimdi de disk bölümümüzü bağlayalım.

.. code-block:: shell

	$ mkdir -p target || true
	$ mkdir -p /target/boot || true
	$ mkdir -p /target/boot/efi || true
	$ mount /dev/sda2 /target || true
	$ mount /dev/sda1 /target/boot/efi

Ardından dosyaları kopyalayalım.

.. code-block:: shell

	# -p dosya izinlerini korur
	# -r alt dizinlerle beraber kopyalar
	# -f soru sormayı kapatır
	# -v detaylı çıktıları gösterir
	$ cp -prfv /source/* /target

Daha sonra diski senkronize edelim.

.. code-block:: shell

	$ sync


Bootloader kurulumu
^^^^^^^^^^^^^^^^^^^
grub kurulumu yapmak için grub paketinini kurulu olduğundan emin olun.

.. code-block:: shell

	$ mkdir -p /target/dev
	$ mkdir -p /target/sys
	$ mkdir -p /target/proc 
	$ mkdir -p /target/run
	$ mkdir -p /target/tmp
	$ mount --bind /dev /target/dev
	$ mount --bind /sys /target/sys
	$ mount --bind /proc /target/proc
	$ mount --bind /run /target/run
	$ mount --bind /tmp /target/tmp
	#efi alan bağlanıyor. Eğer uefi aktif edilmişse kernel **/sys/firmware/efi** tarafından budizinler ve dosyalar oluşuyor. 
	#sistem uefi değise **/sys/firmware/efi** konumunda dosyalar olmayacaktır.
	$ if [[ -d /sys/firmware/efi ]] ; then
    		mount --bind /sys/firmware/efi/efivars /target/sys/firmware/efi/efivars
	  fi
		
	# Bunun yerine aşağıdaki gibi de girilebilir.
	for dir in /dev /sys /proc /run /tmp ; do
		mount --bind /$dir /target/$dir
	done
	$ chroot /target

Şimdi de uefi kullandığımız için efivar bağlayalım.
.. code-block:: shell

	$ mount -t efivarfs efivarfs /sys/firmware/efi/efivarfs
	
Grub Kuralım
^^^^^^^^^^^^
.. code-block:: shell

	# biz /boot ayırdığımız ve efi bölümü olarak kullanacağız.
	# uefi kullanmayanlar --efi-directory belirtmemeliler.
	# kurulu sistemden bağımsız çalışması için --removable kullanılır.
	$ grub-install --removable --boot-directory=/boot --efi-directory=/boot --target=x86_64-efi /dev/sda

Grub yapılandırması
^^^^^^^^^^^^^^^^^^^
1. /boot bölümünde initrd.img-<çekirdek-sürümü> dosyamızın olduğundan emin olalım.
2. /boot bölümünde vmlinuz-<çekirdek-sürümü>  kernel dosyamızın olduğundan emin olalım.
3. /boot/grub/grub.cfg konumunda dostamızı oluşturalım(vi, touch veya nano ile).
4. dev/sda2 diskimizim uuid değerimizi bulalım.

.. code-block:: shell

	$ blkid | grep /dev/sda2
	/dev/sda2: UUID="..." BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="..."

Şimdi aşağıdaki gibi bir yapılandırma dosyası yazalım ve /boot/grub/grub.cfg dosyasına kaydedelim.
Burada uuid değerini ve çekirdek sürümünü düzenleyin.

.. code-block:: shell

	linux /vmlinuz-<çekirdek-sürümü>	root=UUID=<uuid-değeri> rw quiet
	initrd /initrd.img-<çekirdek-sürümü>
	boot


Ayrıca otomatik yapılandırma da oluşturabiliriz.

.. code-block:: shell

	$ grub-mkconfig -o /boot/grub/grub.cfg

**Not:** Disk bölümü konumu yerine **UUID="<uuid-değeri>"** şeklinde yazmanızı öneririm.
Bölüm adları değişebilirken uuid değerleri değişmez.


.. raw:: pdf

   PageBreak


.. _sistemkurulumu:
Sistem Kurulumu
===============

**X Pencere Nedir?**
++++++++++++++++++++

X Pencere Sistemi, grafik kullanıcı arayüzü (GUI) uygulamalarının çalışmasını sağlayan bir sistemdir. Linux ve Unix tabanlı işletim sistemlerinde yaygın olarak kullanılır.

X Pencere Sistemi, kullanıcıların grafiksel arayüzler aracılığıyla etkileşimde bulunmasını sağlayan bir altyapıdır. 1984 yılında MIT tarafından geliştirilen bu sistem, ağ üzerinden grafiksel uygulamaların çalıştırılmasına olanak tanır. X, istemci-sunucu mimarisi ile çalışır; burada istemciler, grafiksel uygulamalar iken, sunucu ise ekran, klavye ve fare gibi giriş/çıkış aygıtlarını yönetir.

X Pencere Sistemi, çoklu pencere yönetimi, ekran paylaşımı ve uzaktan erişim gibi özellikler sunar. Örneğin, bir X istemcisi, başka bir makinedeki X sunucusunda çalışabilir. Bu, kullanıcıların farklı sistemlerdeki uygulamalara erişimini kolaylaştırır. X11 protokolü, bu sistemin temelini oluşturur ve geniş bir uygulama yelpazesine destek verir.

Aşağıda basit bir X uygulaması örneği verilmiştir:

.. code-block:: shell

	xterm

Bu komut, X Pencere Sistemi altında bir terminal penceresi açar. X Pencere Sistemi, modern Linux dağıtımlarında genellikle GNOME veya KDE gibi masaüstü ortamları ile birlikte kullanılır.


.. raw:: pdf

   PageBreak


**X Pencere Derleme**
++++++++++++++++++++

X Pencere sistemini derlemek için öncelikle gerekli bağımlılıkların kurulu olduğundan emin olmalısınız. Aşağıdaki adımları izleyerek X Pencere'yi derleyebilirsiniz:

    Gerekli Paketleri Yükleyin: Gerekli kütüphaneleri ve araçları yüklemek için terminalde aşağıdaki komutu çalıştırın:

.. code-block:: shell

	sudo apt-get install build-essential xorg-dev

Kaynak Kodunu İndirin: X Pencere kaynak kodunu resmi web sitesinden indirin. Örneğin:

.. code-block:: shell

	wget https://www.x.org/archive/individual/xserver/xorg-server-1.20.13.tar.gz
	tar -xzf xorg-server-1.20.13.tar.gz
	cd xorg-server-1.20.13

Yapılandırma: Yapılandırma dosyasını oluşturmak için ./configure komutunu kullanın:

.. code-block:: shell

	./configure

Derleme: Derleme işlemini başlatmak için:

.. code-block:: shell

	make

Kurulum: Derleme tamamlandıktan sonra, X Pencere'yi kurmak için:

.. code-block:: shell

	sudo make install

Bu adımları takip ederek X Pencere sistemini başarıyla derleyebilir ve kurabilirsiniz. Herhangi bir hata ile karşılaşırsanız, hata mesajlarını dikkatlice inceleyerek gerekli düzeltmeleri yapmalısınız.


.. raw:: pdf

   PageBreak


**Xorg Çalıştırma**
++++++++++++++++++++

Xorg Yapılandırma Dosyası
-------------------------

Xorg, genellikle /etc/X11/xorg.conf dosyasını kullanır. Eğer bu dosya yoksa, Xorg varsayılan ayarlarla çalışacaktır. Ancak, özel ayarlar yapmak istiyorsanız, bu dosyayı oluşturmanız gerekebilir. Aşağıdaki komut ile bir yapılandırma dosyası oluşturabilirsiniz:

.. code-block:: shell
	
	sudo X -configure

Bu komut, xorg.conf.new adında bir dosya oluşturacaktır. Bu dosyayı /etc/X11/xorg.conf olarak kopyalayabilirsiniz:

.. code-block:: shell
	
	sudo cp ~/xorg.conf.new /etc/X11/xorg.conf

Xwrapper.config
...............

.. code-block:: shell
	
	echo needs_root_rights=yes>/etc/X11/Xwrapper.config
	echo allowed_users=anybody>>/etc/X11/Xwrapper.config

Kullanınıcı Ayarı
.................
 
Kullanıcının tty ve wheel grubunda olması lazım ayrıca **/dev/tty*** dosyalarının grub ve izinleri ayarlanmalıdır. 
.. code-block:: shell
	
	chmod 620 /dev/tty*
	chgrp tty /dev/tty*
	usermod -a -G tty by
	addgroup wheel
	usermod -a -G wheel by

Xorg'u Elle Başlatma
--------------------

Xorg'u elle başlatmak için terminalde aşağıdaki komutu kullanabilirsiniz:

.. code-block:: shell
	
	export DISPLAY=:0
	Xorg:0
	
Bu şekilde çalıştırmak yerine;

.. code-block:: shell
	
		startx

Bu komut, varsayılan kullanıcı arayüzünü başlatacaktır. Eğer belirli bir pencere yöneticisi veya masaüstü ortamı ile başlatmak istiyorsanız, ~/.xinitrc dosyasını düzenlemeniz gerekebilir. Örneğin, openbox kullanmak istiyorsanız, dosyanın içeriği şöyle olmalıdır:

.. code-block:: shell

	exec openbox-session

Xorg'u Durdurma
---------------

Xorg'u durdurmak için, terminalde Ctrl + Alt + Backspace tuş kombinasyonunu kullanabilirsiniz. Bu, X sunucusunu kapatacaktır.

.. raw:: pdf

   PageBreak


**Xorg Hata ayıklama**
++++++++++++++++++++++

Hata Ayıklama
-------------

Eğer Xorg başlatılamıyorsa, hata ayıklamak için aşağıdaki komutu kullanarak log dosyalarını kontrol edebilirsiniz:

.. code-block:: shell
	
	cat /var/log/Xorg.0.log

Bu dosya, Xorg'un başlatılması sırasında oluşan hataları ve uyarıları içerecektir. Hataları inceleyerek sorunu çözmeye çalışabilirsiniz.


.. raw:: pdf

   PageBreak


**X Paketleri**
+++++++++++++++

x11 derlemek için maddeler halinde verilen adreslerin içinde bulunanan paketlerin son versiyonları derlenmelidir.
Bu paketler birbirine bağımlı paketlerdir.  Bundan dolayı aşağıda verdiğim sıralamaya göre derlenmelidir.

- https://www.x.org/releases/individual/xcb/
- https://www.x.org/releases/individual/util/
- https://www.x.org/releases/individual/proto/
- https://www.x.org/releases/individual/driver/
- https://www.x.org/releases/individual/lib/
- https://www.x.org/releases/individual/xserver/
- https://www.x.org/releases/individual/font/
- https://www.x.org/releases/individual/app/

Bunların dışında x11 pencere sisteminin en önemli paketleri şunlardır;

1. mesa : https://gitlab.freedesktop.org/mesa/mesa/-/tags
2. llvm	: https://github.com/llvm/llvm-project/tags
3. cairo: https://gitlab.freedesktop.org/cairo/cairo/-/tags

Tüm paketleri derlesek bile **mesa,llvm,cairo** paketleri düzgün ve uyumlu versiyonları olmadığı zaman X penceremiz açılmayacaktır.

Buradaki tüm paketler ve bağımlılıkları derlendikten sonra **Xorg:0** şeklinde elle çalıştırarak hata ayıklama yapılmalıdır. 

.. raw:: pdf

   PageBreak


.. _xderleme:
X Pencere Sistemi
=================

.. _chrootnedir:

Chroot Nedir?
+++++++++++++

chroot komutu çalışan sistem üzerinde belirli bir klasöre root yetkisi verip sadece o klasörü sanki linux sistemi gibi çalıştıran bir komuttur. Sağladığı avantajlar çok fazladır. Bunlar;

    - Sistem tasarlama
    - Sitem üzerinde yeni dağıtımlara müdahale etme ve sorun çözme
    - Kullanıcı kendine özel geliştirme ortamı oluşturabilir.
    - Yazılım bağımlıkları sorunlarına çözüm olabilir.
    - Kullanıcıya sadece kendisine verilen alanda sınırsız yetki verme vb.

.. image:: /_static/images/chroot-1.png
  :width: 400


Yukarıdaki resimde user1 altında wrk dizini altına yeni bir sistem kurulmuş gibi yapılandırmayı gerçekleştirmiş.

**/home/user1/wrk** dizinindeki sistem üzerinde sisteme erişmek için;

.. code-block:: shell

	sudo chroot /home/user1/wrk #sisteme erişim yapıldı.
	
**/home/user1/wrk** dizinindeki sistem üzerinde sistemi silmek için;

.. code-block:: shell

	sudo rm -rf /home/user1/wrk #sistem silindi

.. raw:: pdf

   PageBreak
   
Yeni sistem tasarlamak ve erişmek için temel komutları ve komut yorumlayıcının olması gerekmektedir. Bunun için bize gerekli olan komutları bu yapının içine koymamız gerekmektedir. Örneğin ls komutu için doğrudan çalışıp çalışmadığını ldd komutu ile kontrol edelim.

.. image:: /_static/images/chroot-2.png
  :width: 600

Görüldüğü gibi ls komutunun çalışması için bağımlı olduğu kütüphane dosyaları bulunmaktadır. Bağımlı olduğu dosyaları yeni oluşturduğumuz sistem dizinine aynı dizin yapısında kopyalamamız gerekmektedir. Bu dosyalar eksiksiz olursa ls komutu çalışacaktır. Fakat bu işlemi tek tek yapmamız çok zahmetli bir işlemdir. Bu işi yapacak script dosyası aşağıda verilmiştir.

Bağımlılık Scripti
------------------

lddscript.sh

.. code-block:: shell

	#!/bin/bash

	if [ ${#} != 2 ]
	then
	    echo "usage $0 PATH_TO_BINARY target_folder"
	    exit 1
	fi
	path_to_binary="$1"
	target_folder="$2"

	# if we cannot find the the binary we have to abort
	if [ ! -f "${path_to_binary}" ]
	then
	    echo "The file '${path_to_binary}' was not found. Aborting!"
	    exit 1
	fi

	echo "---> copy binary itself" # copy the binary itself
	cp --parents -v "${path_to_binary}" "${target_folder}"

	echo "---> copy libraries" # copy the library dependencies
	ldd "${path_to_binary}" | awk -F'[> ]' '{print $(NF-1)}' | while read -r lib
	do
	    [ -f "$lib" ] && cp -v --parents "$lib" "${target_folder}"
	done

Basit Sistem Oluşturma
----------------------

Bu örnekte kullanıcının(etapadmin) ev dizinine(/home/etapadmin) test dizini oluşturuldu ve işlemler yapıldı. 
ls, rmdir, mkdir ve bash komutlarından oluşan sistem hazırlama.

Sistem Dizinin Oluştrulması
---------------------------

.. code-block:: shell

	mkdir /home/etapadmin/test/ #ev dizinine test dizini oluşturuldu.
	
/home/etapadmin/ dizinine **Bağımlılık Scripti** kodunu **lddscripts.sh** oluşturalım.

ls Komutu
----------

.. code-block:: shell

	bash lddscripts.sh /bin/ls /home/etapadmin/test/ #komutu ile ls komutunu ve bağımlılığı kopyalandı.

.. image:: /_static/images/chroot-3.png
  :width: 600

Bu işlemi diğer komutlar içinde sırasıyla yapmamız gerekmektedir.

rmdir Komutu
------------

.. code-block:: shell

	bash lddscripts.sh /bin/rmdir /home/etapadmin/test/ #komutu ile rmdir komutunu ve bağımlılığı kopyalandı.

.. image:: /_static/images/chroot-4.png
  :width: 600


.. raw:: pdf

   PageBreak
   
mkdir Komutu
------------

.. code-block:: shell

	bash lddscripts.sh /bin/mkdir /home/etapadmin/test/ #komutu ile mkdir komutunu ve bağımlılığı kopyalandı.

.. image:: /_static/images/chroot-5.png
  :width: 600

bash Komutu
------------

.. code-block:: shell

	bash lddscripts.sh /bin/bash /home/etapadmin/test/ #komutu ile bash komutunu ve bağımlılığı kopyalandı.

.. image:: /_static/images/chroot-6.png
  :width: 600


chroot Sistemde Çalışma
------------------------

.. code-block:: shell

	sudo chroot /home/etapadmin/test komutunu kullanmalıyız.

.. image:: /_static/images/chroot-7.png
  :width: 600

- **abc** dizini oluşturuldu.   
- **abc** dizini silindi.
- **pwd** komutuyla konum öğrenildi. 
- **ldd** komutu sistemimizde olmadığından hata verdi.
- Çıkış için ise ***exit*** komutu kullanılarak sistemden çıkıldı.

Kaynak:
https://stackoverflow.com/questions/64838052/how-to-delete-n-characters-appended-to-ldd-list

.. raw:: pdf

   PageBreak


busybox Nedir?
++++++++++++++

Busybox tek bir dosya halinde bulunan birçok araç seçine sahip olan bir programdır. Bu araçlar initramfs sisteminde ve sistem genelinde sıkça kullanılabilir. Busybox aşağıdaki gibi kullanılır.

.. code-block:: shell

	$ busybox [komut] (seçenekler)

Eğer busyboxu komut adı ile linklersek o komutu doğrudan çalıştırabiliriz. Aşağıda tar uygulamasını busybox dan türettik.

.. code-block:: shell

	$ ln -s /bin/busybox ./tar
	$ ./tar

Busyboxtaki tüm araçları sisteme sembolik bağ atmak için aşağıdaki gibi bir yol izlenebilir. Bu işlem var olan dosyaları sildiği için tehlikeli olabilir. Sistemin tasarımına uygun olarak yapılmalıdır.

.. code-block:: shell

	$ busybox --install -s /bin # -s parametresi sembolik bağ olarak kurmaya yarar.
	
Busybox Derleme
---------------

Busybox **static** olarak derlenmediği sürece bir libc kütüphanesine ihtiyaç duyar. initramfs içerisinde kullanılacaksa içerisine libc dahil edilmelidir. Bir dosyanın static olarak derlenip derlenmediğini öğrenmek için aşağıdaki komut kullanılır. Derleme türleri ve detayları için bu dokümandaki derleme konusuna bakınız.

.. code-block:: shell

	$ ldd /bin/busybox # static derlenmişse hata mesajı verir. Derlenmemişse bağımlılıklarını listeler.

Busybox derlemek için öncelikle **make defconfig** kullanılarak veya önceden oluşturduğumuz yapılandırma dosyasını atarak yapılandırma işlemi yapılır. Ardından eğer static derleme yapacaksak yapılandırma dosyasına müdahale edilir. Son olarak **make** komutu kullanarak derleme işlemi yapılır.

.. code-block:: shell

	$ make defconfig
	$ sed -i "s|.*CONFIG_STATIC_LIBGCC .*|CONFIG_STATIC_LIBGCC=y|" .config
	$ sed -i "s|.*CONFIG_STATIC .*|CONFIG_STATIC=y|" .config
	$ make

Derleme bittiğinde kaynak kodun bulunduğu dizinde busybox dosyamız oluşmuş olur.

Static olarak derlemiş olduğumuz busyboxu kullanarak minimal bir dağıtım hazırlayabiliriz.

.. raw:: pdf

   PageBreak

OpenRC
++++++

Openrc sistem açılışında çalışacak uygulamaları çalışrıran servis yöneticisidir.

Kurulum
-------

Kaynak koddan derlemek için aşağıdaki adımları izlemelisiniz:

.. code-block:: shell

	$ git clone https://github.com/OpenRC/openrc
	$ cd openrc
	$ meson setup build --prefix=/usr
	$ ninja -C build install

Çalıştırılması
--------------

Openrc servis yönetiminin çalışması için boot parametrelerine yazılması gerekmektedir. 
**/boot/grub.cfg** içindeki **linux /vmlinuz init=/usr/sbin/openrc-init root=/dev/sdax** olan satırda **init=/usr/sbin/openrc-init** yazılması gerekmektedir. Artık sistem openrc servis yöneticisi tarafından uygulamalar çalıştırılacak ve sistem hazır hale getirilecek.

Basit kullanım
--------------

Servis etkinleştirip devre dışı hale getirmek için **rc-update** komutu kullanılır. Aşağıda **udhcpc** internet servisi örnek olarak gösterilmiştir. **/etc/init.d/** konumunda **udhcpc** dosyamızın olması gerekmektedir.

.. code-block:: shell

	# servis etkinleştirmek için
	$ rc-update add udhcpc boot
	# servisi devre dışı yapmak için
	$ rc-update del udhcpc boot
	# Burada udhcpc servis adı boot ise runlevel adıdır.

Servisleri başlatıp durdurmak için ise **rc-service** komutu kullanılır.

.. code-block:: shell

	$ rc-service udhcpc start
	# veya şu şekilde de çalıştırılabilir.
	$ /etc/init.d/udhcpc start

Servislerin durmunu öğrenmek için **rc-status** komutu kullanılır. Ayrıca
sistemdeki servislerin sonraki açılışta hangisinin başlatılacağını öğrenmek için
ise parametresiz olarak **rc-update** kullanabilirsiniz.

.. code-block:: shell

	# şu an hangi servislerin çalıştığını gösterir
	$ rc-status
	# sonraki açılışta hangi servislerin çalışacağını gösterir
	$ rc-update

Sistemi kapatmak veya yeniden başlatmak için **openrc-shutdown** komutunu kullanabilirsiniz.

.. code-block:: shell

	# kapatmak için
	$ openrc-shutdown -p 0
	# yeniden başlatmak için
	$ openrc-shutdown -r 0


Servis dosyası
--------------

Openrc servis dosyaları basit birer **bash** betiğidir. Bu betikler **openrc-run** komutu ile çalıştırılır ve çeşitli fonksiyonlardan oluşabilir. Servis dosyaları **/etc/init.d** içerisinde bulunur. Servisleri ayarlamak için ise **/etc/conf.d** içerisine aynı isimle ayar dosyası oluşturabiliriz.

Çalıştırılacak komut komut parametreleri ve **pidfile** dosyamızı aşağıdaki gibi belirtebiliriz.

.. code-block:: shell

	description="Ornek servis"
	command=/usr/bin/ornek-servis
	command_args=--parametre
	pidfile=/run/ornek-servis.pid

Bununla birlikte **start**, **stop**, **status**, **reload**, **start_pre**, **stop_pre** gibi fonksiyonlar da yazabiliriz.

.. code-block:: shell

	...
	start(){
	    ebegin "Starting ${RC_SVCNAME}"
	    start-stop-daemon --start --pidfile "/run/servis.pid" --exec /usr/bin/ornek-servis --parametre
	}
	...

Servis bağımlılıklarını belirtmek için ise **depend** fonksiyonu kullanılır.

.. code-block:: shell

	...
	depend() {
	  need localmount
	  after dbus
	}
	...

OpenRc Disk İşlemi
------------------

Kullandığımız servis yöneticisi openrc ise **/etc/fstab** komunundaki dosyaya bakarak diske erişim sağlamaktadır. Bundan dolayı **fstab** dosyamızı aşağıdaki gibi yapılandırmalıyız.

Fstab dosyası
-------------

Bu dosyayı doldurarak açılışta hangi disklerin bağlanacağını ayarlamalıyız. /etc/fstab dosyasını aşağıdakine uygun olarak doldurun.


.. code-block:: shell

	# <fs>                  <mountpoint>    <type>          <opts>          <dump/pass>
	/dev/sda1       /boot   vfat    defaults,rw     0       1
	/dev/sda2       /       ext4    defaults,rw     0       1



.. raw:: pdf

   PageBreak



Qemu Kullanımı
++++++++++++++

.. image:: /_static/images/0-qemu.png
  	:width: 100

Qemu Nedir?
-----------

Açık kaynaklı sanallaştırma aracıdır. 

Kaynak dosyalarından kurulum için;

.. code-block:: shell

	git clone https://gitlab.com/qemu-project/qemu.git
	cd qemu
	./configure
	make
	sudo make install
	
	
Sisteme Kurulum
---------------

.. code-block:: shell

	sudo apt update
	sudo apt install qemu-system-x86  qemu-utils

* 30GB bir disk oluşturup etahta.iso dosyamızı 2GB ramdan oluşan bir makina çalıştıralım.
	
.. code-block:: shell

	qemu-img create disk.img 30G #30GB disk oluşturuldu.
	qemu-system-x86_64 --enable-kvm -hda disk.img -m 2G -cdrom etahta.iso 

* Oluşturulan sanal disk ve 2GB ram ile açma.
	
.. code-block:: shell

	qemu-system-x86_64 --enable-kvm -hda disk.img -m 2G #sadece disk ile çalıştırılıyor

* Sistemi etahta.iso dosyamızı 2GB ramdan oluşan bir makina olarak çalıştıralım.
	
.. code-block:: shell
	
	qemu-system-x86_64 -m 2G -cdrom etahta.iso          #sadece iso doayası ile çalıştırma

Sistem Hızlandırılması
----------------------

**--enable-kvm** eğer sistem disk ile çalıştırıldığında bu parametre eklenmezse yavaş çalışacaktır.

Boot Menu Açma
--------------

Sistemin diskten mi imajdan mı başlayacağını başlangıçta belilemek için boot menu gelmesini istersek aşağıdaki gibi komut satırına seçenek eklemeliyiz.
	
.. code-block:: shell
	
	qemu-system-x86_64 --enable-kvm -cdrom distro.iso -hda disk.img -m 4G -boot menu=on  

Uefi kurulum için:
------------------

sudo apt-get install ovmf

qemu-system-x86_64 --enable-kvm -bios /usr/share/ovmf/OVMF.fd -cdrom distro.iso -hda disk.img -m 4G -boot menu=on   

qemu Host Erişimi:
------------------

kendi ipsi:10.0.2.15 

ana bilgisayar 10.0.0.2 olarak ayarlıyor.

vmlinuz ve initrd
-----------------
Daha sonra da qemu kullanarak test edelim.

.. code-block:: shell

	qemu-system-x86_64 --enable-kvm -kernel /boot/vmlinuz-5.17 -initrd /home/deneme/initrd.img -append "quiet" -m 512m

qemu Terminal Yönlendirmesi
----------------------------

.. code-block:: shell
	
	qemu-system-x86_64 --enable-kvm -kernel vmlinuz -initrd initrd.img -m 3G -serial stdio -append "console=ttyS0"

Diskteki Sistemin Açılışını Terminale Yönlendirme
-------------------------------------------------

.. code-block:: shell
	
	qemu-system-x86_64 -nographic -kernel boot/vmlinuz -hda disk.img -append console=ttyS0

Kaynak:
| https://www.ubuntubuzz.com/2021/04/how-to-boot-uefi-on-qemu.html  

.. raw:: pdf

   PageBreak

Live Sistem Oluşturma
+++++++++++++++++++++

Canlı sistem oluşturma veya ram üzerinden çalışan sistem hazırlamak için SquashFS dosya sisteminde dağıtım sıkıştırılmalıdır. Bu bağlamda SquashFS dosya sistemi ve sıkıştıma nasıl yapılır bu dokümanda anlatılmaktadır.

SquashFS Nedir?
---------------

SquashFS, Linux işletim sistemlerinde sıkıştırılmış bir dosya sistemidir. Bu dosya sistemi, sıkıştırma algoritması kullanarak dosyaları sıkıştırır ve ardından salt okunur bir dosya sistemine dönüştürür. SquashFS, özellikle gömülü sistemlerde ve Linux dağıtımlarında kullanılan bir dosya sistemidir.

SquashFS Oluşturma
------------------

.. code-block:: shell

	#mksquashfs input_source output/filesystem.squashfs -comp xz -wildcards 
	mksquashfs initrd $HOME/distro/filesystem.squashfs -comp xz -wildcards


Cdrom Erişimi
-------------

/dev/sr0, Linux işletim sistemlerinde bir CD veya DVD sürücüsünü temsil eden bir aygıt dosyasıdır. Bu dosya, CD veya DVD sürücüsünün fiziksel cihazını temsil eder ve kullanıcıların bu sürücüye erişmesini sağlar.

/dev/sr0 dosyası, Linux'un aygıt dosyası sistemi olan /dev dizininde bulunur. Bu dosya, Linux çekirdeği tarafından otomatik olarak oluşturulur ve sürücüye bağlı olarak farklı bir isim alabilir. Örneğin, ikinci bir CD veya DVD sürücüsü /dev/sr1 olarak adlandırılabilir.

Bu aygıt dosyası, kullanıcıların CD veya DVD'leri okumasına veya yazmasına olanak tanır. Örneğin, bir CD'yi okumak için aşağıdaki gibi bir komut kullanabilirsiniz:

.. code-block:: shell

	$ cat /dev/sr0

Cdrom Bağlama
-------------

.. code-block:: shell

	mkdir cdrom
	mount /dev/sr0 /cdrom

Bu işlem sonucunda cdrom bağlanmış olacaktır. iso dosyamızın içerisine erişebiliriz.

squashfs Dosyasını Bulma
--------------------------

Genellikle isoların içine squashfs dosyası oluşturlur. Bu sayede live yükleme yapılabilir. 
Örneğin /live/filesystem.squashfs benim imajlarımda böyle konumlandırıyorum.

squashfs Bağlama
----------------

squashfs dosyasını bağlamadan önce loop modülünün yüklü olması gerekmektedir. eğer yüklemediyseniz

.. code-block:: shell

	modprobe loop #loop modülü yüklenir.
	mkdir canli
	mount -t squashfs -o loop cdrom/live/filesystem.squashfs /canli

squashfs Sistemine Geçiş
------------------------

Yukarıdaki adımlarda squashfs doayamızı /canli adında dizine bağlamış olduk. Bu aşamadan sonra sistemimizin bir kopyası olan squashfs canlıdan erişebilir veya sistemi buradan başlatabiliriz.

squashfs dosya sistemimize bağlanmak için;

.. code-block:: shell

	chroot canli /bin/bash

Bu işlemin yerine exec komutuyla bağlanırsak sistemimiz id "1" değeriyle çalıştıracaktır. 
Eğer sistemin bu dosya sistemiyle açılmasını istiyorsak exec ile çalıştırıp id=1 olmasına dikkat etmeliyiz.

.. raw:: pdf

   PageBreak

kmod Nedir?
+++++++++++

Linux çekirdeği ile donanım arasındaki haberleşmeyi sağlayan kod parçalarıdır. Bu kod parçalarını kernele eklediğimizde kerneli tekrardan derlememiz gerekmektedir. Her eklenen koddan sonra kernel derleme, kod çıkarttığımzda kernel derlemek ciddi bir iş yükü ve karmaşa yaratacaktır.

Bu sorunların çözümü için modul vardır. moduller kernele istediğimiz kod parpalarını ekleme ya da çıkartma yapabiliyoruz. Bu işlemleri yaparken kenel derleme işlemi yapmamıza gerek yok.

Kernele modul yükleme kaldırma için kmod aracı kullanılmaktadır. kmaod aracı;

	.. code-block:: shell

		ln -s kmod /bin/depmod
		ln -s kmod /bin/insmod
		ln -s kmod /initrd/bin/lsmod
		ln -s kmod /bin/modinfo
		ln -s kmod /bin/modprobe
		ln -s kmod /bin/rmmod

şeklinde sembolik bağlarla yeni araçlar oluşturulmuştur.

**lsmod :** yüklü modulleri listeler

**insmod:** tek bir modul yükler

**rmmod:** tek bir modul siler

**modinfo:** modul hakkında bilgi alınır 

**modprobe:** insmod komutunun aynısı fakat daha işlevseldir. module ait bağımlı olduğu modülleride yüklemektedir. modprobe  modülü /lib/modules/ dizini altında aramaktadır.

**depmod:** /lib/modules dizinindeki modüllerin listesini günceller. Fakat başka bir dizinde ise basedir=konum şeklinde belirtmek gerekir. konum dizininde /lib/modules/** şeklinde kalsörler olmalıdır.


Modul Yazma
-----------

hello.c dosyamız
................

	.. code-block:: shell

		#include <linux/module.h>
		#include <linux/kernel.h>
		#include <linux/init.h>
		MODULE_DESCRIPTION("Hello World examples");
		MODULE_LICENSE("GPL");
		MODULE_AUTHOR("Bayram");
		static int __init hello_init(void)
		{
		printk(KERN_INFO "Hello world!\n");
		return 0;
		}
		static void __exit hello_cleanup(void)
		{
		printk(KERN_INFO "remove module.\n");
		}
		module_init(hello_init);
		module_exit(hello_cleanup);


Makefile dosyamız
-----------------

	.. code-block:: shell

		obj-m+=my_module.o
		all:
		    make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
		clean:
		    make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

modülün derlenmesi ve eklenip kaldırılması
------------------------------------------

	.. code-block:: shell

		make

		insmod my_modul.ko // modül kernele eklendi.

		lsmod | grep my_modul //modül yüklendi mi kontrol ediliyor.

		rmmod my_modul // modül kernelden çıkartılıyor.

Not:
----
dmesg ile log kısmında eklendiğinde Hello Word yazısını ve  kaldırıldığında modul ismini görebiliriz.

.. raw:: pdf

   PageBreak


sfdisk Nedir
++++++++++++

sfdisk, Linux işletim sistemlerinde disk bölümlerini yönetmek için kullanılan bir komuttur. Disk bölümlerini oluşturmak, düzenlemek, silmek veya görüntülemek için sfdisk'i kullanabilirsiniz.



**Disk Bölümlerini Görüntüleme:**
---------------------------------

Diskinizdeki mevcut bölümleri görüntülemek için sfdisk komutunu kullanabilirsiniz. Aşağıdaki komutu kullanarak mevcut bölümleri listeleyebilirsiniz:
	
.. code-block:: shell
	
	sfdisk -l /dev/sda

**Disk Bölümleri Oluşturma:**
-----------------------------

Yeni bir disk bölümü oluşturmak için sfdisk komutunu kullanabilirsiniz. Örneğin, /dev/sda üzerinde yeni bir bölüm oluşturmak için aşağıdaki komutu kullanabilirsiniz:
	
.. code-block:: shell
	
	echo ",,L" | sfdisk /dev/sda

Bu komut, kullanılabilir tüm alanı kullanarak bir bölüm oluşturacaktır.

**Disk Bölümlerini Silme:**
---------------------------

Bir disk bölümünü silmek için sfdisk komutunu kullanabilirsiniz. Örneğin, /dev/sda üzerindeki bir bölümü silmek için aşağıdaki komutu kullanabilirsiniz:
	
.. code-block:: shell
	
	echo ",,L" | sfdisk --delete /dev/sda

Bu komut, belirtilen bölümü silecektir.

sfdisk komutunun daha fazla seçeneği ve kullanımı vardır. Daha fazla bilgi için sfdisk komutunun man sayfasını inceleyebilirsiniz:

**Disk Etiketi Belirleme**
--------------------------
	
.. code-block:: shell
	
	echo 'label: dos' | sfdisk /dev/vda #dos label
	echo 'label: gpt' | sfdisk /dev/vda #gpt label


**Bazı Örnekler**
-----------------

**Örnek1:**
-----------

.. code-block:: shell
	
	sfdisk /dev/sdf <<EOF
	 0,512
	 ,512
	 ;
	 EOF

	/dev/sdf1 0+ 511 512- 4112639+ 83 Linux
	/dev/sdf2 512 1023 512 4112640 83 Linux
	/dev/sdf3 1024 1043 20 160650 83 Linux

 
**Örnek2:**
-----------
	
.. code-block:: shell
	
	sfdisk /dev/vda << EOF
	label: dos
	label-id: 0xaaaaaaaa
	# comment:
	start=, size= 50M,  type= 7 , bootable
	start=, size= 650M, type= 27
	start=, size= 45G , type= 7
	EOF

**Örnek3:**
-----------

Bu örnekte ilk bölüm 1GB ve ikinci bölüm ise diskin geri kalan kısmıdır.
	
.. code-block:: shell
	
	echo -e "label: gpt\n,1GiB\n," | sudo sfdisk /dev/vda
	veya
	sfdisk /dev/vda << EOF
	label: gpt
	,1GiB
	,
	EOF


**Örnek4:**
-----------

	
.. code-block:: shell
	
	my.layout
	# partition table of /dev/sda
	unit: sectors

	/dev/sda1 : start=     2048, size=   497664, Id=83, bootable
	/dev/sda2 : start=   501758, size=1953021954, Id= 5
	/dev/sda3 : start=        0, size=        0, Id= 0
	/dev/sda4 : start=        0, size=        0, Id= 0
	/dev/sda5 : start=   501760, size=1953021952, Id=8e

Aynı disk bölümlemesini ve düzenini başka bir aygıta uygulamak için:

	
.. code-block:: shell
	
	sfdisk /dev/sdb < my.layout 

.. raw:: pdf

   PageBreak

strip
++++++

strip komutu, derlenmiş bir programın veya paylaşılan bir kütüphanenin dosya boyutunu küçültmek için kullanılır. Bu komut, derleme sürecinde oluşturulan fazladan semboller ve hata ayıklama bilgilerini kaldırır. Bu sayede, dosyanın boyutu azalır ve gereksiz veri miktarı azalır.

strip komutunu kullanmak için, terminalde aşağıdaki şekilde bir komut satırı kullanabilirsiniz:

.. code-block:: shell

	strip dosya_adı

Burada "dosya_adı" yerine, boyutunu küçültmek istediğiniz dosyanın adını belirtmelisiniz. Örneğin, "strip program" komutunu kullanarak "program" adlı bir dosyanın boyutunu küçültebilirsiniz.

strip komutu, genellikle Linux ve Unix tabanlı işletim sistemlerinde kullanılır. Bu komut, programların dağıtımı veya paylaşımı sırasında dosya boyutunu azaltmak için yaygın olarak kullanılır.

Bu komutun kullanımı, programların performansını artırabilir ve disk alanından tasarruf sağlayabilir. Ancak, hata ayıklama veya sembol bilgilerine ihtiyaç duyduğunuz durumlarda strip komutunu kullanmaktan kaçınmanız önemlidir.

Sonuç olarak, strip komutu, derlenmiş programların veya paylaşılan kütüphanelerin boyutunu küçültmek için kullanılan bir Linux komutudur.

.. raw:: pdf

   PageBreak


Sistem Dili Değiştirme
++++++++++++++++++++++
Dil ayarlama

Sistem dilini ayarlamak için öncelikle /etc/locale.gen dosyamızı aşağıdaki gibi düzenleyelim.

    Dil kodlarına /usr/share/i18n/locales içerisinden ulaşabilirsiniz.

    Karakter kodlamalara /usr/share/i18n/charmaps içinden ulaşabilirsiniz.

tr_TR.UTF-8 UTF-8

Not: En altta boş bir satır bulunmalıdır.

Ardından /lib64/locale dizini yoksa oluşturalım.

mkdir -p /lib64/locale/

Şimdi de çevresel değişkenlerimizi ayarlamak için /etc/profile.d/locale.sh dosyamızı düzenleyelim.

#!/bin/sh
# Language settings
export LANG="tr_TR.UTF-8"
export LC_ALL="tr_TR.UTF-8"

Not: Türkçe büyük küçük harf dönüşümü (i -> İ ve ı -> I) ascii standartına uyumsuz olduğu için LC_ALL kısmını türkçe ayarlamayı önermiyoruz. Bunun yerine C.UTF-8 veya en_US.UTF-8 olarak ayarlayabilirsiniz.

Son olarak locale-gen komutunu çalıştıralım.

locale-gen

Eğer /lib64/locale/ dizine okuma iznimiz yoksa verelim.

chmod 755 -R /lib64/locale/



**1. Yöntem**
-------------

/etc/default/locale dosyasını root olarak bir metin editörü ile açın.

- **Türkçe için :** LANG=tr_TR.UTF-8
- **İngilizce için :** LANG=en_US.UTF-8

Sistemi yeniden başlattığınızda seçtiğiniz dil aktif olacaktır.


**2. Yöntem**
-------------

/etc/profile.d/locale.sh dosyanı oluşturun içeriğini aşağıdaki gibi ayarlayın.

.. code-block:: shell

	# Language settings
	export LANG="tr_TR.UTF-8"
	export LC_ALL="tr_TR.UTF-8"

**/etc/profile.d/**  dizin erişim iznini 755 yapın.

**profile**
-----------

**/etc/profile** dosya içeriğini  aşağıdaki gibi bir betik bulunmalıdır.
 /etc/profile dosyanının içerisinde aşağıdaki betik olmalıdır. Bu betik **/etc/profile.d** içerisinde betikler varsa tüm kullanıcalr için çalıştırılmasını sağlar.

.. code-block:: shell

	if [ -d /etc/profile.d ]; then
	  for i in /etc/profile.d/*.sh; do
		if [ -r $i ]; then
		  . $i
		fi
	  done
	  unset i
	fi


**3.Yöntem**
------------

ayarlarını değiştirmek istediğimiz kullanıcı dizinideki **~/.profile** dosyasının içeriğine aşağıdaki kod satırını eklemeliyiz.

.. code-block:: shell
	
	export LANG="tr_TR.UTF-8"
	export LC_ALL="tr_TR.UTF-8"


.. raw:: pdf

   PageBreak


Kullanıcı Sistem Ayarları
+++++++++++++++++++++++++

Profile Dosyası
---------------

/etc/profile dosyası, Linux sistemlerinde kullanıcıların oturum açtıklarında çalıştırılan bir betik dosyasıdır. Bu dosya, tüm kullanıcılar için ortak kabuk ayarlarını ve ortam değişkenlerini tanımlar. Kullanıcı oturumu başlatıldığında, /etc/profile dosyası sistem genelindeki ayarları yükler ve kullanıcı oturumuna uygular. Bu dosya, kullanıcıların kabuk ortamlarını yapılandırmak ve özelleştirmek için kullanılır. Örneğin, PATH değişkenini tanımlamak veya diğer kabuk ayarlarını yapılandırmak için /etc/profile dosyası düzenlenebilir. Bu dosya, sistem genelinde tutarlı bir kabuk ortamı sağlamak için önemlidir.

.. code-block:: shell

		/etc/profile
		/etc/profile.d/*
		/etc/environment
		~/.profile, veya ~/.bash_profile veya ~/.login veya ~/.zprofile giriş kabuğunuza bağlı olarak
		~/.pam_environment
		(yalnızca terminalde çalışan kabuklar için) /etc/bash.bashrc, /etc/zshrc, ~/.bashrc, ~/.zshrc, vesaire.


 **Not:**   /etc/profile.d/ dizinine root dışında kullanıcılar erişim sağlaması için 755 yapmalısınız.
 
** profile**
------------

 /etc/profile dosyanının içerisinde aşağıdaki betik olmalıdır. Bu betik **/etc/profile.d** içerisinde betikler varsa tüm kullanıcılar için çalıştırılmasını sağlar.

.. code-block:: shell

	if [ -d /etc/profile.d ]; then
	  for i in /etc/profile.d/*.sh; do
		if [ -r $i ]; then
		  . $i
		fi
	  done
	  unset i
	fi


.. raw:: pdf

   PageBreak


Add User
++++++++

adduser ve useradd komutları, Linux işletim sisteminde kullanıcı hesapları oluşturmak için kullanılan iki farklı komuttur. Bu iki komut arasındaki temel farklar şunlardır:

1. Kullanım Kolaylığı:

    adduser, interaktif bir arayüz sağlar ve kullanıcı oluşturma işlemi sırasında bir dizi soru sorarak kullanıcı dostu bir yaklaşım sunar.
    useradd ise daha düşük seviyeli bir komuttur ve tüm parametreleri elle belirtmenizi gerektirir. Bu nedenle, kullanımı daha teknik ve karmaşıktır.

Örnek kullanım:

.. code-block:: shell

	# adduser komutuyla kullanıcı oluşturma
	sudo adduser yeni_kullanici
	# useradd komutuyla kullanıcı oluşturma
	sudo useradd -m -s /bin/bash yeni_kullanici

2. Varsayılan Davranışlar:

    adduser, varsayılan olarak kullanıcı için ev dizini oluşturur ve gerekli ayarları yapar.
    useradd ise temel bir kullanıcı hesabı oluşturur ancak ek parametreler belirtilmediği sürece ek işlemleri gerçekleştirmez.

3. Güvenlik ve Uyumluluk:

    adduser, kullanıcı oluştururken bazı güvenlik kontrolleri yapar ve sistem uyumluluğunu sağlamak için ek adımlar atar.
    useradd ise daha esnek bir yapıya sahiptir ve kullanıcı oluşturma işlemini daha özelleştirilmiş bir şekilde gerçekleştirmenize olanak tanır.

Sonuç olarak, genel olarak adduser komutu, kullanıcı dostu bir arayüz sunar ve standart kullanıcı oluşturma işlemleri için tercih edilirken, useradd komutu daha teknik detaylara hakim olan kullanıcılar tarafından tercih edilebilir. Her iki komut da kullanıcı yönetimi için önemli araçlardır ve ihtiyaca göre tercih edilmelidir.


.. raw:: pdf

   PageBreak

github
++++++

GitHub üzerinde yeni bir depo açmak oldukça basit bir işlemdir. Aşağıdaki adımları takip ederek hızlıca kendi deponuzu oluşturabilirsiniz:

- **GitHub Hesabınıza Giriş Yapın:** GitHub ana sayfasına gidin ve hesabınıza giriş yapın. Eğer bir hesabınız yoksa, öncelikle bir hesap oluşturmalısınız.

- **Yeni Depo Oluşturma:** Sağ üst köşede bulunan "+" simgesine tıklayın ve "New repository" seçeneğini seçin.

- **Depo Bilgilerini Girin:** Açılan sayfada, depo adını (repository name) ve isteğe bağlı olarak bir açıklama (description) girin. Depo özel (private) veya herkese açık (public) olarak ayarlanabilir.

- **İlk Dosyayı Oluşturma:** "Initialize this repository with a README" seçeneğini işaretleyerek, depo oluşturulduğunda otomatik olarak bir README dosyası oluşturabilirsiniz.

- **Depoyu Oluşturma:** "Create repository" butonuna tıklayarak deponuzu oluşturun.

Artık GitHub üzerinde yeni bir deponuz var! Bu depoyu yerel bilgisayarınıza klonlayarak projelerinizi yönetmeye başlayabilirsiniz. Örneğin, terminalde şu komutu kullanarak deponuzu klonlayabilirsiniz:


.. code-block:: shell

	git clone https://github.com/kullaniciadi/depoadi.git

Bu adımları takip ederek GitHub üzerinde kolayca depo açabilirsiniz.

.. raw:: pdf

   PageBreak

Terminal Yönlendirmesi
++++++++++++++++++++++

Linux ortamında masaütündeyken sudo ile script çalıştırıldığında masaütünü açtığımız kullanıcının tespiti aşağıdaki kodla yapılabilir.

.. code-block:: shell

	#!/bin/bash

	#Detect the name of the display in use
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"

	#Detect the user using such display
	user=$(who | grep '('$display')' | awk '{print $1}')

	#Detect the id of the user
	uid=$(id -u $user)

	echo $user $uid
	
	
.. raw:: pdf

   PageBreak

cgroup
++++++

Cgroup, Linux çekirdeği tarafından sağlanan bir özellik olup, sistem kaynaklarını gruplar halinde yönetmemize olanak tanır. Bu, özellikle sunucu ortamlarında ve konteyner teknolojilerinde oldukça faydalıdır. Cgroup sayesinde, belirli bir grup süreç için kaynakları sınırlayabilir, izleyebilir ve yönetebilirsiniz.

Cgroup'un Temel Özellikleri
---------------------------

- **Kaynak Sınırlama:** Cgroup, belirli bir grup süreç için CPU, bellek, disk ve ağ gibi kaynakları sınırlamanıza olanak tanır. Örneğin, bir uygulamanın bellek kullanımını 512 MB ile sınırlamak istiyorsanız, cgroup kullanarak bunu kolayca yapabilirsiniz.

- **Kaynak İzleme:** Cgroup, süreçlerin kaynak kullanımını izlemek için de kullanılabilir. Bu, sistem yöneticilerinin hangi süreçlerin ne kadar kaynak kullandığını görmesine yardımcı olur.

- **Hiyerarşi:** Cgroup, hiyerarşik bir yapıya sahiptir. Yani, bir cgroup içinde başka cgroup'lar oluşturabilirsiniz. Bu, daha karmaşık kaynak yönetimi senaryoları için faydalıdır.

Cgroup Kullanımı
----------------

Cgroup kullanmaya başlamak için öncelikle sisteminizde cgroup'un etkin olduğundan emin olmalısınız. Genellikle modern Linux dağıtımlarında cgroup varsayılan olarak aktiftir. Cgroup ile çalışmak için aşağıdaki adımları izleyebilirsiniz:
1. Cgroup Oluşturma

Öncelikle, bir cgroup oluşturmalısınız. Bunun için terminalde aşağıdaki komutu kullanabilirsiniz:


.. code-block:: shell

	sudo mkdir /sys/fs/cgroup/memory/my_cgroup

Bu komut, "my_cgroup" adında bir bellek cgroup'u oluşturur.

2. Kaynak Sınırlama

Oluşturduğunuz cgroup'a bellek sınırı eklemek için şu komutu kullanabilirsiniz:


.. code-block:: shell

	echo 512M | sudo tee /sys/fs/cgroup/memory/my_cgroup/memory.limit_in_bytes

Bu komut, "my_cgroup" için bellek sınırını 512 MB olarak ayarlar.

3. Süreç Ekleme

Artık bir cgroup oluşturduğunuza göre, bu cgroup'a süreç ekleyebilirsiniz. Bunun için, eklemek istediğiniz sürecin PID'sini öğrenin ve aşağıdaki komutu kullanın:


.. code-block:: shell

	echo <PID> | sudo tee /sys/fs/cgroup/memory/my_cgroup/cgroup.procs

Burada <PID> kısmını eklemek istediğiniz sürecin PID'si ile değiştirin.

4. İzleme

Cgroup'un kaynak kullanımını izlemek için aşağıdaki komutu kullanabilirsiniz:


.. code-block:: shell

	cat /sys/fs/cgroup/memory/my_cgroup/memory.usage_in_bytes

Bu komut, "my_cgroup" içindeki süreçlerin toplam bellek kullanımını gösterir.

Cgroup'un Avantajları
---------------------

- **Kaynak Yönetimi:** Sunucu kaynaklarını daha verimli bir şekilde yönetmenizi sağlar.
- **Performans İyileştirmesi:** Süreçlerin kaynak kullanımını sınırlayarak sistemin genel performansını artırabilir.
- **Güvenlik:** Belirli süreçlerin diğer süreçlerin kaynaklarına erişimini kısıtlayarak güvenliği artırır.

Sonuç
-----

Cgroup, Linux sistemlerinde kaynak yönetimi için güçlü bir araçtır. Özellikle sunucu ve konteyner ortamlarında, kaynakları etkili bir şekilde yönetmek ve izlemek için vazgeçilmezdir. Yukarıda bahsedilen adımları takip ederek, cgroup ile kaynak yönetimi yapmaya başlayabilirsiniz. Unutmayın, her zaman sistem kaynaklarınızı izlemek ve gerektiğinde ayarlamalar yapmak önemlidir.
	
	
.. raw:: pdf

   PageBreak

user-dirs
+++++++++

user-dirs, Linux işletim sistemlerinde kullanıcıların özel klasörlerini içeren bir sistemdir. Bu klasörler genellikle "Masaüstü", "Belgeler", "İndirilenler" gibi isimlerle tanımlanır ve kullanıcıların dosyalarını düzenlemelerini kolaylaştırır.

user-dirs klasörünü kaldırmak için aşağıdaki adımları izleyebilirsiniz:

    Terminali açın ve aşağıdaki komutu girin:

.. code-block:: shell

	nano ~/.config/user-dirs.dirs

    Bu komut, user-dirs.dirs dosyasını açacaktır. Bu dosya, kullanıcı klasörlerinin yolunu ve adını içerir.

    Dosyayı düzenlemek için, kaldırmak istediğiniz klasörün satırını bulun ve "#" işaretiyle başlayan bir yorum satırı yapın. Örneğin, "Masaüstü" klasörünü kaldırmak istiyorsanız, satırı aşağıdaki gibi düzenleyin:

.. code-block:: shell

	#XDG_DESKTOP_DIR="$HOME/Masaüstü"

    Dosyayı kaydetmek ve kapatmak için "Ctrl + X" tuşlarına basın, ardından "Y" tuşuna basın ve Enter tuşuna basın.

    Değişikliklerin etkili olması için oturumu kapatıp tekrar açın veya aşağıdaki komutu girin:

.. code-block:: shell

	xdg-user-dirs-update

Bu adımları takip ederek user-dirs klasörünü Linux sisteminizden kaldırabilirsiniz. Ancak, dikkatli olun ve yanlışlıkla önemli dosyaları silmemeye özen gösterin.

Yeni oluşturulacak kullanıcılarda oluşturulmamasını istiyorsak **/etc/skel/.config/user-dirs.dirs** dosyasını silmeliyiz.


.. raw:: pdf

   PageBreak

ld(linker)
++++++++++

ld (linker) komutu, Linux sistemlerinde derlenmiş nesne dosyalarını birleştirmek ve yürütülebilir dosyalar veya paylaşılan kütüphaneler oluşturmak için kullanılan bir araçtır. Bu komut, derleyicinin çıktısı olan nesne dosyalarını alır ve bunları birleştirerek çalıştırılabilir bir dosya oluşturur.

ld komutu, bir programın bağımlılıklarını çözmek ve gerekli kütüphaneleri eklemek için kullanılır. Bu sayede program, çalıştırıldığında gereken tüm kütüphanelere erişebilir ve doğru şekilde çalışabilir.

Aşağıda basit bir örnek verilmiştir:

.. code-block:: shell

	gcc -c main.c -o main.o
	gcc -c helper.c -o helper.o
	ld main.o helper.o -o program

Bu örnekte, gcc komutuyla main.c ve helper.c dosyaları derlenir ve nesne dosyaları (main.o ve helper.o) oluşturulur. Ardından, ld komutuyla bu nesne dosyaları birleştirilerek program adında bir çalıştırılabilir dosya oluşturulur.

ld komutu, Linux sistemlerinde programların derlenmesi ve çalıştırılması sürecinde önemli bir rol oynar ve programların doğru şekilde çalışmasını sağlar.

Linker Türleri
--------------

Linker, bir programın derlenmiş obje dosyalarını birleştirerek çalıştırılabilir bir dosya oluşturan bir yazılımdır. Linker, programın farklı bölümlerini bir araya getirir, sembol tablolarını oluşturur ve bağımlılıkları çözer.

Linux'ta kullanılan yaygın linker çeşitleri şunlardır:

    GNU Linker (ld): GNU Projesi'nin bir parçası olan GNU Linker, Linux sistemlerinde en yaygın olarak kullanılan linker'dır. ld, derlenmiş obje dosyalarını birleştirir ve çalıştırılabilir bir dosya oluşturur. Ayrıca, dinamik bağlantı için gerekli olan dinamik kütüphaneleri de yönetir.

    Gold Linker: Gold Linker, GNU Linker'a alternatif olarak geliştirilmiş bir linker'dır. Gold Linker, daha hızlı bağlama süreleri sunar ve büyük projelerde performans avantajı sağlar.

    LLD (LLVM Linker): LLD, LLVM projesinin bir parçası olan modern bir linker'dır. LLD, hızlı bağlama süreleri ve düşük bellek tüketimi ile bilinir. Ayrıca, birden fazla platformda çalışabilme özelliğine sahiptir.

Bu linker çeşitleri, Linux sistemlerinde programların birleştirilmesi ve çalıştırılabilir dosyaların oluşturulması için kullanılır. Her bir linker'ın kendine özgü avantajları ve kullanım senaryoları vardır. Projenizin gereksinimlerine ve tercihlerinize bağlı olarak uygun olanı seçebilirsiniz.


.. code-block:: shell

	# GNU Linker (ld) kullanım örneği
	ld -o program program.o

	# Gold Linker kullanım örneği
	gold -o program program.o

	# LLD (LLVM Linker) kullanım örneği
	lld -o program program.o

.. raw:: pdf

   PageBreak

.. _yardimcikonular:
Yardımcı Konular
================

Hakkımda
========
.. toctree::
	:glob:

.. image:: /_static/images/about.svg
	:width: 200
  		
Açık kaynaklı sistemleri tanıma ve geliştirme yapma projesi.


.. raw:: pdf

   PageBreak

İletişim
========
.. toctree::
	:glob:


Linux, açık kaynaklı bir işletim sistemi olarak birçok avantaj sunmaktadır. Öncelikle, güvenlik açısından oldukça sağlam bir yapıya sahiptir. Virüs ve kötü amaçlı yazılımlara karşı daha az hassas olması, özellikle sunucu ve kritik sistemlerde tercih edilmesini sağlar. Ayrıca, Linux'un özelleştirilebilir yapısı sayesinde kullanıcılar, ihtiyaçlarına uygun bir sistem oluşturabilirler.

Performans açısından da Linux, hafif dağıtımları ile eski donanımlarda bile yüksek verimlilik sunar. Geliştiriciler için sunduğu güçlü komut satırı araçları ve paket yöneticileri, yazılım geliştirme süreçlerini hızlandırır.

Linux topluluğu oldukça aktiftir ve kullanıcılar, forumlar ve belgeler aracılığıyla destek alabilirler. Tüm bu nedenlerle, Linux kullanmak, hem bireysel hem de kurumsal düzeyde birçok avantaj sağlamaktadır.


.. image:: /_static/images/contact.svg
	:width: 150
  		
https://github.com/kendiliuxunuyap
E-Posta : kendiliuxunuyap@gmail.com


.. raw:: pdf

   PageBreak

.. toctree::
	:glob:


Kendi Linux'unu Yap
===================

Bu dokumanda dağıtım hazırlamak için temel işlemler anlatılmaktadır.

Bu kitap, açık kaynak ve özgür yazılıma gönül vermiş kişilerin, Türkçe kaynak bulamama sıkıntısına bir çözüm olarak hayata geçirilmiş bir projedir. Açık kaynak dünyasında kendi dağıtımlarını yapmak isteyen kişilere bir rehber olacak şekilde hazırlanmıştır. Bu dokümanda anlatılan sıralamaya göre işlemleri uyguladığınızda kendi sisteminiz derleyip iso halinde son kullanıcını kullanabileceği gibi bir sistem ortaya çıkartabilirsiniz. 


Kaynak ve dokümanlarımız yansılarımız:

* Bu sitedeki bilgilerin pdf kitap hali için `tıklayınız. <https://kendilinuxunuyap.github.io/kitap/>`_


.. image:: /_static/logo.png
  :width: 1000
  :align: center



.. raw:: pdf

   PageBreak

Yazar
+++++
- Bayram KARAHAN

Dizgi
+++++
- Bayram KARAHAN
- Celalettin AKARSU


Paket Derleme
+++++++++++++
- Bayram KARAHAN
- Celalettin AKARSU


Kod Testi
+++++++++
- Bayram KARAHAN
- Celalettin AKARSU
- Emrah KÖSETÜRK

.. raw:: pdf

   PageBreak

Ön Söz
======

Bu kitap, açık kaynak ve özgür yazılıma gönül vermiş kişilerin, Türkçe kaynak bulamama sıkıntısına bir çözüm olarak hayata geçirilmiş bir projedir. Açık kaynak dünyasında kendi dağıtımlarını yapmak isteyen kişilere bir rehber olacak şekilde hazırlanmıştır. Bu dokümanda anlatılan sıralamaya göre işlemleri uyguladığınızda kendi sisteminiz derleyip iso halinde son kullanıcını kullanabileceği gibi bir sistem ortaya çıkartabilirsiniz. 


.. raw:: pdf

   PageBreak

İçindekiler
===========

.. list-table::
   :widths: 60 10

   * - 1- :ref:`giris`
     - 3
   * - 2- :ref:`onhazirlik`
     - 3
   * - 3- :ref:`derlemearaclari`
     - 8
   * - 4- :ref:`paketderleme`
     - 13
   * - 5- :ref:`paketsistemi`
     - 98
   * - 6- :ref:`isohazirlama`
     - 113
   * - 7- :ref:`sistemkurulumu`
     - 117
   * - 8- :ref:`xderleme`
     - 126
   * - 9- :ref:`yardimcikonular`
     - 131
 
.. raw:: pdf

   PageBreak

.. footer:: ###Page###

.. toctree::

**Temel Kavramlar**
+++++++++++++++++++

**Linux Nedir?**
----------------

Linux; Linux çekirdeğine dayalı, açık kaynak kodlu, Unix benzeri bir işletim sistemi ailesidir. GNU Genel Kamu Lisansı versiyon 2 ile sunulan ve Linux Vakfı çatısı altında geliştirilen bir özgür yazılım projesidir. Linux, “Linus Torvalds” tarafından geliştirilmeye başlanmıştır. Günümüzde bilgisayarlarda, akıllı cihazların ve internet altyapısında kullanılan cihazların işletim sistemlerinde yaygın olarak kullanılmaktadır.[https://tr.wikipedia.org/wiki/Linux]

**Açık Kaynak Nedir?**
----------------------

Açık kaynak terimi, yazılım geliştirme sürecinde kaynak kodunun genel olarak erişilebilir ve değiştirilebilir olduğu bir modeli ifade eder. Bu yaklaşım, yazılımın geliştirilmesine katkıda bulunanların kodu incelemesine, değiştirmesine ve geliştirmesine olanak tanır. Açık kaynaklı yazılımlar genellikle topluluklar tarafından desteklenir ve geliştirilir, bu da geniş bir bilgi ve deneyim havuzundan faydalanmayı sağlar. Bu model, yazılımın sürekli olarak gelişmesine ve iyileştirilmesine olanak tanırken, kullanıcılar için de esneklik ve özgürlük sağlar.

**Dağıtım Nedir ve Türleri**
----------------------------

GNU, uygulamalar, kütüphaneler, geliştirici araçları, hatta oyunların bir arada olduğu Unix benzeri bir işletim sistemidir.
Linux çekirdeği kullanılarak oluşturulan işletim sistemlerini tanımlamak için yaygın olarak Linux ismi kullanılmaktadır. Mesela, Linux çekirdeği ve GNU araçları bir araya getirilerek oluşturulan bir işletim sistemi “GNU/Linux dağıtımı” olarak adlandırılır, ancak konuşma dilinde kısaca (yanlış da olsa) Linux olarak ifade edilmektedir.

1. Clonezilla İmaj
2. Dağıtım Editleme
3. Paket sistemi yazma

**Yazılım Bağımlılığı**
-----------------------

İşletim sistemi tekeli, belirli bir işletim sisteminin pazar payının diğer işletim sistemlerine göre belirgin şekilde yüksek olması durumunu ifade eder. Bu durumda, belirli bir işletim sistemi diğer alternatiflerine kıyasla daha yaygın olarak kullanılır ve genellikle bu işletim sisteminin sahibi veya geliştiricisi, pazarda belirleyici bir konuma sahip olabilir.

Linux gibi açık kaynaklı işletim sistemleri, işletim sistemi tekeline alternatif oluşturabilir ve çeşitliliği artırabilir. Bu sayede kullanıcılar farklı seçeneklere sahip olabilir ve rekabet teşvik edilebilir.

İşletim sistemi tekeli kavramı, pazar analizlerinde, rekabet politikalarında ve tüketici hakları açısından önemli bir konudur. Bu bağlamda, işletim sistemi çeşitliliği ve rekabetin desteklenmesi, kullanıcıların daha iyi hizmet ve ürün seçeneklerine erişimini sağlayabilir.


.. raw:: pdf

   PageBreak


.. _giris:
Temel Kavramlar
===============

Dağıtım Ortamın Hazırlanması
++++++++++++++++++++++++++++

Dağıtım hazırlarken sistemin derlenmesi ve gerekli ayarlamaların yapılabilmesi için bir linux dağıtımı gerekmektedir. Tecrübeli olduğunuz bir dağıtımı seçmeniz uygun olur. Fakat seçilecek dağıtım Gentoo olması daha hızlı ve sorunsuz sürece devam etmenizi sağlayacaktır.
Bu dağıtımı hazırlaken Debian dağıtımı kullanıldı. Bazı paketler için, özellikle bağımlılık sorunları yaşanan paketler için ise Gentoo kullanıldı.

Bir dağıtım hazırlamak için çeşitli paketler lazımdır. Bu paketler;

- **debootstrap	:** Dağıtım hazırlarken kullanılacak chroot uygulaması bu paket ile gelmektedir. chroot ayrı bir konu başlığıyla anlatılacaktır.
- **make	:** Paket derlemek için uygulama
- **squashfs-tools:** Hazırladığımız sistemi sıkıştırılmış dosya halinde sistem görüntüsü oluşturmamızı sağlayan paket.
- **gcc		:** c kodlarımızı derleyeceğimiz derleme aracı.
- **wget	:** tarball vb. dosyaları indirmek için kullanılacak uygulama.
- **unzip	:** Sıkıştırmış zip dosyalarını açmak için uygulama
- **xz-utils	:** Yüksek sıkıştırma yapan sıkıştırma uygulaması
- **tar		:** tar uzantılı dosya sıkıştırma ve açma içiçn kullanılan uygulama.
- **zstd	:** Yüksek sıkıştırma yapan sıkıştırma uygulaması 
- **grub-mkrescue :** Hazırladığımız iso dizinini iso yapmak için kullanılan uygulama
- **qemu-system-x86:** iso dosyalarını test etmek ve kullanmak için sanal makina emülatörü uygulaması.


.. code-block:: shell

	sudo apt update
	sudo apt install debootstrap xorriso mtools make squashfs-tools gcc wget unzip xz-utils tar zstd -y


Paket kurulumu yapıldıktan sonra dağıtımı hazırlayacağımız yeri(hedefi) belirlemeliyiz. Bu dokümanda sistem için kurulum dizini $HOME/distro/rootfs olarak kullanacağız.

**$HOME:** Bu ifade linux ortamında açık olan kullanıncının ev dizinini ifade eder. Örneğin sisteme giriş yapan kullanıcı  **ogrenci** adinda bir kullanıcı olsun. **$HOME** ifadesi **/home/ogrenci** konumunu ifade eder.


.. raw:: pdf

   PageBreak


Minimal Dağıtım Oluşturma
++++++++++++++++++++++++++

Bu minimal dağıtımı oluşturmamızın amacı bu dokümanda anlatılacak dağıtım hazırlama aşamalarını anlaşılması içindir.
Dağıtım oluşturmak için kernel ve busybox dosyalarımızın olması yeterlidir. **busybox** dosyasının nasıl elde edileceği busybox bölümünde anlatılmıştır. **kernel** ise mevcut sistemimin kernelini kullanacağız. kernel **/boot/vmlinux** konumundan alabiliriz.

Bu sistemi hazırlarken **chroot** ve **busybox** komutlarını  kullanarak sistemi hazırlayacağız ve test edeceğiz. **chroot** ve **busybox** kullanımı için dokümandanki ilgili konu başlığına bakınız.

Sistemimiz için aşağıdaki gibi bir yapı oluşturmalıyız. 

1. $HOME/distro/rootfs/busybox
2. $HOME/distro/rootfs/init
3. $HOME/distro/iso/boot/initrd.img
4. $HOME/distro/iso/boot/vmlinuz
5. $HOME/distro/iso/boot/grub/grub.cfg
6. $HOME/distro/distro.iso

Linux sisteminin açılabilmesi için 3., 4. ve 5. sıradaki gösterilen konumdaki dosyaların olması yeterli. 
Bu üç dosyayı yukarıda belirtildiği gibi dizin konumlarına koyduktan sonra, **grub-mkrescue $HOME/distro/iso/ -o $HOME/distro/distro.iso**  komutuyla **distro.iso** dosyası elde ederiz. Artık 6. sırada belirtilen iso dosyamız boot edebilen şekilde hazırlanmış olur. 

Sistemi oluşturan **3., 4. ve 5.** sırada belirtlen dosyalarımız görevi şunlardır. 

**$HOME/distro/iso/boot/initrd.img:** 
Dosyasını sistemin açılış sürecinden ön işlemleri yapmak ve gerçek sisteme geçiş sürecini yöneten bir dosyadır. Yazın devamında nasıl hazırlanacağı anlatılacaktır. 

**$HOME/distro/iso/boot/vmlinuz:** 
Dosyamız kernelimiz oluyor. Ben kullandığım debian sisteminin mevcut kernelini kullandım. İstenirse kernel derlenebilir. 

**$HOME/distro/iso/boot/grub/grub.cfg:** 
Dosyamız ise initrd.img ve vmlinuz dosyalarının grub yazılımının nereden bulacağını gösteren yapılandırma dosyasıdır.

Bir linux sisteminin açılış süreci şu şekilde olmaktadır.
 
1. **Bilgisayara Güç Verilmesi**
2. **Bios İşlemleri Yapılıyor(POST)**
3. **LILO/GRUB Yazılımı Yükleniyor(grub.cfg dosyası okunuyor ve vmlinuz ve initrd.img devreye giriyor)**
4. **vmlinuz initrd.img sistemini belleğe yüklüyor**
5. **initrd.img içindeki init dosyasındaki işlem sürecine göre sistem işlemlere devam ediyor**

Yazının devamında sistem için gerekli olan 3 temel dosyanın hazırlanması ve iso yapılma süreci anlatılacaktır.
Şimdi sırasıyla dosya konumlarına uygun şekilde dizin ve dosyalarımızı oluşturalım.

**Dizinlerin Oluşturulması**
----------------------------

Sitemimizi istediğimiz bir yerde terminal açarak aşağıdaki komutları sırasıyla çalıştıralım.
Komutları kopyala yapıştır yapabilirsiniz.

.. code-block:: shell

	mkdir $HOME/distro
	mkdir $HOME/distro/rootfs
	mkdir $HOME/distro/iso
	mkdir $HOME/distro/iso/boot
	mkdir $HOME/distro/iso/boot/grub

**$HOME/distro/rootfs/busybox**
-------------------------------

busybox aşağıdaki komutlarla  **$HOME/distro/rootfs/busybox** konumuna kopyalanak sistemimiz için hazır hale getirilir.
Bu sistemi debian ortamında hazırlamaktayız. İsterseniz static busybox derleyebilirsiniz. busybox konusu altında anlatılmaktadır.
isterseniz derlemeden mevcut sistemin altında bulunan static busybox kullanabiliriz. 
Eğer yoksa **sudo apt install busybox-static -y** komutuyla debian sistemimize static busybox yükleyebiliriz. Ben debian üzerine yüklediğim busybox'ı kullanacağım. Eğer sistemde yoksa **sudo apt install busybox-static -y** komutuyla yükleyiniz.

.. code-block:: shell
	
	cd $HOME/distro/rootfs
	cp /bin/busybox $HOME/distro/rootfs/busybox	
	ldd ./busybox	 
	özdevimli bir çalıştırılabilir değil

"özdevimli bir çalıştırılabilir değil" dinamik değil diyor yani static kısacası bir bağımlılığı yok demektir.
Eğer bağımlılığı olsaydı bağımlı olduğu dosyalarıda konumlarına göre kopyalamamız gerekmekteydi.

**$HOME/distro/rootfs/init**
----------------------------

Sistem açılırken iki dosyayı arar kernel ve initrd.img dosyası. Bu dosyaları grub.cfg dosyası içinde verilen konumlarına göre arar. Bu dosyaları bulduktan sonra initrd.img dosyasını açar ve içinde init dosyasını arar. init dosyasındaki komutları sırasıyla çalıştırır. 

**$HOME/distro/rootfs/** konumuna **init** text dosyası oluşturulur(nano, gedit vb.).
Aşağıdaki içerik oluşturulan **init** dosyası içine eklenir.

.. code-block:: shell

	#!busybox ash
	PATH=/bin
	/busybox mkdir /bin
	/busybox --install -s /bin
	/busybox ash

**busybox** içerisinde linux ortamında kullanılan hemen hemen tüm komutların yerine kullanalılabilir. Bulunduğumuz ortamda **busybox** dışında hiçbir komutun olmadığını düşünün. Mesela **cp** komutuna ihtiyacınız var bu durumda **busybox cp** yazarak kullanılabilirsiniz. Tüm temel komutları busyboxtan türetmek için  **/busybox --install -s /bin** komutunu kullanabilirsiniz.

Buradaki komutları sırayla anlatırsak;

1. #!busybox ash: ash bir kabuk veya terminal programıdır.
2. PATH=/bin: komutlar çalışırken nerede arayacağı belirtiliyor
3. /busybox mkdir /bin: **busybox mkdir**  yardımıyla **/bin** dizini oluşturuluyor.
4. /busybox --install -s /bin: **/bin** dizinine tüm komutları kısa yol oluşturur.
5. /busybox ash: ash terminalini çalıştırır. Bash yerine alternatif.

**kernel**, **initrd.img** dosyasını bellek üzerine açıp **init** dosyasını çalıştırınca sırasıyla numaralandırılarak anlattığımız işlemler yapılacak ve çalışabilecek ortam hazırlanacaktır. Daha sonra ash terminali çalışarak kullanıcının kullanımına hazır hale gelecektir.
	
init çalıştırılabilir yapılır.

.. code-block:: shell

	chmod +x init #komutu ile çalıştırılır yapılır.

**$HOME/distro/iso/boot/initrd.img**
------------------------------------

initrd.img dosyası için aşağıdaki komutlar çalıştırılır

.. code-block:: shell

	cd $HOME/distro/rootfs
	find ./ | cpio -H newc -o >$HOME/distro/iso/boot/initrd.img	

Oluşturulan **initrd.img** dosyası çalışacak tty açacak(konsol elde etmiş olacağız). 
Aslında bu işlemi yapan şey **busybox** ikili dosyası.

**$HOME/distro/iso/boot/vmlinuz**
---------------------------------

.. code-block:: shell

	cp /boot/vmlinuz* $HOME/distro/iso/boot/vmlinuz  #sistemde kullandığım kerneli kopyaladım istenirde kernel derlenebilir.


**$HOME/distro/iso/boot/grub/grub.cfg**
---------------------------------------

**$HOME/distro/iso/boot/grub/** konumuna **grub.cfg** dosyası oluşturun.
Aşağıdaki komutları **grub.cfg**  dosyası içine eklenir.

.. code-block:: shell

	linux /boot/vmlinuz
	initrd /boot/initrd.img
	boot

**$HOME/distro/distro.iso**
---------------------------

iso oluşturulur.

.. code-block:: shell

	grub-mkrescue $HOME/distro/iso/ -o $HOME/distro/distro.iso # komutuyla iso doyamız oluşturulur.

Artık sistemi açabilen ve tty açıp bize suna bir yapı oluşturduk.


**Dağıtımın Test Edilmesi**
---------------------------
 
Hazırlanan   **$HOME/distro/distro.iso** dağıtımımız qemu veya virtualbox ile test edilebilir.

Aşağıdaki komutla qemu ile isomuzu çalıştırıp test edebiliriz. qemu ile ilgili bilgi için ek konular bölümünden erişebilirsiniz.

.. code-block:: shell

	qemu-system-x86_64 -cdrom $HOME/distro/distro.iso -m 1G

Eğer hatasız yapılmışsa sistem açılacak ve tty açacaktır. Birçok komutu çalışan bir dağıtım oluşturmuş olduk. Ekran görüntüsü aşağıda görülmektedir. 

.. image:: /_static/images/minimal-iso.png
  :width: 400



Dokümanın devamında kendi sistemimizi hazırlarken bu bölümde anlatılan yapıya benzer adımları yapacağız. 
Minimal sistemden farkı **busybox** ile oluşturduğumuz ikili dosyalarımızı(temel komutlar) kendimiz derleyeceğiz.
Minimal sistemde static busybox kullandık. 

Static dosyalarda dosyanın çalışması için kütüphanelerin hepsi kendi içerisine gömümülü(dahil) bir şekilde gelir.
Avantajı hiçbir kütüphaneye ihtiyaç duymaz. Devevantajı ise boyutları yüksek olur. İstisnalar olsada genel olarak static tercih edilmemektedir. Static olduğunda iso boyutlarımız olması gerekenden 5-10 kat fazla olabilmektedir.

.. raw:: pdf

   PageBreak


.. _onhazirlik:
Ön Hazırlık
===========

Derleme araçları
^^^^^^^^^^^^^^^^
Linux dağıtımlarında kaynak kodlar bir derleme aracı yardımı ile derlenir.
Bu araçlar sayesinde kaynak kod tek tek komut yazmaya gerek kalmadan derlenebilir. Ayrıca hataları yakalaması da daha kolay olur.

Bu bölümde başlıca kullanılan derleme araçlarından söz edilecektir. Bu araçlar şunlardır;

- make
- cmake
- meson
- python


.. raw:: pdf

   PageBreak

make
++++

make, yazılım geliştirme süreçlerinde sıkça kullanılan bir araçtır. Özellikle C ve C++ gibi dillerde projelerin derlenmesi ve yönetilmesi için kullanılır.

Aşağıdaki C kodumuzu(merhaba.c dosyası) make ile nasıl derleyeceğimizi anlatalım;

.. code-block:: C
	
	#include <stdio.h>
	int main(){
	    puts("Merhaba");
	    return 0;
	}


Makefile Nedir?
---------------

Makefile, make aracının nasıl çalışacağını belirten bir dosyadır. İçinde hedefler, bağımlılıklar ve komutlar bulunur. Örneğin, bir C programını derlemek için aşağıdaki gibi basit bir Makefile oluşturabilirsiniz. Makefile ve merhaba.c dosyası aynı konumda olmalıdır.

.. code-block:: shell

	CC=gcc
	CFLAGS=-I.

	all: program

	program: merhaba.o 
		$(CC) -o program merhaba.o

	merhaba.o: merhaba.c
		$(CC) -c merhaba.c $(CFLAGS)

	clean:
		rm -f *.o program


merhaba dosyasından **program** adında bir ikili dosya oluşturmak için aşağıdaki komutlar Makefile ve merhaba.c dosyasının olduğu konumda çalıştırılır.

.. code-block:: shell

	make
	make install

Genellikle Makefile dosyası olmaz. Onun yerine **configure.ac** dosyası olur. **configure.ac** dosyasından **Makefile** dosyası elde etmek için, öncelikle **autoconf** ve **automake** araçlarının sisteminizde kurulu olması gerekmektedir. 

**autoreconf -fvi** komutu çalıştırılıarak configure dosyamızı üretir.Bu araçlar, yapılandırma dosyalarınızı işleyerek gerekli **Makefile** dosyalarını oluşturmanıza yardımcı olur.


**configure** komutunun devamında **--prefix** dışında başka parametreleride olabilir. Bu paramatreleri "Read.me" dosyası içerisinde bulunabilir veya **configure --help** komutu kaynak kodların olduğu konumda kullanılarak görülebilir.


Bu kaynak kod aşağıdaki gibi derlenir:

.. code-block:: shell

	$ autoreconf -fvi
	$ ./configure --prefix=/usr
	$ make
	$ make install 
	
.. raw:: pdf

   PageBreak

cmake
+++++

CMake, projelerin derlenmesi ve yapılandırılması için kullanılan bir araçtır. Bir paketi CMake ile derlemek için genellikle aşağıdaki adımları izleriz:

    İlk olarak, projenin kök dizininde bir CMakeLists.txt dosyası oluşturun.
    Ardından, CMake komutunu kullanarak projeyi yapılandırın ve derleyin. Örneğin:

.. code-block:: shell

	mkdir build
	cd build
	cmake ..
	make

    Bu adımları takip ederek, CMake ile paketinizi başarıyla derleyebilirsiniz.

CMake'in esnekliği ve kullanım kolaylığı sayesinde paketlerin derlenmesi ve yapılandırılması oldukça kolay hale gelir.


Bu kaynak kod aşağıdaki gibi derlenir:

.. code-block:: shell

	mkdir build
	cd build
	cmake ..
	make
	make install
	
.. raw:: pdf

   PageBreak

meson
+++++

Meson, modern bir yapılandırma betik dili ve Ninja ise hızlı bir derleyici aracıdır. Bir paketi derlemek için öncelikle Meson ile yapılandırma dosyalarını oluşturmanız gerekir. Ardından, Ninja derleyici aracını kullanarak bu yapılandırmayı derleyebilirsiniz.

İlk olarak, projenizin dizinine gidin ve Meson ile yapılandırma dosyalarını oluşturun:

.. code-block:: shell

	meson setup builddir --prefix=/usr

Sonra, oluşturulan builddir dizinine geçin ve Ninja ile derlemeyi başlatın:

.. code-block:: shell

	ninja -C builddir

Bu adımları takip ederek Meson ve Ninja kullanarak paketinizi başarılı bir şekilde derleyebilirsiniz.



Bu kaynak kod aşağıdaki gibi derlenir:

.. code-block:: shell
	
	DESTDIR=/ #paketin yükleneceği konum
	meson setup builddir --prefix=/usr
	ninja -C builddir
	DESTDIR=$DESTDIR ninja -C builddir install
	
.. raw:: pdf

   PageBreak

python
++++++

Python ile paket derlemek için genellikle **setuptools** ve **distutils** gibi kütüphaneler kullanılır. Öncelikle, projenizin kök dizininde bir **setup.py** dosyası oluşturmanız gerekir. Bu dosya, paketin yapılandırmasını ve gereksinimlerini tanımlar.

Örnek bir setup.py dosyası aşağıdaki gibi olabilir:

.. code-block:: shell

	from setuptools import setup

	setup(
	    name='paket_adi',
	    version='1.0',
	    packages=['paket'],
	    install_requires=[
		'bağımlılık_paketi',
	    ],
	)

Ardından, terminalde projenizin bulunduğu dizine giderek aşağıdaki komutu çalıştırarak paketi derleyebilirsiniz:

.. code-block:: shell
	
	DESTDIR=/ #yükleme konumu
	python3 -m build
	python3 -m installer --destdir="$DESTDIR" dist/*.whl

Bu komut, paketi dist klasörüne derleyecektir. Artık paketiniz hazır ve dağıtıma uygun hale gelmiştir.

.. raw:: pdf

   PageBreak

.. _derlemearaclari:
Derleme Araçları
================

Temel Paketler
++++++++++++++

Bir önceki bölümde minimal bir sistemi **busybox** yardımıyla tasarladık. Minimal sistem tasarımımızda temel bir sistemin nasıl hazırlandığını anlatmaya çalıştık. Eğer aşamaları takip ederek yaptığımızda kendisini açabilen bir sistem olduğunu görmekteyiz. Minimal sistemde kullanılan **busybox** aslında bizim işlerimiz çok kolaylaştırdı. Şimdi ise **busybox** ile yapabileceğimiz işlemleri kısaca şöyle sıralayabiliriz.

- Temel linux komutlarının(ls, cp, mkdir vs.) yerine busybox kullanabilir.
- Çeşitli sıkıştırma formatları(zip, tar, cpio vb.) yerine busybox kullanabilir.
- İnternete bağlanabililir(udhcpc).
- Dosya indirebilir(wget, curl vb.)
- Log(raporlama) tutabilir.
- Modülleri yönetebilir(kmod, modprobe,insmod vb.)

Bu bölümde **busybox** ile yaptımız işleri yapan paketleri derleyeceğiz. **busybox** yapamadığımız bazı işlemleri(ssh vb.) yapan paketlerde olacak. Tasarlayacağımız sistemde genel olarak şunlar yapılabilecek.

- Temel linux komutları kullanılacak
- Bash kabuğu ile tty ortamı olacak
- Sıkıştırma formatları kullanılabilecek
- Modüller yönetilebilecek
- initrd oluşturabilecek
- grub kurabilecek
- Sistemi kurabilecek
- Sistemi live olarak açabilecek
- İnternete bağlanılabilecek
- ssh bağlantısı ile uzaktan yönetilebilecek
- Metin düzenleyici editör olacak

Bu yapıda bir dağıtım için aşağıdaki paketlere ihtiyacımız olacak.

.. list-table::
   :widths: 25 25 50

   * - 0- `base-file <./001-base-file.html>`_
     - 25- `elfutils <./25-elfutils.html>`_
     - 50- `popt <./50-popt.html>`_
   * - 1- `glibc <./01-glibc.html>`_
     - 26- `libselinux <./26-libselinux.html>`_
     - 51- `icu <./51-icu.html>`_
   * - 2- `readline <./02-readline.html>`_
     - 27- `tar <./27-tar.html>`_
     - 52- `iproute2 <./52-iproute2.html>`_
   * - 3- `ncurses <./03-ncurses.html>`_
     - 28- `zlib <./28-zlib.html>`_
     - 53- `net-tools <./53-net-tools.html>`_
   * - 4- `bash <./04-bash.html>`_
     - 29- `brotli <./29-brotli.html>`_
     - 54- `dhcp <./54-dhcp.html>`_
   * - 5- `openssl <./05-openssl.html>`_
     - 30- `curl <./30-curl.html>`_
     - 55- `openrc <./55-openrc.html>`_
   * - 6- `acl <./06-acl.html>`_
     - 31- `shadow <./31-shadow.html>`_
     - 56- `rsync <./56-rsync.html>`_
   * - 7- `attr <./07-attr.html>`_
     - 32- `file <./32-file.html>`_
     - 57- `kbd <./57-kbd.html>`_
   * - 8- `libcap <./08-libcap.html>`_
     - 33- `eudev <./33-eudev.html>`_
     - 58- `kernel <./58-kernel.html>`_
   * - 9-  `libpcre2 <./09-libpcre2.html>`_
     - 34- `cpio <./34-cpio.html>`_
     - 59- `dialog <./59-dialog.html>`_
   * - 10- `gmp <./10-gmp.html>`_
     - 35- `libsepol <./35-libsepol.html>`_
     - 60- `live-boot <./60-live-boot.html>`_
   * - 11- `coreutils <./11-coreutils.html>`_
     - 36- `kmod <./36-kmod.html>`_
     - 61- `live-config <./61-live-config.html>`_
   * - 12- `util-linux <./12-util-linux.html>`_
     - 37- `audit <./37-audit.html>`_
     - 62- `parted <./62-parted.html>`_
   * - 13- `grep <./13-grep.html>`_
     - 38- `libxcrypt <./38-libxcrypt.html>`_
     - 63- `busybox <./63-busybox.html>`_
   * - 14- `sed <./14-sed.html>`_
     - 39- `libnsl <./39-libnsl.html>`_
     - 64- `nano <./64-nano.html>`_
   * - 15- `mpfr <./15-mpfr.html>`_
     - 40- `libbsd <./40-libbsd.html>`_
     - 65- `grub <./65-grub.html>`_
   * - 16- `gawk <./16-gawk.html>`_
     - 41- `libtirpc <./41-libtirpc.html>`_
     - 66- `efibootmgr <./66-efibootmgr.html>`_
   * - 17- `findutils <./17-findutils.html>`_
     - 42- `e2fsprogs <./42-e2fsprogs.html>`_
     - 67- `efivar <./67-efivar.html>`_
   * - 18- `gcc <./18-gcc.html>`_
     - 43- `dostools <./43-dostools.html>`_
     - 68- `libssh <./68-libssh.html>`_
   * - 19- `libcap-ng <./19-libcap-ng.html>`_
     - 44- `initramfs-tools <./44-initramfs-tools.html>`_
     - 69- `openssh <./69-openssh.html>`_
   * - 20- `sqlite <./20-sqlite.html>`_
     - 45- `libxml2 <./45-libxml2.html>`_
     - 70- `pam <./70-pam.html>`_
   * - 21- `gzip <./21-gzip.html>`_
     - 46- `expat <./46-expat.html>`_
     - 71- 
   * - 22- `xz-utils <./22-xz-utils.html>`_
     - 47- `libmd <./47-libmd.html>`_
     - 72- 
   * - 23- `zstd <./23-zstd.html>`_
     - 48- `libaio <./48-libaio.html>`_
     - 73-    
   * - 24- `bzip2 <./24-bzip2.html>`_
     - 49- `lvm2 <./49-lvm2.html>`_
     - 74-   


Listede bulunan  **bash** paketinin sorunsuz çalışabilmesi için **readline** ve **ncurses** kütüphaneleri gerekli. **readline** ve **ncurses** kütüphanelerinin çalışabilmesi içinde **glibc** kütüphanesi gerekli. Listede bulunan tüm paketlerin bağımlılıkları eksiksizdir.
Listede bulunan paketler sırasıyla nasıl derleneceği ayrı başlıklar altında anlatılacaktır.

Paketlere başlamadan önce şu paketleri kurmanızı tavsiye ederim.

- sudo apt-get install autoconf
- sudo apt-get install automake
- sudo apt-get install autotools-dev
- sudo apt-get install make
- sudo apt-get install meson
- sudo apt-get install cmake
- sudo apt-get install ninja-build
- sudo apt-get install pkgconf
- sudo apt install patch
- sudo apt install libtool
- sudo apt install grub-pc grub-pc-bin

Paketlerin derlenmesiniz **root** yetkisiyle yapınız.


.. raw:: pdf

   PageBreak


base-file
+++++++++

Linux sistemimiz için temel ayarlamalar, dosya ve dizin yapıları olması gerekmektedir. Bu yapıyı oluşturduktan sonra sistemi bu yapının üzerine inşaa edeceğiz. Aslında linux sisteminde temel paket **glibc** paketidir. **glibc** paketinin derlenip yüklenmesinden önce temel yapının oluşturulması gerektiği için **base-file** paketi oluşturduk. 

**base-file Komutları**
-----------------------

.. code-block:: shell

	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	# açık ekran tespit ediliyor
	user=$(who | grep '('$display')' | awk '{print $1}')	#ekranı açan kullanıcı tespit ediliyor
	mkdir -p  /home/$user/distro/build 	#Derleme dizini yoksa oluşturuluyor
	mkdir -p   /home/$user/distro/rootfs  	#Sistemin oluşturlacağı dizin yoksa oluşturuluyor
	rm -rf  /home/$user/distro/build/* #içeriği temizleniyor
	cp -prfv files/*  /home/$user/distro/build/ # Ek dosyalar kopyalanıyor. Ek dosyalar aşağıda verilmiştir.
	cd  /home/$user/distro/build  #build geçiyoruz

	mkdir  -p bin dev etc home lib64 proc root run sbin sys usr var etc/bps tmp tmp/bps/kur \
	var/log  var/tmp usr/lib64/x86_64-linux-gnu usr/lib64/pkgconfig \
	usr/local/{bin,etc,games,include,lib,sbin,share,src}
	ln -s lib64 lib
	cd var&&ln -s ../run run&&cd -
	cd usr&&ln -s lib64 lib&&cd -
	cd usr/lib64/x86_64-linux-gnu&&ln -s ../pkgconfig  pkgconfig&&cd -

	bash -c "echo -e \"/bin/sh \n/bin/bash \n/bin/rbash \n/bin/dash\" >>  /home/$user/distro/build/etc/shell"
	bash -c "echo 'tmpfs /tmp tmpfs rw,nodev,nosuid 0 0' >>  /home/$user/distro/build/etc/fstab"
	bash -c "echo '127.0.0.1 basitdagitim' >>  /home/$user/distro/build/etc/hosts"
	bash -c "echo 'basitdagitim' >  /home/$user/distro/build/etc/hostname"
	bash -c "echo 'nameserver 8.8.8.8' >  /home/$user/distro/build/etc/resolv.conf"
	echo root:x:0:0:root:/root:/bin/sh >  /home/$user/distro/build/etc/passwd
	chmod 755  /home/$user/distro/build/etc/passwd
	cp -prfv  /home/$user/distro/build/*   /home/$user/distro/rootfs/
	
Yukarıdaki kodları fonksiyonel hale getirmek için aşağıdaki şablon scripti kullanacağız.

Şablon Script Yapısı
--------------------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version=""
	name=""
	depends=""
	source=""
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	# açık ekran tespit ediliyor
	user=$(who | grep '('$display')' | awk '{print $1}')	#ekranı açan kullanıcı tespit ediliyor
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
		    wget ${source}
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $BUILDDIR
	}
	setup(){		#Derleme öncesi kaynak dosyaların sisteme göre ayarlanması	}
	build(){		#Paketin derlenmesi	}
	package(){		# Derlenen dosyaları yükleme öncesi ayar ve yükleme işleminin yapılması	}
	initsetup 	# initsetup fonksiyonunu çalıştırır ve kaynak dosyayı inidirir
	setup		# setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build		# build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package		# package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

.. raw:: pdf

   PageBreak

Şablon içinde kullanılan bazı sabit bilgiler var. Bular;

- ROOTBUILDDIR=" /home/$user/distro/build": Derleme konumu.
- BUILDDIR=" /home/$user/distro/build/build-${name}-${version}": Derlenen paketin derleme konumu.
- DESTDIR=" /home/$user/distro/rootfs": Derlennen paketin yükleme konumu.
- PACKAGEDIR=$(pwd) : Derleme talimatının bulunduğu(build dosyası) konum.
- SOURCEDIR=" /home/$user/distro/build/${name}-${version}": Derlenen paketin kaynak kodlarının konumu.

Derleme konumunu uzun uzun yazmak yerine sadece $ROOTBUILDDIR ifadesi kullanılıyor. Aslında bu işleme takma ad(alias) denir. Mesela kaynak kodların olduğu konumda bir şeyler yapmak istersek $SOURCEDIR ifadesinin kullanmamız yeterli olacaktır. Bu takma adlar tüm paketlerde geçerli olacak ifadelerdir.

**base-file** script dosyasına benzer yapıda diğer paketler içinde script dosyası oluşturulacaktır. Bu sayede her aşamayı tek tek yazma gibi iş yükü olmayacak ve paket derlenirken hangi fonksiyonda(initsetup, setup vb.) sorun yaşanırsa o fonksiyon üzerinden hata ayıklama yapılacaktır.

Yapıyı Oluşturan Script
-----------------------

.. code-block:: shell

	#!/usr/bin/env bash
	version="1.0"
	name="base-file"
	depends=""
	description="sistemin temel yapısı"
	source=""
	groups="sys.base"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	
	initsetup(){
			mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
			rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
			cd $ROOTBUILDDIR #dizinine geçiyoruz
			mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $BUILDDIR
	}
	setup(){	cp -prfv $PACKAGEDIR/files/* $BUILDDIR/	
			}
	build(){			echo ""	
			}
	package(){
			mkdir  -p bin dev etc home lib64 proc root run sbin sys usr var etc/bps tmp tmp/bps/kur \
			var/log  var/tmp usr/lib64/x86_64-linux-gnu usr/lib64/pkgconfig \
			usr/local/{bin,etc,games,include,lib,sbin,share,src}
			ln -s lib64 lib
			cd var&&ln -s ../run run&&cd -
			cd usr&&ln -s lib64 lib&&cd -
			cd usr/lib64/x86_64-linux-gnu&&ln -s ../pkgconfig  pkgconfig&&cd -
			bash -c "echo -e \"/bin/sh \n/bin/bash \n/bin/rbash \n/bin/dash\" >> $BUILDDIR/etc/shell"
			bash -c "echo 'tmpfs /tmp tmpfs rw,nodev,nosuid 0 0' >> $BUILDDIR/etc/fstab"
			bash -c "echo '127.0.0.1 kly' >> $BUILDDIR/etc/hosts"
			bash -c "echo 'kly' > $BUILDDIR/etc/hostname"
			bash -c "echo 'nameserver 8.8.8.8' > $BUILDDIR/etc/resolv.conf"
			echo root:x:0:0:root:/root:/bin/sh > $BUILDDIR/etc/passwd
			chmod 755 $BUILDDIR/etc/passwd
			cp -prfv $BUILDDIR/*  $DESTDIR/
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

.. raw:: pdf

   PageBreak
   	
Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/base-file/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **base-file** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız. 

Yukarı verilen script kodlarını **build** adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra **build** scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları **base-file** dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build


Paket Derleme Yöntemi
---------------------

**base-file** paketleri ilk paketler olmasından dolayı detaylıca anlatıldı. Bu paketten sonraki paketlerde **şablon script** dosyası yapında verilecektir. Script dosya altında ise ek dosyalar varsa **files.tar** şeklinde link olacaktır. Her paket için istediğiniz bir konumda bir dizin oluşturunuz. **files.tar** dosyasını oluşturulan dizin içinde açınız. Test amaçlı derleme yaptığım paketler ve **base-file** için yaptığımız dizin yapısı aşağıda gösterilmiştir.

.. image:: /_static/images/base-file-0.png
  	:width: 600


Derleme scripti için **build** dosyası oluşturup içine yapıştırın ve kaydedin. 
**build**  dosyasının bulunduğu dizininde terminali açarak aşağıdaki gibi çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build

.. raw:: pdf

   PageBreak


glibc
+++++

**glibc** linux dağıtımlarında bütün uygulamaların çalışmasını sağlayan en temel C kütüphanesidir. **glibc** dışında diğer C standart kütüphaneler şunlardır: Bionic libc, dietlibc, EGLIBC, klibc, musl, Newlib ve uClibc. **glibc** en çok tercih edilen ve uygulama uyumluluğu bulunduğu için bu dokümanda glibc üzerinden anlatım yapılacaktıdır. **glibc** listemizde derleyeceğimiz tüm paketlerin çalışması için temel kütüphanedir. Bundan dolayı ilk olarak derleyeceğiz pakettir.

glibc Script Dosyası
--------------------

Debian ortamında bu paketin derlenmesi için;
**sudo apt install make bison gawk diffutils gcc gettext grep perl sed texinfo libtool** komutuyla paketin kurulması gerekmektedir.

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
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
		    wget ${source}
		    for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $BUILDDIR
	}

	setup()	{
			cp -prvf $PACKAGEDIR/files $BUILDDIR/            
			echo "slibdir=/lib64" >> configparms
			echo "rtlddir=/lib64" >> configparms
			$SOURCEDIR/configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --enable-bind-now \
			--enable-multi-arch --enable-stack-protector=strong --enable-stackguard-randomization --disable-crypt --disable-profile --disable-werror --enable-static-pie --enable-static-nss--disable-nscd \
			--host=x86_64-pc-linux-gnu --libdir=/lib64 --libexecdir=/lib64/glibc
	}
	build(){
		  	make -j5 #-C $DESTDIR all
	}
	package(){
			mkdir -p ${DESTDIR}/lib64
			cd $DESTDIR
			ln -s lib64 lib
			cd $BUILDDIR
			make install DESTDIR=$DESTDIR

			mkdir -p ${DESTDIR}/etc/ld.so.conf.d/ ${DESTDIR}/etc/sysconf.d/ ${DESTDIR}/bin
			install $BUILDDIR/files/ld.so.conf ${DESTDIR}/etc/ld.so.conf
			install $BUILDDIR/files/usr-support.conf ${DESTDIR}/etc/ld.so.conf.d/
			install $BUILDDIR/files/x86_64-linux-gnu.conf ${DESTDIR}/etc/ld.so.conf.d/
			
			rm -f ${DESTDIR}/etc/ld.so.cache	# remove ld.so.cache file
			install $BUILDDIR/files/glibc.sysconf ${DESTDIR}/etc/sysconf.d/glibc	# install sysconf trigger
			install $BUILDDIR/files/locale-gen ${DESTDIR}/bin/locale-gen 	# install extra tools
			install $BUILDDIR/files/revdep-rebuild ${DESTDIR}/bin/revdep-rebuild
			
			install $BUILDDIR/files/tr_TR ${DESTDIR}/usr/share/i18n/locales/tr_TR # replace buggy turkish format with better one
			# remove unused languages
			for l in ku hy ; do
		            rm -rf ${DESTDIR}/usr/lib/locale/${i}_*
		            rm -rf ${DESTDIR}/usr/share/locale/${i}_*
		            rm -rf ${DESTDIR}/usr/share/i18n/locales/${i}_*
			done
			sed -i "s|#!/bin/bash|#!/bin/sh|g" ${DESTDIR}/usr/bin/ldd	# fix ldd shebang
	   		cd ${DESTDIR}/lib64/ &&mkdir -p x86_64-linux-gnu&&cd x86_64-linux-gnu
	   		   
		         while read -rd '' file; do
		           ln -s $file $(basename "$file")
	   		done< <(find "../"  -maxdepth 1 -type f -iname "*" -print0)
			${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/glibc/files.tar>`_ tar dosyasını indirdikten sonra **glibc** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız. 

Yukarı verilen script kodlarını **build** adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra **build** scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları **glibc** dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build

.. raw:: pdf

   PageBreak

Test Etme
---------

glibc kütüphanemizi **$HOME/distro/rootfs** komununa yüklendi. Şimdi bu kütüphanenin çalışıp çalışmadığını test edelim. Aşağıdaki c kodumuzu derleyelim ve **$HOME/distro/rootfs** konumuna kopyalayalım. **$HOME/** (ev dizinimiz) konumuna dosyamızı oluşturup aşağıdaki kodu içine yazalım.

.. code-block:: shell

	#include<stdio.h>
	void main(){
	puts("Merhaba Dünya");
	}

Program Derleme
................

.. code-block:: shell
	
	cd $HOME
	gcc -o merhaba merhaba.c #merhaba.c dosyası derlenir.

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

Derlemede **glibc** kütüphanesinin derlemesine benzer bir yol izlenecektir. **glibc** temel kütüphane olması ve ilk derlediğimiz paket olduğu için detaylıca anlatılmıştır. Diğer paketlerimizde de **glibc** için paylaşılan script dosyası gibi dosyalar hazırlayıp derlenecektir.

.. raw:: pdf

   PageBreak



readline 
+++++++++++

libreadline, Linux işletim sistemi için geliştirilmiş bir kütüphanedir. Bu kütüphane, kullanıcıların komut satırında girdi almasını ve düzenlemesini sağlar. Bir programcı olarak, libreadline'i kullanarak kullanıcı girdilerini okuyabilir, düzenleyebilir ve işleyebilirsiniz.

Derleme
-------

Debian ortamında bu paketin derlenmesi için;
**sudo apt install libreadline-dev** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell

	#!/usr/bin/env bash
	version="8.2"
	name="readline"
	depends="glibc"
	description="readline kütüphanesi"
	source="https://ftp.gnu.org/pub/gnu/readline/${name}-${version}.tar.gz"
	groups="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	
	setup(){
		cp -prvf $PACKAGEDIR/files $SOURCEDIR/
		./configure --prefix=/usr \
			--libdir=/usr/lib64
	}

	build(){
		make SHLIB_LIBS="-L/tools/lib -lncursesw"
	}

	package(){
		make SHLIB_LIBS="-L/tools/lib -lncursesw" DESTDIR="$DESTDIR" install pkgconfigdir="/usr/lib64/pkgconfig"
		
		install -Dm644 $SOURCEDIR/files/inputrc "$DESTDIR"/etc/inputrc
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/readline/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **readline** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.

Paket adında(readline) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
Program Yazma
-------------

Altta görülen **readline**  kütüphanesini kullanarak terminalde kullanıcıdan mesaj alan ve mesajı ekrana yazan programı hazırladık.
$HOME(ev dizinimiz) dizinine merhaba.c dosyası oluşturup aşağıdaki kodları ekleyelim.

.. code-block:: shell

	# merhaba.c doayası
	#include<stdio.h>
	#include<readline/readline.h>
	void main()
	{
	char* msg=readline("Adını Yaz:");
	puts(msg);
	}

Program Derleme
---------------

.. code-block:: shell

	cd $HOME
	gcc -o merhaba merhaba.c -lreadline
	cp merhaba $HOME/distro/rootfs/merhaba

Program Test Etme
-----------------

.. code-block:: shell

	sudo chroot $HOME/distro/rootfs /merhaba

Program hatasız çalışıyorsa **readline** kütüphanemiz hatasız derlenmiş olacaktır.

.. raw:: pdf

   PageBreak


ncurses
+++++++

ncurses, Linux işletim sistemi için bir programlama kütüphanesidir. Bu kütüphane, terminal tabanlı kullanıcı arayüzleri oluşturmak için kullanılır. ncurses, terminal ekranını kontrol etmek, metin tabanlı menüler oluşturmak, renkleri ve stil özelliklerini ayarlamak gibi işlevlere sahiptir.

ncurses, kullanıcıya metin tabanlı bir arayüz sağlar ve terminal penceresinde çeşitli işlemler gerçekleştirmek için kullanılabilir. Örneğin, bir metin düzenleyici, dosya tarayıcısı veya metin tabanlı bir oyun gibi uygulamalar ncurses kullanarak geliştirilebilir.

Derleme
-------

Debian ortamında bu paketin derlenmesi için;
**sudo apt install libncurses-dev** komutuyla paketin kurulması gerekmektedir.


.. code-block:: shell
	
	#!/usr/bin/env bash
	version="6.4"
	so_ver="6"
	name="ncurses"
	depends="glibc"
	description="ncurses kütüphanesi"
	source="https://ftp.gnu.org/pub/gnu/ncurses/${name}-${version}.tar.gz"
	groups="sys.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
			./configure --prefix=/usr --libdir=/lib64 --with-shared --disable-tic-depends --with-versioned-syms  --enable-widec --with-cxx-binding \
			--with-cxx-shared --enable-pc-files --mandir=/usr/share/man --with-manpage-format=normal --with-xterm-kbs=del --with-pkg-config-libdir=/usr/lib64/pkgconfig
	}
	build(){
		 make -j5 #-C $DESTDIR all 
	}
	package(){
		make install DESTDIR=$DESTDIR
		cd $DESTDIR/lib64
		ln -s libncursesw.so.6 libtinfow.so.6
		ln -s libncursesw.so.6 libtinfo.so.6
		ln -s libncursesw.so.6 libncurses.so.6
	    	
	    	# make sure that anything linking against it links against libncurses.so instead
	    	for lib in ncurses ncurses++ form panel menu; do
			if [ ! -f "$DESTDIR/usr/lib64/pkgconfig/${lib}.pc" ]; then
			    ln -sv ${lib}w.pc "$DESTDIR/usr/lib64/pkgconfig/${lib}.pc"
			fi
	    	done
	    	
	    	 # make sure that anything linking against it links against libncursesw.so instead
		for lib in tic tinfo tinfow ticw; do 
			if [ ! -f "$DESTDIR/usr/lib64/pkgconfig/${lib}.pc" ]; then
				    ln -sv ncursesw.pc "$DESTDIR/usr/lib64/pkgconfig/${lib}.pc"
			fi
		done

		# legacy binary support
	    	for lib in libncursesw libncurses libtinfo libpanelw libformw libmenuw ; do
		ln -sv ${lib}.so.${so_ver} ${lib}.so.5
	    	done
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(ncurses) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak



bash
++++

Bash, Linux ve diğer Unix tabanlı işletim sistemlerinde kullanılan bir kabuk programlama dilidir. Kullanıcıların komutlar vererek işletim sistemini yönetmelerine olanak tanır. Bash, kullanıcıların işlemleri otomatikleştirmesine ve betik dosyaları oluşturmasına olanak tanır. Özellikle sistem yöneticileri ve geliştiriciler arasında yaygın olarak kullanılan güçlü bir araçtır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="5.2.21"
	name="bash"
	depends="glibc,readline,ncurses"
	description="GNU/Linux dağıtımında ön tanımlı kabuk"
	source="https://ftp.gnu.org/pub/gnu/bash/${name}-${version}.tar.gz"
	groups="app.shell"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()
	{
        ./configure --prefix=/usr \
			--libdir=/usr/lib64 \
			--bindir=/bin \
			--with-curses \
			--enable-readline \
			--without-bash-malloc
	}
	build()
	{
		 make -j5 #-C $DESTDIR all 
	}
	package()
	{
		make install DESTDIR=$DESTDIR
		cd $DESTDIR/bin
		ln -s bash sh
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(bash) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




openssl
+++++++

OpenSSL, açık kaynaklı bir kriptografik kütüphanedir ve SSL/TLS protokollerini uygulamak, şifreleme, dijital sertifikalar oluşturma ve doğrulama gibi işlemleri gerçekleştirmek için yaygın olarak tercih edilir. coreutils için gerekli olan paket.

Derleme
--------

Debian ortamında bu paketin derlenmesi için; **sudo apt install perl** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="3.2.0"
	name="openssl"
	depends="glibc,zlib"
	description="openssl"
	source="https://www.openssl.org/source/${name}-${version}.tar.gz"
	groups="dev.libs"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
			mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
			rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
			cd $ROOTBUILDDIR #dizinine geçiyoruz
			wget ${source}
			dowloadfile=$(ls|head -1)
			filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
			if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
			director=$(find ./* -maxdepth 0 -type d)
			directorname=$(basename ${director})
			if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
			mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		    cp -prfv $PACKAGEDIR/files/ $SOURCEDIR
		    wget -O $SOURCEDIR/files/cacert.pem https://curl.haxx.se/ca/cacert.pem
		    patch -Np1 -i $SOURCEDIR/files/ca-dir.patch
		    ./config --prefix=/usr  --openssldir=/etc/ssl --libdir=/usr/lib64 shared linux-x86_64
	}
	build(){
		    make depend
		    make -j5 #-C $DESTDIR all
	}
	package(){
		    mkdir -p "${DESTDIR}/etc/ssl/" "${DESTDIR}/sbin/"
		    install $SOURCEDIR/files/update-certdata "${DESTDIR}/sbin/update-certdata"
		    install $SOURCEDIR/files/cacert.pem "${DESTDIR}/etc/ssl/cert.pem"
		    make DESTDIR="${DESTDIR}" install_sw install_ssldirs install_man_docs  $jobs
		    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/openssl/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **openssl** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız. Oluşturuluna dizinde yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




acl
+++

ACL (Access Control List), dosya sistemlerinde veya ağ cihazlarında erişim kontrolünü yönetmek için kullanılan bir mekanizmadır. ACL'ler, belirli kullanıcıların veya kullanıcı gruplarının belirli dosya veya kaynaklara erişim düzeylerini tanımlamak için kullanılır. Bu, dosyalara veya kaynaklara erişim izinlerini hassas bir şekilde kontrol etmeyi sağlar. Örneğin, bir dosyaya sadece belirli kullanıcıların yazma izni vermek için ACL'ler kullanılabilir. Bu şekilde, güvenlik ve erişim kontrolü daha ayrıntılı bir şekilde yapılabilmektedir.coreutils için gerekli olan paket.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;
**sudo apt install libattr1-dev** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="acl"
	version="2.3.1"
	description="The acl package contains utilities to administer Access Control Lists"
	source="https://download.savannah.nongnu.org/releases/acl/acl-$version.tar.xz"
	depends="attr"
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
	    ./configure --prefix=/usr --libdir=/usr/lib64
	}
	build(){
	     make -j5 #-C $DESTDIR all
	}
	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(acl) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




attr
++++

coreutils için gerekli olan paket.

attr, dosya özniteliklerini ayarlamak veya görüntülemek için kullanılan bir komuttur. Bu komut, dosya veya dizinlerin özelliklerini (izinler, sahiplik, erişim zamanları vb.) yönetmek için kullanılır. Örneğin, bir dosyanın izinlerini değiştirmek veya bir dosyanın sahibini görmek için attr komutunu kullanabilirsiniz.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;
**sudo apt install libattr1-dev** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="attr"
	version="2.5.1"
	description="The attr package contains utilities to administer the extended attributes on filesystem objects."
	source="https://mirror.rabisu.com/savannah-nongnu/attr/attr-${version}.tar.gz"
	depends=""
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	
	setup(){
	    ./configure --prefix=/usr \
		--sysconfdir=/etc \
		--libdir=/usr/lib64
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(attr) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





libcap
++++++

libcap paketi, Linux işletim sistemlerinde kullanıcı ve grup yetkilendirmelerini yönetmek için kullanılan bir kütüphanedir. Bu kütüphane, sistem kaynaklarına erişim kontrolü sağlamak amacıyla çeşitli yetki seviyeleri tanımlamaktadır. coreutils için gerekli olan paket.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="2.69"
	name="libcap"
	depends="glibc,acl,openssl"
	description="shell ve network copy"
	source="https://mirrors.edge.kernel.org/pub/linux/libs/security/linux-privs/libcap2/${name}-${version}.tar.xz"
	groups="net.misc"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	_common_make_options=(
	  CGO_CPPFLAGS="$CPPFLAGS"
	  CGO_CFLAGS="$CFLAGS"
	  CGO_CXXFLAGS="$CXXFLAGS"
	  CGO_LDFLAGS="$LDFLAGS"
	  CGO_REQUIRED="1"
	  GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
	  GO_BUILD_FLAGS="-ldflags '-compressdwarf=false -linkmode=external'"
	)
	setup(){ echo ""   
	}
	build(){
        make "${_common_make_options[@]}" SUDO="" prefix=/usr KERNEL_HEADERS=include lib=lib64 sbindir=bin RAISE_SETFCAP=no  DYNAMIC=yes
	}
	package(){
		make "${_common_make_options[@]}" DESTDIR="$DESTDIR" RAISE_SETFCAP=no prefix=/usr lib=lib64 sbindir=bin install
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libcap) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




libpcre2
++++++++

libpcre2 paketi, Perl Compatible Regular Expressions (PCRE) kütüphanesinin ikinci versiyonunu temsil eder ve düzenli ifadelerle çalışmak için kullanılan bir araçtır. Bu kütüphane, özellikle metin işleme ve arama işlemlerinde yaygın olarak kullanılmaktadır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="10.40"
	name="libpcre2"
	description="Perl-compatible regular expression library"
	source="https://github.com/PCRE2Project/pcre2/releases/download/pcre2-${version}/pcre2-${version}.tar.gz"
	depends="readline"
	group="dev.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()
	{
	    ./configure --prefix=/usr \
	    --enable-shared \
	    --enable-static \
		--enable-pcre2-16 \
		--enable-pcre2-32 \
		--enable-jit \
		--enable-pcre2test-libreadline 
	}
	build()
	{
		make -j5 #-C $DESTDIR all
	}
	package()
	{
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libpcre2) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




gmp
++++

GMP (GNU Multiple Precision Arithmetic Library) paketi, yüksek hassasiyetli aritmetik işlemler gerçekleştirmek için kullanılan bir kütüphanedir. Özellikle büyük sayılarla çalışırken, standart veri türlerinin yetersiz kaldığı durumlarda devreye girer.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="6.3.0"
	name="gmp"
	depends="glibc"
	description="Library for arbitrary-precision arithmetic on different type of numbers"
	source="https://gmplib.org/download/gmp/gmp-${version}.tar.xz"
	groups="dev.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()
	{
		./configure --prefix=/usr --libdir=/usr/lib64 \
			$(use_opt cxx --enable-cxx --disable-cxx) \
		--enable-fat
	}
	build()
	{
		make -j5 #-C $DESTDIR all
	}
	package()
	{
		make install DESTDIR=${DESTDIR}
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(gmp) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





coreutils
+++++++++

coreutils, Linux işletim sistemlerinde temel dosya yönetimi ve sistem komutlarını içeren bir paket olup, kullanıcıların dosyalarla etkileşimde bulunmalarını sağlayan temel araçları sunar. Bu paket, dosya kopyalama, taşıma, silme, listeleme gibi işlemleri gerçekleştiren komutları içerir. Örneğin, cp, mv, rm, ls gibi komutlar coreutils paketinin bir parçasıdır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="coreutils"
	version="9.5"
	description="The basic file, shell and text manipulation utilities of the GNU operating system"
	source="https://ftp.gnu.org/gnu/coreutils/coreutils-$version.tar.xz"
	depends="acl,attr,gmp,libcap,openssl"
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	export CFLAGS="-static-libgcc -static-libstdc++ -fPIC"
	setup(){
    	export FORCE_UNSAFE_CONFIGURE=1 
    	./configure --prefix=/usr \
        --libdir=/usr/lib64 \
        --libexecdir=/usr/libexec \
        --enable-largefile \
        --enable-single-binary=symlinks \
        --enable-no-install-program=groups,hostname,kill,uptime \
        --without-selinux --without-openssl
	}

	build(){
	    make -j5 #-C $DESTDIR all
	}
	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(coreutils) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




util-linux
++++++++++

Util-linux paketi, Linux tabanlı sistemlerde kritik öneme sahip bir bileşendir. Bu paket, dosya sistemleri, disk yönetimi, kullanıcı yönetimi ve sistem izleme gibi çeşitli işlevleri yerine getiren bir dizi araç içerir. Örneğin, mount ve umount komutları, dosya sistemlerini bağlamak ve ayırmak için kullanılırken, fdisk ve parted disk bölümlerini yönetmek için kullanılır. Ayrıca, login, su, ve passwd gibi komutlar, kullanıcı kimlik doğrulama ve yönetimi için önemli işlevler sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="util-linux"
	version="2.40.1"
	description="Various useful Linux utilities"
	source="https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v${version%.*}/util-linux-${version}.tar.gz"
	depends=""
	buildepend="libcap-ng,python,eudev,sqlite,eudev,cryptsetup,libxcrypt"
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
 		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		cp -prvf $PACKAGEDIR/files/ $SOURCEDIR/
		patch -Np1 -i $SOURCEDIR/files/0001-util-linux-tmpfiles.patch
		./configure --prefix=/usr --libdir=/usr/lib64 --bindir=/usr/bin \
				--enable-shared --enable-static --disable-su --disable-runuser --disable-chfn-chsh --disable-login \
				--disable-sulogin --disable-makeinstall-chown --disable-makeinstall-setuid --disable-pylibmount \
				--disable-raw --without-systemd --without-libuser --without-utempter --without-econf --with-python --with-udev
	}
	build(){
		make -j5 #-C $DESTDIR all
	}
	package(){
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
	
	
Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/util-linux/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **util-linux** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(util-linux) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




grep
++++

Grep, Linux işletim sistemlerinde metin arama işlemleri için kullanılan güçlü bir komut satırı aracıdır. Kullanıcıların belirli bir desen veya kelimeyi dosyalar içinde hızlı bir şekilde bulmalarını sağlar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="grep"
	version="3.11"
	description="GNU regular expression matcher"
	source="https://ftp.gnu.org/gnu/grep/grep-$version.tar.xz"
	depends="libpcre2"
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		./configure --prefix=/usr --libdir=/usr/lib64/
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(grep) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




sed
+++

sed, "stream editor" anlamına gelen bir Linux komut satırı aracıdır. Temel görevi, metin akışını düzenlemek ve dönüştürmektir. sed, dosyalar üzerinde arama, değiştirme, silme ve ekleme işlemleri yaparak metin verilerini işlemek için kullanılır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="sed"
	version="4.9"
	description="Super-useful stream editor"
	source="https://ftp.gnu.org/gnu/sed/sed-$version.tar.xz"
	depends="acl"
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	
	setup(){
	   ./configure --prefix=/usr \
		--libdir=/usr/lib64/
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(sed) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




mpfr
++++

MPFR (Multiple Precision Floating-Point Reliable) paketi, yüksek hassasiyetli kayan nokta hesaplamaları yapmak için kullanılan bir kütüphanedir. Bu kütüphane, matematiksel hesaplamalarda doğruluğu artırmak amacıyla tasarlanmıştır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="4.2.0"
	name="mpfr"
	depends="glibc,gmp"
	description="multiple precision floating-point computation"
	source="https://ftp.gnu.org/gnu/mpfr/mpfr-${version}.tar.xz"
	groups="dev.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()
	{
		./configure --prefix=/usr \
		--libdir=/usr/lib64 \
		--enable-shared \
		--enable-static \
		--disable-maintainer-mode \
		--enable-thread-safe
	}
	build()
	{
		make
	}
	package()
	{
		make install DESTDIR=${DESTDIR}
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(mpfr) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





gawk
++++

gawk, GNU projesinin bir parçası olarak geliştirilmiş bir metin işleme aracıdır. "awk" dilinin GNU versiyonu olan gawk, özellikle metin dosyalarındaki verileri analiz etmek, düzenlemek ve raporlamak için kullanılır. gawk, satır ve sütun bazında veri işleme yeteneği ile kullanıcıların karmaşık metin manipülasyonları gerçekleştirmesine olanak tanır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="gawk"
	version="5.3.0"
	description="GNU awk pattern-matching language"
	source="https://ftp.gnu.org/gnu/gawk/gawk-$version.tar.xz"
	depends="mpfr,readline"
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
	    ./configure --prefix=/usr \
		--libdir=/usr/lib64/ \
		--sysconfdir=/etc \
		--without-libsigsegv
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(gawk) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




findutils
+++++++++

Finutils paketi, Linux işletim sistemlerinde dosya ve dizin yönetimi ile ilgili çeşitli işlevler sunan bir araç setidir. Bu paket, özellikle dosya sistemleri üzerinde işlem yaparken kullanıcıların işini kolaylaştırmayı hedefler.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="findutils"
	version="4.9.0"
	description="GNU utilities for finding files"
	source="https://ftp.gnu.org/gnu/findutils/findutils-$version.tar.xz"
	depends=""
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
	   	./configure --prefix=/usr --libdir=/usr/lib64/
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(findutils) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




gcc
+++

gcc paketi, GNU Compiler Collection (GCC) ile birlikte gelen ve C, C++ gibi dillerde yazılmış programların çalışması için gerekli olan temel kütüphaneleri içeren bir bileşendir. Bu paket, derleyici tarafından üretilen kodun çalışabilmesi için gerekli olan düşük seviyeli işlevleri sağlar. Debian ortamında derlemek için **sudo apt install libmpc-dev libmpfr-dev libgmp-dev libisl-dev** komutuyla paketleri kurmalıyız.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="13.1.0"
	name="gcc"
	depends="glibc,gmp,mpfr,libmpc,zlib,libisl"
	builddepend="flex,elfutils,curl,linux-headers"
	description="DOS filesystem tools - provides mkdosfs, mkfs.msdos, mkfs.vfat"
	source="https://ftp.gnu.org/gnu/gcc/gcc-${version}/gcc-${version}.tar.xz"
	groups="sys.devel"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $BUILDDIR
	}


	export CFLAGS="-O2 -s"
	export CXXFLAGS="-O2 -s"
	unset LDFLAGS
	setup()
	{
	case $(uname -m) in
	  x86_64)
	    sed -i.orig '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64
	  ;;
	esac

	    cd $SOURCEDIR
	    mkdir build
	    cd build
	    ../configure --prefix=/usr --libexecdir=/usr/libexec --mandir=/usr/share/man --infodir=/usr/share/info --enable-languages=c,c++ --with-linker-hash-style=gnu \
	    --with-system-zlib --enable-__cxa_atexit --enable-cet=auto --enable-checking=release --enable-clocale=gnu --enable-default-pie \
	      --enable-default-ssp --enable-gnu-indirect-function--enable-gnu-unique-object --enable-libstdcxx-backtrace --enable-link-serialization=1 --enable-linker-build-id --enable-lto --disable-multilib --enable-plugin \
	      --enable-shared --enable-threads=posix --disable-libssp --disable-libstdcxx-pch --disable-werror --without-zstd --disable-nls	--libdir=/usr/lib64 --target=x86_64-pc-linux-gnu 	
	}
	build(){
		cd $SOURCEDIR/build
		make
	}
	package(){
		cd $SOURCEDIR/build
		make install DESTDIR=${DESTDIR}
	    	
		mkdir -p ${DESTDIR}/usr/lib64/
		ln -s gcc ${DESTDIR}/usr/bin/cc
		ln -s g++ ${DESTDIR}/usr/bin/cxx
		cd $DESTDIR
		while read -rd '' file; do
		case "$(file -Sib "$file")" in
		    application/x-executable\;*)     # Binaries
		        strip "$file" ;;
		    application/x-pie-executable\;*) # Relocatable binaries
		        strip "$file" ;;
		esac
	    done< <(find "./" -type f -iname "*" -print0)	 
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(gcc) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




libcap-ng
+++++++++

libcap-ng paketi, Linux işletim sistemlerinde yetki yönetimi ve güvenlik uygulamaları için kullanılan bir kütüphanedir. Bu kütüphane, kullanıcıların ve süreçlerin sahip olduğu yetkileri daha esnek bir şekilde yönetmelerine olanak tanır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="0.8.3"
	name="libcap-ng"
	depends="glibc,acl,openssl,libtool"
	description="shell ve network copy"
	source="https://github.com/stevegrubb/libcap-ng/archive/refs/tags/v${version}.zip"
	groups="sys.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()
	{	
        ./autogen.sh
        ./configure --prefix=/usr \
          --libdir=/lib64 \
         --with-python \
   		--with-python3
		
	}
	build()
	{
		make 
	}
	package()
	{
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libcap-ng) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak






sqlite
++++++

SQLite, C dilinde yazılmış ve gömülü bir veritabanı motoru olarak bilinen bir yazılımdır. Özellikle hafifliği ve taşınabilirliği ile dikkat çeker. SQLite, bir dosya sistemi üzerinde çalışarak verileri depolar ve bu sayede herhangi bir sunucuya ihtiyaç duymadan uygulama içinde kullanılabilir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="sqlite"
	version="3.45.2"
	description="A C library that implements an SQL database engine"
	srcver="3450200"
	source="https://www.sqlite.org/2024/sqlite-autoconf-$srcver.tar.gz"
	depends="zlib,readline"
	group="dev.db"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}


	setup(){
	    ./configure --prefix=/usr --libdir=/usr/lib64 --enable-fts3 --enable-fts4 --enable-fts5 --enable-rtree \
		CPPFLAGS="-DSQLITE_ENABLE_FTS3=1            \
		          -DSQLITE_ENABLE_FTS4=1            \
		          -DSQLITE_ENABLE_COLUMN_METADATA=1 \
		          -DSQLITE_ENABLE_UNLOCK_NOTIFY=1   \
		          -DSQLITE_ENABLE_DBSTAT_VTAB=1     \
		          -DSQLITE_SECURE_DELETE=1          \
		          -DSQLITE_ENABLE_FTS3_TOKENIZER=1"
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(sqlite) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




gzip
++++

Gzip, "GNU zip" ifadesinin kısaltmasıdır ve dosyaları sıkıştırmak için kullanılan bir yazılımdır. Temel amacı, dosya boyutunu azaltarak depolama alanından tasarruf sağlamak ve veri iletimini hızlandırmaktır. Gzip, genellikle metin dosyaları gibi tekrarlayan verilerde yüksek sıkıştırma oranları sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.13"
	name="gzip"
	depends=""
	description="Standard GNU compressor"
	source="https://ftp.gnu.org/gnu/gzip/${name}-${version}.zip"
	groups="app.arch"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	
	setup()
	{
		export DEFS="NO_ASM"
		./autoreconf -fvi
		./configure --prefix=/usr \
		--libdir=/usr/lib64/
	}
	build()
	{
		make 
	}
	package()
	{
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(gzip) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





xz-utils
++++++++

xz-utils, Linux işletim sistemlerinde dosyaları sıkıştırmak ve açmak için kullanılan bir yazılım paketidir. Bu paket, LZMA (Lempel-Ziv-Markov chain algorithm) algoritmasını temel alarak yüksek sıkıştırma oranları sağlar. xz-utils, genellikle büyük dosyaların depolanması ve aktarılması sırasında disk alanından tasarruf sağlamak amacıyla tercih edilir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="xz-utils"
	version="5.4.5"
	description="lzma compression utilities"
	source="https://tukaani.org/xz/xz-${version}.tar.gz"
	md5sums="66f82a9fa24623f5ea8a9ee6b4f808e2"
	group="app.arch"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
	    ./configure --prefix=/usr \
		--libdir=/usr/lib64 \
		--enable-static \
		--enable-shared \
		--enable-doc \
		--enable-nls
	}
	build(){
	    make $jobs
	}
	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(xz-utils) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




zstd
++++

Zstd (Zstandard), Facebook tarafından geliştirilen bir veri sıkıştırma algoritmasıdır. Bu paket, verilerin boyutunu azaltarak depolama alanından tasarruf sağlamak ve veri iletimini hızlandırmak amacıyla kullanılır. Zstd, hem sıkıştırma hem de açma işlemlerinde yüksek hız ve verimlilik sunar. Özellikle büyük veri setleri ile çalışırken, Zstd'nin sunduğu sıkıştırma oranları, diğer geleneksel algoritmalara göre daha üstündür.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.5.5"
	name="zstd"
	depends="glibc,readline,ncurses"
	description="şıkıştırma kütüphanesi"
	source="https://github.com/facebook/zstd/releases/download/v1.5.5/${name}-${version}.tar.gz"
	groups="libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()
	{
		echo ""
	}
	build()
	{
		make 
	}
	package()
	{
		make prefix=/usr install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(zstd) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




bzip2
+++++

bzip2, dosyaları sıkıştırmak için kullanılan bir yazılımdır ve genellikle Unix tabanlı sistemlerde tercih edilmektedir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.0.8"
	name="bzip2"
	depends="glibc,readline,ncurses"
	description="şıkıştırma kütüphanesi"
	source="https://sourceware.org/pub/bzip2/${name}-${version}.tar.gz"
	groups="app.arch"

	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"      #Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')    #Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
		    wget ${source}
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		    cp -prvf $PACKAGEDIR/files/ $SOURCEDIR
		    sed -i -e 's:\$(PREFIX)/man:\$(PREFIX)/share/man:g' -e 's:ln -s -f $(PREFIX)/bin/:ln -s :' Makefile
		    sed -i -e "s:1\.0\.4:$version:" bzip2.1 bzip2.txt Makefile-libbz2_so manual.*
	}
	build(){
		     make -f Makefile-libbz2_so all
		     make all
	}
	package(){
		    cd $SOURCEDIR
		    make DESTDIR=$DESTDIR/usr install
		    install -D libbz2.so.$version "$DESTDIR"/usr/lib64/libbz2.so.$version
		    ln -s libbz2.so.$version "$DESTDIR"/usr/lib64/libbz2.so
		    ln -s libbz2.so.$version "$DESTDIR"/usr/lib64/libbz2.so.${version%%.*}
		    mkdir -p "$DESTDIR"/usr/lib64/pkgconfig/
		    install -Dm644 files/bzip2.pc -t "$DESTDIR"/usr/lib64/pkgconfig
		    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/bzip2/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **bzip2** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.

Paket adında(bzip2) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





elfutils
++++++++

elfutils, ELF dosyalarının oluşturulması, düzenlenmesi ve incelenmesi için gerekli araçları sağlayan bir yazılım paketidir. Bu paket, özellikle derleyiciler ve bağlantı editörleri tarafından üretilen ikili dosyaların yapısını anlamak ve analiz etmek için kullanılır.

Paket, readelf, objdump, eu-strip gibi araçları içerir. Örneğin, readelf komutu, bir ELF dosyasının içeriğini detaylı bir şekilde görüntülemeye olanak tanırken, objdump ise ikili dosyaların iç yapısını analiz etmek için kullanılır. Bu araçlar, geliştiricilerin yazılımlarını optimize etmelerine ve hata ayıklama süreçlerini kolaylaştırmalarına yardımcı olur.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="elfutils"
	version="0.190"
	description="Libraries/utilities to handle ELF objects (drop in replacement for libelf)"
	source="https://sourceware.org/elfutils/ftp/${version}/elfutils-${version}.tar.bz2"
	depends="bzip2,xz-utils,zstd,zlib"
	group="dev.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
	    ./configure --prefix=/usr --libdir=/usr/lib64 \
			--enable-shared --disable-debuginfod --enable-libdebuginfod=dummy \
			--disable-thread-safety --disable-valgrind --disable-nls --program-prefix="eu-" --with-bzlib --with-lzma 
	}
	build(){
	    make
	}
	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(elfutils) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




libselinux
++++++++++

libselinux paketi, Linux işletim sistemlerinde güvenlik politikalarının uygulanmasına yardımcı olan bir kütüphanedir. Bu kütüphane, SELinux (Security-Enhanced Linux) mekanizmasının temel bileşenlerinden biridir.

Derleme
--------

Debian ortamında bu paketin derlenmesi için; **sudo apt install libpcre2-dev libsepol-dev** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell

	#!/usr/bin/env bash
	version="3.6"
	name="libselinux"
	depends=""
	description="lib"
	source="https://github.com/SELinuxProject/selinux/releases/download/3.6/${name}-${version}.tar.gz"
	groups="app.arch"

	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"      #Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')    #Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
			mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
			rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
			cd $ROOTBUILDDIR #dizinine geçiyoruz
			wget ${source}
			for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
			dowloadfile=$(ls|head -1)
			filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
			if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
			director=$(find ./* -maxdepth 0 -type d)
			directorname=$(basename ${director})
			if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
			mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()	{
			cp -prvf $PACKAGEDIR/files/ $SOURCEDIR
	}
	build()	{
		    patch -Np1 -i files/lfs64.patch
		    make FTS_LDLIBS="-lfts"
	}
	package()	{
		    make install DESTDIR=$DESTDIR
		    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.	

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/libselinux/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **libselinux** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(libselinux) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





tar
+++

Tar paketi, Unix ve Linux sistemlerinde dosya arşivleme ve sıkıştırma işlemleri için kullanılan bir dosya formatıdır. "tar" kelimesi, "tape archive" ifadesinin kısaltmasıdır ve başlangıçta manyetik bantlarda veri saklamak amacıyla geliştirilmiştir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="tar"
	version="1.35"
	description="Utility used to store, backup, and transport files"
	source="https://ftp.gnu.org/gnu/tar/tar-$version.tar.xz"
	depends="glibc,acl"
	builddepend=""
	groups="app.arch"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		export FORCE_UNSAFE_CONFIGURE=1
		./configure --prefix=/usr \
			--libdir=/usr/lib64 \
			--sbindir=/usr/bin \
			--libexecdir=/usr/lib64/tar \
			--localstatedir=/var \
			--enable-backup-scripts
	}
	build(){
		make 
	}
	package(){
		make DESTDIR=$DESTDIR install
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(tar) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





zlib
++++

Zlib, veri sıkıştırma ve açma işlemleri için geliştirilmiş açık kaynaklı bir kütüphanedir. Genellikle, Gzip ve PNG gibi formatların temelini oluşturur. Zlib, Deflate algoritmasını kullanarak verileri sıkıştırır ve bu sayede dosya boyutunu önemli ölçüde azaltır. Bu özellik, özellikle ağ üzerinden veri transferi sırasında bant genişliğinden tasarruf sağlamak için oldukça faydalıdır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.3"
	name="zlib"
	depends="glibc,readline,ncurses,flex"
	description="Compression library implementing the deflate compression method found in gzip and PKZIP"
	source="https://github.com/madler/zlib/archive/refs/tags/v$version.tar.gz"
	groups="app.arch"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		./configure --prefix=/usr
	}
	build(){
		make 
	}
	package(){
		make install pkgconfigdir="/usr/lib64/pkgconfig" DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(zlib) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





brotli
++++++

Brotli, Google tarafından geliştirilen ve özellikle web tarayıcıları için optimize edilmiş bir veri sıkıştırma algoritmasıdır. Bu algoritma, HTTP/2 ve HTTPS protokolleri ile birlikte kullanıldığında, web sayfalarının daha hızlı yüklenmesine olanak tanır. Brotli, gzip'e göre daha yüksek sıkıştırma oranları sunarak, veri transferini optimize eder.

Derleme
--------


Debian ortamında bu paketin derlenmesi için;

- **sudo apt install cmake** komutuyla paketin kurulması gerekmektedir.


.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.1.0"
	name="brotli"
	depends="glibc,zlib"
	description="Generic-purpose lossless compression algorithm"
	source="https://github.com/google/brotli/archive/refs/tags/v$version.tar.gz"
	groups="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
	    cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=True
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		mkdir -p $DESTDIR/lib
		mkdir -p $DESTDIR/lib/pkgconfig
		cp -prfv $DESTDIR/usr/lib/x86_64-linux-gnu/* $DESTDIR/lib/
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(brotli) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





curl
++++

Curl, "Client URL" ifadesinin kısaltmasıdır ve internet protokolleri üzerinden veri transferi yapabilen bir komut satırı aracıdır. Özellikle HTTP, HTTPS, FTP gibi protokollerle çalışarak, web sunucularına istek göndermek ve yanıt almak için kullanılır. Linux sistemlerinde yaygın olarak kullanılan bu araç, geliştiricilere ve sistem yöneticilerine API'lerle etkileşim kurma, dosya indirme veya yükleme gibi işlemleri kolaylaştırır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="8.4.0"
	name="curl"
	depends="glibc,acl,openssl"
	description="shell ve network copy"
	source="https://curl.se/download/${name}-${version}.tar.xz"
	groups="net.misc"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		        mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		        rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		        cd $ROOTBUILDDIR #dizinine geçiyoruz
		        wget ${source}
		        dowloadfile=$(ls|head -1)
		        filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		        if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		        director=$(find ./* -maxdepth 0 -type d)
		        directorname=$(basename ${director})
		        if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		        mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		    opts=(
		    --prefix=/usr --libdir=/usr/lib64 --disable-ldap --disable-ldaps --disable-versioned-symbols
		    --enable-doh --enable-ftp --enable-ipv6 --with-ca-path=/etc/ssl/certs --with-ca-bundle=/etc/ssl/cert.pem
		    --enable-threaded-resolverl --enable-websockets --without-libidn2 --without-libpsl --without-nghttp2)
		      #--without-zstd --without-zlib --without-brotli --without-libssh)
		    ./configure ${opts[@]} --with-openssl
	}
	build(){
		    make
	}
	package(){
			make install DESTDIR=$DESTDIR
		    cd $DESTDIR
		    for ver in 3 4.0.0 4.1.0 4.2.0 4.3.0 4.4.0 4.5.0 4.6.0 4.7.0; do
		    ln -s $DESTDIR/lib/libcurl.so.4.8.0 $DESTDIR/lib/libcurl.so.${ver}
			done
			${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Paket adında(curl) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





shadow
++++++

Shadow paketi, Linux işletim sistemlerinde kullanıcı hesaplarının şifrelerini güvenli bir şekilde saklamak için kullanılan bir mekanizmadır. Bu paket, kullanıcı bilgilerini ve şifrelerini içeren dosyaların yönetiminde önemli bir rol oynamaktadır.

Derleme
--------

Debian ortamında bu paketin derlenmesi için; **sudo apt install libreadline-dev libcap-dev libcap2-bin** komutları çalıştırıldıktan sonra derleme yapılmalıdır.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="shadow"
	version="4.13"
	description="Password and account management tool suite with support for shadow files and PAM"
	source="https://github.com/shadow-maint/shadow/releases/download/$version/shadow-$version.tar.xz"
	depends="pam,libxcrypt,acl,attr"
	group="sys.apps"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		cp -prvf $PACKAGEDIR/files/ $SOURCEDIR/
		autoreconf -fiv      
		./configure --prefix=/usr --libdir=/usr/lib64 --sysconfdir=/etc --bindir=/usr/bin --sbindir=/usr/sbin \
		--disable-account-tools-setuid --without-sssd --with-fcaps --with-libpam --without-group-name-max-length --with-bcrypt --with-yescrypt --without-selinux
	}

	build(){
	    make
	}
	package(){
		make install DESTDIR=$DESTDIR
		mkdir -p "${DESTDIR}/etc" "${DESTDIR}/etc/default/"
		sed -i "/.*selinux.*/d" ${DESTDIR}/etc/pam.d/*
		install -vDm 600 $SOURCEDIR/files/useradd.defaults "${DESTDIR}/etc/default/useradd"
		install -vDm 600 $SOURCEDIR/files/system-auth "${DESTDIR}/etc/pam.d/system-auth"
		if [ ! -f ${DESTDIR}/etc/group ] ; then install -vDm 600 $SOURCEDIR/files/group "${DESTDIR}/etc/group"; fi
		if [ ! -f ${DESTDIR}/etc/shadow ] ; then echo "root:*::0:::::" > ${DESTDIR}/etc/shadow; fi
		chmod 600 ${DESTDIR}/etc/shadow
		chmod 644 ${DESTDIR}/etc/group
		chown root ${DESTDIR}/etc/group  ${DESTDIR}/etc/shadow
		chgrp root ${DESTDIR}/etc/group  ${DESTDIR}/etc/shadow

		if [ ! -f "${DESTDIR}/etc/passwd" ]; then echo -e "root:x:0:0:root:/root:/bin/sh">${DESTDIR}/etc/passwd; fi
		    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/shadow/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **shadow** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.

Paket adında(shadow) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




file
++++

Linux'ta "file" komutu, dosyaların türlerini tanımlamak için kullanılan bir araçtır. Bu komut, dosyanın içeriğini analiz ederek, dosyanın ne tür bir veri içerdiğini belirler. Örneğin, bir dosyanın metin dosyası mı, ikili dosya mı yoksa bir resim dosyası mı olduğunu tespit edebilir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="file"
	version="5.45"
	description="Identify a files format by scanning binary data for patterns"
	source=("http://ftp.astron.com/pub/file/file-${version}.tar.gz")
	group=(sys.apps)
	depends=""
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
		    wget ${source}
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
	    opts=(
	    	--prefix=/usr
		--libdir=/usr/lib64
		--enable-static
		--enable-elf
		--enable-elf-core
	    )
	    ./configure ${opts[@]} \
		$(use_opt zlib --enable-zlib --disable-zlib) \
		$(use_opt lzma --enable-xzlib --disable-xzlib) \
		$(use_opt bzip2 --enable-bzlib --disable-bzlib) \
		$(use_opt seccomp --enable-libseccomp --disable-libseccomp)
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(file) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




eudev
+++++

Eudev, Linux tabanlı sistemlerde cihaz yönetimi için kullanılan bir kullanıcı alanı aracı olan udev'in bir fork'udur. Udev, sistemdeki donanım bileşenlerinin tanınması, yönetilmesi ve olay bildirimlerinin gerçekleştirilmesi için kritik bir rol oynar.

Derleme
--------

Debian ortamında bu paketin derlenmesi için; **sudo apt install libkmod-dev l libgperf-dev** komutuyla paketin kurulması gerekmektedir.


.. code-block:: shell
	
	#!/usr/bin/env bash
	version="3.2.14"
	name="eudev"
	depends="glibc,readline,ncurses,gperf"
	description="modül ve sistem iletişimi sağlayan paket"
	source="https://github.com/eudev-project/eudev/releases/download/v3.2.14/${name}-${version}.tar.gz"
	groups="sys.fs"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		cp $PACKAGEDIR/files/eudev.hook $SOURCEDIR
		cp $PACKAGEDIR/files/eudev.init-bottom $SOURCEDIR
		cp $PACKAGEDIR/files/eudev.init-top $SOURCEDIR

		./configure --prefix=/usr --bindir=/sbin --sbindir=/sbin --libdir=/lib64 --disable-manpages --disable-static --disable-selinux --enable-modules \
		   	--enable-kmod --sysconfdir=/etc --exec-prefix=/ --with-rootprefix=/ --with-rootrundir=/run --with-rootlibexecdir=/lib64/udev --enable-split-usr 
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		mkdir -p ${DESTDIR}/usr/share/initramfs-tools/{hooks,scripts}
	  	mkdir -p ${DESTDIR}/usr/share/initramfs-tools/scripts/init-{top,bottom}
	  	install $SOURCEDIR/eudev.hook         ${DESTDIR}/usr/share/initramfs-tools/hooks/udev
	    install $SOURCEDIR/eudev.init-top         ${DESTDIR}/usr/share/initramfs-tools/scripts/init-top/udev
	    install $SOURCEDIR/eudev.init-bottom         ${DESTDIR}/usr/share/initramfs-tools/scripts/init-bottom/udev
	    	
		cd ${DESTDIR}
		mkdir -p bin
		cd bin
		ln -s ../sbin/udevadm udevadm
		ln -s ../sbin/udevd udevd
		mkdir -p  ${DESTDIR}/usr/lib64/pkgconfig/
		cd ${DESTDIR}/usr/lib64/pkgconfig/
		ln -s ../../../lib64/pkgconfig/libudev.pc libudev.pc
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/eudev/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **eudev** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.

Paket adında(eudev) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




cpio
++++

CPIO (Copy In and Out), Unix ve Linux işletim sistemlerinde dosyaları arşivlemek ve taşımak için kullanılan bir komut satırı aracıdır. CPIO, dosyaları bir arşiv dosyası içinde saklayarak, bu dosyaların daha sonra kolayca geri yüklenmesini sağlar. CPIO, genellikle tarayıcılar ve diğer arşivleme araçları ile birlikte kullanılır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="cpio"
	version="2.15"
	description="A tool to copy files into or out of a cpio or tar archive"
	source="https://ftp.gnu.org/gnu/cpio/cpio-$version.tar.gz"
	depends="glibc"
	group="app.arch"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
	    CFLAGS+=' -fcommon'
	    ./configure --prefix=/usr
	}
	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(cpio) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




libsepol
++++++++

libsepol, SELinux'un güvenlik politikalarını oluşturmak, düzenlemek ve uygulamak için gerekli olan temel bir kütüphanedir. SELinux, Linux çekirdeği üzerinde güvenlik katmanları ekleyerek sistemin güvenliğini artırmayı amaçlar. libsepol, bu güvenlik politikalarının tanımlanması ve yönetilmesi için gerekli olan araçları sağlar.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install flex** 

komutuyla paketin kurulması gerekmektedir.



.. code-block:: shell
	
	#!/usr/bin/env bash
	version="3.6"
	name="libsepol"
	depends=""
	description="lib"
	source="https://github.com/SELinuxProject/selinux/releases/download/3.6/${name}-${version}.tar.gz"
	groups="app.arch"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()	{
		echo ""
	}
	build()	{
		make 
	}
	package()	{
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libsepol) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





kmod
++++

Bash, Linux ve diğer Unix tabanlı işletim sistemlerinde kullanılan bir kabuk programlama dilidir. Kullanıcıların komutlar vererek işletim sistemini yönetmelerine olanak tanır. Bash, kullanıcıların işlemleri otomatikleştirmesine ve betik dosyaları oluşturmasına olanak tanır. Özellikle sistem yöneticileri ve geliştiriciler arasında yaygın olarak kullanılan güçlü bir araçtır.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install libkmod-dev** 

komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="kmod"
	version="32"
	description="library and tools for managing linux kernel modules"
	source="https://mirrors.edge.kernel.org/pub/linux/utils/kernel/kmod/kmod-$version.tar.xz"
	depends="zlib,xz-utils"
	group=(sys.apps)

	export PATH=$HOME:$PATH
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
	    touch libkmod/docs/gtk-doc.make
	    ./configure --prefix=/usr --libdir=/usr/lib64/ --bindir=/bin --with-rootlibdir=/lib --with-zlib --with-openssl
	}
	build(){
	    make
	}
	package(){
	    make install DESTDIR=$DESTDIR
	    mkdir -p ${DESTDIR}/sbin
	    for i in lsmod rmmod insmod modinfo modprobe depmod; do
			ln -sf ../bin/kmod "$DESTDIR"/sbin/$i
		done
		for i in lsmod modinfo; do
			ln -s kmod "$DESTDIR"/bin/$i
		done
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(kmod) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
 
Linux çekirdeği ile donanım arasındaki haberleşmeyi sağlayan kod parçalarıdır. Bu kod parçalarını kernele eklediğimizde kerneli tekrardan derlememiz gerekmektedir. Her kod ekleme ve her kod çıkartma işleminden sonra kernel derlemek ciddi bir iş yükü ve karmaşa oluşturacaktır.

Bu sorunların çözümü için modul vardır. Moduller kernele istediğimiz kod parçalarını ekleme ya da çıkartma yapabilmemizi sağlar. Bu işlemleri yaparken kernel derleme işlemi yapmamıza gerek yoktur.

kmod Komutları
--------------

- **lsmod :** yüklü modulleri listeler
- **insmod:** tek bir modul yükler
- **rmmod:** tek bir modul siler
- **modinfo:** modul hakkında bilgi alınır 
- **modprobe:** insmod komutunun aynısı fakat daha işlevseldir. module ait bağımlı olduğu modülleride yüklemektedir. modprobe  modülü /lib/modules/ dizini altında aramaktadır.
- **depmod:** /lib/modules dizinindeki modüllerin listesini günceller. Fakat başka bir dizinde ise basedir=konum şeklinde belirtmek gerekir. konum dizininde /lib/modules/** şeklinde kalsörler olmalıdır.

Test Edilmesi
-------------

Bir modül eklendiğinde veya çıkartıldığında modülle ilgili mesajları dmesg logları ile görebiliriz.

.. raw:: pdf

   PageBreak




audit
+++++

Audit paketi, Linux sistemlerinde güvenlik denetimlerini gerçekleştirmek için tasarlanmış bir yazılımdır. Bu paket, sistemdeki önemli olayları, kullanıcı aktivitelerini ve dosya erişimlerini kaydederek, sistem yöneticilerine kapsamlı bir denetim ve izleme imkanı sunar. 

Derleme
--------

Debian ortamında bu paketin derlenmesi için; **sudo apt install libaudit-dev** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="audit"
	version='3.1.1'
	depends=""
	description="servis yöneticisi"
	source="https://github.com/linux-audit/audit-userspace/archive/refs/tags/v$version.tar.gz"
	groups="sys.process"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"      #Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')    #Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
		        mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		        rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		        cd $ROOTBUILDDIR #dizinine geçiyoruz
		        wget ${source}
		        for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		        dowloadfile=$(ls|head -1)
		        filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		        if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		        director=$(find ./* -maxdepth 0 -type d)
		        directorname=$(basename ${director})
		        if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		        mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		cp -prvf $PACKAGEDIR/files/ $SOURCEDIR
		./autogen.sh
		./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib64 --disable-zos-remote --disable-listener --disable-systemd \
		--disable-gssapi-krb5 --enable-shared=audit --with-arm --with-aarch64 --without-python --without-python3 --with-libcap-ng=no
	}
	build(){
		    make
	}
	package(){
		make install DESTDIR=$DESTDIR
		install -Dm755 files/auditd.initd "$DESTDIR"/etc/init.d/auditd
		install -Dm755 files/auditd.confd "$DESTDIR"/etc/conf.d/auditd
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/audit/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **audit** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(audit) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





libxcrypt
+++++++++

libxcrypt, Unix benzeri sistemlerde parolaların şifrelenmesi için kullanılan bir kütüphanedir. Bu kütüphane, geleneksel crypt() fonksiyonunun yerini alarak daha güvenli ve esnek bir şifreleme yöntemi sunar. libxcrypt, çeşitli şifreleme algoritmalarını destekler; bunlar arasında bcrypt, scrypt ve Argon2 gibi modern algoritmalar bulunmaktadır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="libxcrypt"
	version="4.4.36"
	description="libxcrypt"
	source=("https://github.com/besser82/libxcrypt/releases/download/v4.4.36/libxcrypt-4.4.36.tar.xz")
	group=(net.libs)
	depends=""
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		   mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup() {
	    ./configure --prefix=/usr --libdir=/usr/lib64/ --sbindir=/usr/bin 
	}
	build() {
	    make -C $SOURCEDIR
	}
	package() {
	    make -C $SOURCEDIR install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libxcrypt) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




libnsl
++++++

libnsl, "Network Services Library" anlamına gelen bir kütüphanedir ve genellikle Unix sistemlerinde ağ hizmetleri ile ilgili işlevsellik sağlamak amacıyla kullanılır. Bu kütüphane, uzaktan prosedür çağrıları (RPC) ve diğer ağ iletişim protokollerinin uygulanmasında kritik bir bileşendir. libnsl, özellikle eski sistemlerde ve uygulamalarda yaygın olarak bulunur ve modern sistemlerde de bazı uygulamalar için gereklidir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="libnsl"
	version="2.0.0"
	url="https://github.com/thkukuk/libnsl"
	description="Public client interface library for NIS(YP)"
	source="https://github.com/thkukuk/libnsl/releases/download/v$version/libnsl-$version.tar.xz"
	depends="libtirpc"
	group="net.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
	    ./configure --prefix=/usr --libdir=/usr/lib64
	}
	build(){
	    make $jobs
	}
	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libnsl) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




libbsd
++++++

libbsd, geliştiricilere daha güvenli ve taşınabilir kod yazma imkanı tanırken, aynı zamanda BSD sistemlerinde yaygın olarak kullanılan işlevlerin Linux üzerinde de kullanılmasını sağlar. Bu kütüphane, sistem programlama ve ağ programlama gibi alanlarda sıkça tercih edilmektedir.

Derleme
--------

Derlemek için **sudo apt-get install libbsd-dev** paketi kurulmalı.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="libbsd"
	version="0.11.7"
	description="Library to provide useful functions commonly found on BSD systems"
	source="https://libbsd.freedesktop.org/releases/libbsd-$version.tar.xz"
	depends=""
	group="dev.libs"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"      #Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')    #Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
		    wget ${source}
		    for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		autoreconf -fvi
		./configure --prefix=/usr --libdir=/usr/lib64
	}

	build(){
		make
	}

	package(){
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libbsd) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build

.. raw:: pdf

   PageBreak




libtirpc
++++++++

libtirpc, UNIX sistemlerinde yaygın olarak kullanılan bir RPC kütüphanesidir. Bu kütüphane, istemci ve sunucu uygulamaları arasında uzaktan prosedür çağrıları yapmayı mümkün kılar. libtirpc, özellikle dağıtık sistemlerde veri paylaşımını ve iletişimi kolaylaştırmak amacıyla geliştirilmiştir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="libtirpc"
	version="1.3.3"
	description="Transport Independent RPC library (SunRPC replacement)"
	source="https://downloads.sourceforge.net/libtirpc/libtirpc-$version.tar.bz2"
	depends=""
	group="net.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}


	setup(){
		./configure --prefix=/usr \
		--libdir=/usr/lib64 \
		--sysconfdir=/etc \
		--disable-gssapi
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libtirpc) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




e2fsprogs
+++++++++

e2fsprogs, Linux tabanlı sistemlerde yaygın olarak kullanılan bir dosya sistemi yönetim aracıdır. Bu paket, ext2, ext3 ve ext4 dosya sistemleri üzerinde çeşitli işlemler yapabilmek için gerekli olan araçları içerir. Örneğin, dosya sistemi oluşturma, onarma, kontrol etme ve boyutlandırma gibi işlemler e2fsprogs ile gerçekleştirilebilir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.47.0"
	name="e2fsprogs"
	depends="glibc,readline,ncurses"
	description="modül ve sistem iletişimi sağlayan paket"
	source="https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v${version}/${name}-${version}.tar.xz"
	groups="sys.fs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		./configure --sbindir=/usr/bin --libdir=/usr/lib64/  
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		rm -rf $DESTDIR/usr/share/man/man8/fsck.8
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(e2fsprogs) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





dostools
++++++++

Dostools, Linux işletim sistemlerinde kullanılan bir dizi araç ve komut setidir. Bu araçlar, sistem yöneticilerine ve geliştiricilere, sistem yönetimi, dosya işlemleri ve ağ yönetimi gibi çeşitli görevleri daha verimli bir şekilde gerçekleştirme imkanı sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="4.2"
	name="dosfstools"
	depends="glibc"
	description="DOS filesystem tools - provides mkdosfs, mkfs.msdos, mkfs.vfat"
	source="https://github.com/dosfstools/dosfstools/archive/refs/tags/v$version.tar.gz"
	groups="sys.block"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		./autogen.sh
		./configure --prefix=/usr --libdir=/usr/lib64/ --enable-compat-symlinks
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(dostools) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





initramfs-tools
+++++++++++++++

initramfs-tools, Debian tabanlı sistemlerde kullanılan bir araçtır ve initramfs (initial RAM file system) oluşturmak için kullanılır. Bu araç, sistem açılırken kullanılan geçici bir dosya sistemini oluşturur ve gerekli modülleri yükler. initramfs için farklı araçlarda kullanılabilir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="0.142"
	name="initramfs-tools"
	depends="glibc,readline,ncurses"
	description="initramfs  generate sağlayan paket"
	source="https://salsa.debian.org/kernel-team/initramfs-tools/-/archive/v$version/initramfs-tools-v$version.tar.gz"
	groups="sys.fs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
		        mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		        rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		        cd $ROOTBUILDDIR #dizinine geçiyoruz
		        wget ${source}
		        for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		        dowloadfile=$(ls|head -1)
		        filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		        if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		        director=$(find ./* -maxdepth 0 -type d)
		        directorname=$(basename ${director})
		        if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		        mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup()	{
		    cp -prfv $PACKAGEDIR/files/* $SOURCEDIR/
		    patch -Np1 < $SOURCEDIR/patches/remove-zstd.patch
		    patch -Np1 < $SOURCEDIR/patches/remove-logsave.patch
		    patch -Np1 < $SOURCEDIR/patches/non-debian.patch
	}
	build()	{
	echo ""
	}
	package()	{
		    cat debian/*.install | sed "s/\t/ /g" | tr -s " " | while read line ; do
		    file=$(echo $line | cut -f1 -d" ")
		    target=$(echo $line | cut -f2 -d" ")
		    mkdir -p ${DESTDIR}/$target
		    cp -prvf $file ${DESTDIR}/$target/
		    done
		    # install mkinitramfs
		    cp -pvf mkinitramfs ${DESTDIR}/usr/sbin/mkinitramfs
		    sed -i "s/@BUSYBOX_PACKAGES@/busybox/g" ${DESTDIR}/usr/sbin/mkinitramfs
		    sed -i "s/@BUSYBOX_MIN_VERSION@/1.22.0/g" ${DESTDIR}/usr/sbin/mkinitramfs
		    # Remove debian stuff
		    rm -rvf ${DESTDIR}/etc/kernel
		    # install sysconf
		    mkdir -p ${DESTDIR}/etc/sysconf.d
		    install $SOURCEDIR/initramfs-tools.sysconf ${DESTDIR}/etc/sysconf.d/initramfs-tools
		    install $SOURCEDIR/zzz-busybox ${DESTDIR}/usr/share/initramfs-tools/hooks/
		    install $SOURCEDIR/modules ${DESTDIR}/usr/share/initramfs-tools/
		    install $SOURCEDIR/modules ${DESTDIR}/etc/initramfs-tools/

		    mkdir -p ${DESTDIR}/usr/share/initramfs-tools/conf-hooks.d
		    install $SOURCEDIR/conf-hooks.d/busybox ${DESTDIR}/usr/share/initramfs-tools/conf-hooks.d/
		    mkdir -p ${DESTDIR}/etc/initramfs-tools/scripts
			${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	  }
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


.. raw:: pdf

   PageBreak

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/initramfs-tools/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **initramfs-tools** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(initramfs-tools) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build

**/etc/initramfs-tools/modules**
---------------------------------

**modules** dosyası initrd oluşturulma ve güncelleme durumunda isteğe bağlı olarak modullerin eklenmesisini ve **initrd** açıldığında modülün yüklenmesini istiyorsak **/etc/initramfs-tools/modules** komundaki dosyayı  aşağıdaki gibi düzenlemeliyiz. Bu dosya içinde **ext4**, **vfat** ve diğer yardımcı moduller eklenmiş durumdadır. 

.. code-block:: shell

	### This file is the template for /etc/initramfs-tools/modules.
	### It is not a configuration file itself.
	###
	# List of modules that you want to include in your initramfs.
	# They will be loaded at boot time in the order below.
	#
	# Syntax:  module_name [args ...]
	#
	# You must run update-initramfs(8) to effect this change.
	#
	# Examples:
	#
	# raid1
	# sd_mod
	vfat
	fat
	nls_cp437
	nls_ascii
	nls_utf8
	ext4
 
**initramfs-tools Ayarları**
----------------------------

**/usr/share/initramfs-tools/hooks/** konumundaki dosyaları dikkatlice düzenlemek gerekmektedir.
Dosyaları alfabetik sırayla çalıştırdığı için **busybox** **zzz-busybox** şeklinde ayarlanmıştır.

**initrd Oluşturma/Güncelleme**
-------------------------------

Sistemin initrd.img dosyasının güncellenmesi/oluşturulması için çalıştığınız sistemde  aşağıdaki komutlarla yapılabilir. 

.. code-block:: shell

	/usr/sbin/update-initramfs -u -k $(uname -r) #initrd günceller

Eğer bir dizin içinde bir sisteme initrd oluşturlacaksa, yani chroot ile sisteme erişiliyorsa yukarıdaki komut yeterli olmayacaktır. chroot öncesinde sistemin **dev sys proc run** dizinlerinin  bağlanılması gerekmektedir. Dizindeki sistemimizin dizin konumu **/$HOME/distro/rootfs** olsun. Buna göre aşağıda sisteme yukarıdaki komutu çalıştırmadan önce çalıştırılması gereken komutlar aşağıda verilmiştir. Dikkat edilmesi gereken en önemli noktalardan biriside bu komutlar **root** yetkisiyle çalıştırılmalıdır.

.. code-block:: shell

	rootfs="$HOME/distro/rootfs"
	distro="$HOME/distro"
	mkdir -p $rootfs/dev
	mkdir -p $rootfs/sys
	mkdir -p $rootfs/proc 
	mkdir -p $rootfs/run
	mkdir -p $rootfs/tmp
	mount --bind /dev $rootfs/dev
	mount --bind /sys $rootfs/sys
	mount --bind /proc $rootfs/proc
	mount --bind /run$rootfs/run
	mount --bind /tmp $rootfs/tmp
	
	### update-initrd
	fname=$(basename $rootfs/boot/config*)
	kversion=${fname:7}
	mv $rootfs/boot/config* $rootfs/boot/config-$kversion
	cp $rootfs/boot/config-$kversion $rootfs/etc/kernel-config
	
	chroot $rootfs update-initramfs -u -k $kversion
	
	umount -lf -R $rootfs/dev 2>/dev/null
	umount -lf -R $rootfs/sys 2>/dev/null
	umount -lf -R $rootfs/proc 2>/dev/null
	umount -lf -R $rootfs/run 2>/dev/null
	umount -lf -R $rootfs/tmp 2>/dev/null
	#### Copy initramfs
	cp -pf $rootfs/boot/initrd.img-* $distro/iso/boot/initrd.img
	 
Güncelleme ve oluşturma aşamasında **/usr/share/initramfs-tools/hooks/** konumundaki dosyarı çalıştırarak yeni initrd dosyasını oluşturacaktır.
Oluşturma **/var/tmp** olacaktır. Ayrıca **/boot/config-6.6.0-amd64** gibi sistemde kullanılan kernel versiyonuyla config dosyası olmalıdır. Burada verilen **6.6.0-amd64** örnek amaçlı verilmiştir.

**initrd açılma Süreci**
------------------------

Sistemin açılması için **vmlinuz**, **initrd.img** ve **grub.cfg** dosyalarının olması yeterlidir. **initrd.img** sistemin açılma sürecini yürüten bir kernel yardımcı ön sistemidir. **initrd.img** açıldığında aşğıdaki gibi bir dizin yapısı olur. Bu dizinler içindeki **script** dizini çok önemlidir. Bu dizin içindeki scriptler belirli bir sırayla çalışarak sistemin açılması sağlanır.

.. image:: /_static/images/initrd-2.png
  	:width: 600

**initrd script İçeriği**
-------------------------
**script** içerindeki dizinler  aşağıdaki gibidir. Bu dizinler içinde scriptler vardır. Bu dizinlerin içeriği sırayla şöyle çalışmaktadır.

1. init-top
2. init-premount
3. init-bottom

.. image:: /_static/images/initrd-3.png
  	:width: 600
  	
Oluşan initrd.img dosyası sistemin açılmasını sağlayamıyorsa script açılış sürecini takip ederek sorunları çözebilirsiniz.

.. raw:: pdf

   PageBreak

libxml2
+++++++

libxml2, özellikle XML ve HTML belgeleri ile çalışmak için tasarlanmış, yüksek performanslı bir C kütüphanesidir. Geliştiricilere, XML belgelerini analiz etme, oluşturma ve düzenleme gibi işlemleri gerçekleştirme imkanı sunar. libxml2, DOM (Document Object Model) ve SAX (Simple API for XML) gibi iki farklı API ile çalışabilme yeteneğine sahiptir. Bu sayede, hem bellek dostu hem de hızlı bir şekilde veri işleme imkanı sağlar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="2.12.6"
	name="libxml2"
	depends="glibc,acl,openssl,libtool,icu"
	builddepend="python3"
	description="XML C parser and toolkit"
	source="https://github.com/GNOME/libxml2/archive/refs/tags/v${version}.tar.gz"
	groups="dev.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
        ./autogen.sh
       	./configure --prefix=/usr --libdir=/usr/lib64 --with-history --with-icu --with-legacy --with-threads
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		mkdir -p $DESTDIR/usr/lib64/python3.11
		mv $DESTDIR/usr/lib/* $DESTDIR/usr/lib64/
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libxml2) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





expat
+++++

Expat, özellikle C dilinde geliştirilmiş bir XML ayrıştırma kütüphanesidir. Bu kütüphane, XML belgelerini okuma ve işleme süreçlerini kolaylaştırmak amacıyla tasarlanmıştır. Expat, olay tabanlı bir ayrıştırma modeli kullanarak, XML belgelerinin içeriğini parçalara ayırır ve bu parçaları işlemek için geliştiricilere bir dizi geri çağırma (callback) fonksiyonu sunar. Bu sayede, büyük XML dosyaları ile çalışırken bellek verimliliği sağlanır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="expat"
	version="2.6.2"
	vrsn="2_6_2"
	description="An XML parser library"
	#source="https://github.com/libexpat/libexpat/archive/refs/tags/R_${version}.tar.gz"
	source="https://github.com/libexpat/libexpat/releases/download/R_${vrsn}/expat-${version}.tar.bz2"
	depends=""
	builddepend=""
	group="dev.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
	    cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib64 \
		-DCMAKE_BUILD_TYPE=None \
		-DEXPAT_BUILD_DOCS=false \
		-W no-dev \
		-B $BUILDDIR
	}
	build(){
	    make -C $BUILDDIR
	}
	package(){
	    make DESTDIR="$DESTDIR" install -C $BUILDDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(expat) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




libmd
+++++

libmd, özellikle BSD tabanlı sistemlerde bulunan bir kütüphanedir ve çeşitli kriptografik hash fonksiyonlarını (MD5, SHA-1, SHA-256 gibi) destekler. Bu kütüphane, veri bütünlüğünü sağlamak ve şifreleme işlemlerini gerçekleştirmek için kullanılır. Örneğin, bir dosyanın hash değerini hesaplamak, dosyanın değiştirilip değiştirilmediğini kontrol etmek için yaygın bir yöntemdir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="libmd"
	version="1.1.0"
	description="Message Digest functions from BSD systems"
	depends=""
	group="app.crypt"
	source="https://archive.hadrons.org/software/libmd/libmd-$version.tar.xz"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
	    ./configure --prefix=/usr --libdir=/usr/lib64/
	}
	build(){
	    make 
	}
	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libmd) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




libaio
++++++

Libio, C dilinde girdi/çıktı işlemlerini kolaylaştıran bir kütüphanedir. Temel olarak, dosya okuma ve yazma işlemlerini, bellek yönetimini ve veri akışını yönetmek için kullanılır. Libio, performansı artırmak amacıyla tamponlama (buffering) mekanizmaları kullanır. Bu sayede, verilerin daha verimli bir şekilde işlenmesini sağlar. Örneğin, bir dosyadan veri okurken, veriler önce bir tampon belleğe alınır ve ardından işlenir. Bu, disk erişimlerini azaltarak programın genel performansını artırır.

Derleme
-------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="libaio"
	version="0.3.113"
	description="Asynchronous input/output library that uses the kernels native interface"
	source="https://pagure.io/libaio/archive/libaio-$version/libaio-libaio-$version.tar.gz"
	depends=""
	builddepend=""
	group="dev.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup (){
		echo ""
	}
	build(){
		
	    make
	}
	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libio) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




lvm2
++++

LVM2 (Logical Volume Manager 2), Linux işletim sistemlerinde disk alanını yönetmek için kullanılan bir araçtır. LVM2, fiziksel disklerin mantıksal birimlere dönüştürülmesine olanak tanır. Bu sayede, disk alanı dinamik olarak genişletilebilir veya daraltılabilir. LVM2, sistem yöneticilerine disk alanını daha verimli bir şekilde kullanma imkanı sunar. Örneğin, bir fiziksel disk üzerinde birden fazla mantıksal birim oluşturabilir ve bu birimlerin boyutlarını ihtiyaçlara göre değiştirebilirsiniz.

Debian ortamında derlemek lvm2 paketinde sorunlar çıkmaktadır. Bunun sebebi kernel derlenmesi sırasında lvm ile ilgili özellikleri aktif etmek gerekiyor. Bundan dolayı isteyen aşağıda derleme bölümünde verilen derleme talimatını kullanarak başka dağıtımlarda derleme yapabilir. Burada geliştirilmesi anlatılan sistem üzerinde derlenen paketi indirip hazırladığımız sisteme kuran script aşağıda verilmiştir.

lvm2 Kurma Scripti
------------------

.. code-block:: shell

	#!/usr/bin/env bash
	name="lvm2"
	version="2_03_21"
	description="User-land utilities for LVM2 (device-mapper) software"
	source=""
	depends="libaio"
	builddepend=""
	group="sys.fs"

	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
 		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		mkdir -p $SOURCEDIR
		cd $SOURCEDIR
		wget -O lvm2.bps https://kendilinuxunuyap.github.io/_static/files/lvm2/lvm2-2_03_21.bps 				#dosya indiriliyor
		# tar -xf lvm2.bps
		tar -xf lvm2.bps
		tar -xf rootfs.tar.xz
	}
	build(){
		echo ""
	}
	package(){
		cd $SOURCEDIR
		cp -prfv etc  ${DESTDIR}/
		cp -prfv usr  ${DESTDIR}/
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(lvm2) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build

  
.. raw:: pdf

   PageBreak
 
Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="lvm2"
	version="2_03_21"
	description="User-land utilities for LVM2 (device-mapper) software"
	source="https://github.com/lvmteam/lvm2/archive/refs/tags/v$version.tar.gz"
	depends="libaio"
	builddepend=""
	group="sys.fs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
			./configure --prefix=/usr --libdir=/usr/lib64/  CONFIG_SHELL=/bin/bash --sbindir=/usr/bin \ 
			--sysconfdir=/etc --localstatedir=/var \
			--enable-cmdlib --enable-dmeventd --enable-lvmpolld --enable-pkgconfig --enable-readline \
			--enable-udev_rules --enable-udev_sync --enable-write_install --disable-systemd \
			--with-cache=internal --with-default-dm-run-dir=/run --with-default-locking-dir=/run/lock/lvm \
			--with-default-pid-dir=/run --with-default-run-dir=/run/lvm --with-thin=internal --with-udev-prefix=/usr
	}
	build(){
	    make
	}
	package() {
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(lvm2) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




popt
++++

Popt, "Portable Options Parsing Library" ifadesinin kısaltmasıdır ve özellikle C programlama dilinde geliştirilmiş bir kütüphanedir. Bu kütüphane, komut satırı argümanlarını analiz etmek ve yönetmek için kullanılır. Popt, kullanıcıların programlarına daha anlaşılır ve esnek bir seçenek yönetimi eklemelerine olanak tanır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="popt"
	version="1.19"
	description="A commandline option parser"
	source="http://ftp.rpm.org/popt/releases/popt-${version%.*}.x/popt-${version}.tar.gz"
	depends=""
	builddepend=""
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		CFLAGS+=" -ffat-lto-objects" ./configure --prefix=/usr
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(popt) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




icu
+++

ICU, çok dilli uygulamalar geliştirmek için gerekli olan metin işleme, tarih ve saat formatlama, sayı biçimlendirme gibi işlevleri sağlayan bir kütüphanedir. Unicode standardını destekleyerek, farklı dillerdeki karakterlerin doğru bir şekilde işlenmesini ve görüntülenmesini mümkün kılar. Özellikle, uluslararasılaşma (i18n) ve yerelleştirme (l10n) süreçlerinde kritik bir rol oynar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="icu"
	version="74-2"
	description="icu International Components for Unicode"
	source=("https://github.com/unicode-org/icu/releases/download/release-${version}/icu4c-74_2-src.tgz")
	depends=()
	group=(dev.libs)
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
	    cd source
	    ./configure --prefix=/usr \
		--libdir=/usr/lib64/
	}

	build(){
	    make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    chmod +x "$DESTDIR"/usr/bin/icu-config
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(icu) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




iproute2
++++++++

iproute2, Linux tabanlı sistemlerde ağ yönetimi için geliştirilmiş bir araç setidir. Bu araç seti, özellikle ağ yönlendirmesi ve trafik kontrolü gibi karmaşık işlemleri gerçekleştirmek için kullanılır. iproute2, ip komutu ile birlikte gelir ve bu komut, ağ arayüzlerini, yönlendirme tablolarını ve diğer ağ yapılandırmalarını yönetmek için kapsamlı bir arayüz sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="iproute2"
	version="6.10.0"
	description="GNU regular expression matcher"
	source="https://mirrors.edge.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.10.0.tar.xz"
	depends=""
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		cp -prvf ${PACKAGEDIR}/files/ $SOURCEDIR/
		patch -Np1 -i $SOURCEDIR/files/0001-make-iproute2-fhs-compliant.patch
		patch -Np1 -i $SOURCEDIR/files/0002-bdb-5-3.patch
		sed -i 's/-Werror//' Makefile
		export CFLAGS+=' -ffat-lto-objects'
		./configure
	}
	build(){
	   make DBM_INCLUDE='/usr/include/db5.3'
	}
	package(){
		make DESTDIR=$DESTDIR SBINDIR="/sbin" install
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/iproute2/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **iproute2** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(iproute2) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




net-tools
+++++++++

net-tools, Linux tabanlı sistemlerde ağ yönetimi için kullanılan klasik bir araçlar paketidir. Bu paket, ifconfig, route, netstat, arp gibi komutları içerir. ifconfig komutu, ağ arayüzlerinin durumunu görüntülemek ve yapılandırmak için kullanılırken, route komutu yönlendirme tablolarını yönetmekte kullanılır. netstat ise ağ bağlantılarını ve istatistiklerini gösterir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="net-tools"
	version="2.10"
	description="GNU regular expression matcher"
	source="https://sourceforge.net/projects/net-tools/files/net-tools-2.10.tar.xz"
	depends=""
	group="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		export BINDIR='/usr/bin' SBINDIR='/usr/bin'
	}

	build(){
	   yes "" | make
	}

	package(){
	    make install DESTDIR=$DESTDIR
	    # the following is provided by yp-tools
	  	rm "${DESTDIR}"/usr/bin/{nis,yp}domainname
	  	# hostname is provided by inetutils
	  	rm "${DESTDIR}"/usr/bin/{hostname,dnsdomainname,domainname}
	  	rm -r "${DESTDIR}"/usr/share/man/man1
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(net-tools) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




dhcp
++++

Bu protokol, bir istemci cihazın ağa bağlandığında, DHCP sunucusuna bir istek göndererek IP adresi talep etmesiyle başlar. Sunucu, istemciye uygun bir IP adresi, alt ağ maskesi, varsayılan ağ geçidi ve DNS sunucusu gibi bilgileri iletir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="dhcp"
	version="4.4.3"
	description="GNU regular expression matcher"
	source="https://downloads.isc.org/isc/dhcp/4.4.3/dhcp-4.4.3.tar.gz"
	depends=""
	group="sys.apps"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		cp -prvf ${PACKAGEDIR}/files $SOURCEDIR/
    	./configure --prefix=/usr --libdir=/usr/lib64/
	}
	build(){
	    make
	}
	package(){
		mkdir -p $DESTDIR/sbin/
	    make install DESTDIR=$DESTDIR
	    install  $SOURCEDIR/client/scripts/linux $DESTDIR/sbin/dhclient-script
	    mkdir -p $DESTDIR/etc/init.d    
	    for level in boot default nonetwork shutdown sysinit ; do
	    mkdir -p ${DESTDIR}/etc/runlevels/$level
	    done
		install -Dm755  $SOURCEDIR/files/dhclient.init.d $DESTDIR/etc/init.d/dhclient
		install -Dm755  $SOURCEDIR/files/dhclient.init.d ${DESTDIR}/etc/runlevels/default/dhclient
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/dhcp/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **dhcp** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.

Paket adında(dhcp) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




openrc
++++++

OpenRC, sistem başlangıcını ve hizmetlerin yönetimini sağlamak amacıyla geliştirilmiş bir init sistemidir. 

Derleme
-------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="openrc"
	version="0.53"
	description="The OpenRC init system"
	source="https://github.com/OpenRC/openrc/archive/refs/tags/$version.zip"
	depends=""
	group="sys.apps,pam"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){

		cp -prfv $PACKAGEDIR/files $SOURCEDIR/
		cp -prfv $PACKAGEDIR/extras $SOURCEDIR/
	    meson setup $BUILDDIR --sysconfdir=/etc --prefix=/ --libdir=/lib64 --includedir=/usr/include \
		-Ddefault_library=both -Dzsh-completions=true -Dbash-completions=true -Dpam=true -Dselinux=disabled -Dpkgconfig=true
	}
	build(){
	    meson compile -C $BUILDDIR
	}
	package(){
	    export DESTDIR=${DESTDIR}//
	    DESTDIR="$DESTDIR" meson install --no-rebuild -C $BUILDDIR
	    rm -f ${DESTDIR}/etc/runlevels/*/*	    # disable all services
	    rm ${DESTDIR}//etc/init.d/functions.sh
	    ln -s ../../lib/rc/sh/functions.sh ${DESTDIR}/etc/init.d/functions.sh
	    mkdir -p ${DESTDIR}/etc/sysconf.d/	    # install sysconf script
	    install $SOURCEDIR/files/openrc.sysconf ${DESTDIR}/etc/sysconf.d/openrc
	    mkdir -p ${DESTDIR}/usr ${DESTDIR}/sbin
	    mv ${DESTDIR}/{,usr}/share	    # move /share to /usr/share

	    install $SOURCEDIR/files/reboot ${DESTDIR}/sbin/reboot	    # reboot and poweroff script
	    install $SOURCEDIR/files/poweroff ${DESTDIR}/sbin/poweroff
	    ln -s openrc-shutdown ${DESTDIR}/sbin/shutdown
	    mkdir -p ${DESTDIR}/usr/libexec
	    install $SOURCEDIR/extras/disable-secondary-gpu.sh ${DESTDIR}/usr/libexec/disable-secondary-gpu
	    install $SOURCEDIR/extras/disable-secondary-gpu.initd ${DESTDIR}/etc/init.d
	    install $SOURCEDIR/extras/backlight-restore.initd ${DESTDIR}/etc/init.d
	    install $SOURCEDIR/files/0modules.init.d ${DESTDIR}/etc/init.d/0modules
	    
	    for level in boot default nonetwork shutdown sysinit ; do
	    mkdir -p ${DESTDIR}/etc/runlevels/$level
	    done
	    touch ${DESTDIR}/etc/fstab
	    install $SOURCEDIR/files/0modules.init.d ${DESTDIR}/etc/init.d/0modules
	    install $SOURCEDIR/files/0modules.init.d ${DESTDIR}/etc/runlevels/default/0modules
	    
	    install ${DESTDIR}/etc/init.d/hostname ${DESTDIR}/etc/runlevels/default/hostname
	    cd ${DESTDIR}/etc/init.d/
	    ln -s agetty agetty.tty1
	    install ${DESTDIR}/etc/init.d/agetty.tty1 ${DESTDIR}/etc/runlevels/default/agetty.tty1
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

.. raw:: pdf

   PageBreak
   
Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/openrc/files.tar>`_

Bu extras dosyalarını indirmek için `tıklayınız.. <https://kendilinuxunuyap.github.io/_static/files/openrc/extras.tar>`_

tar dosyalarını indirdikten sonra istediğiniz bir konumda **openrc** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.

Paket adında(openrc) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build

Çalıştırılması
--------------

Openrc servis yönetiminin çalışması için boot parametrelerine yazılması gerekmektedir. 
**/boot/grub.cfg** içindeki **linux /vmlinuz init=/usr/sbin/openrc-init root=/dev/sdax** olan satırda **init=/usr/sbin/openrc-init** yazılması gerekmektedir. Artık sistem openrc servis yöneticisi tarafından uygulamalar çalıştırılacak ve sistem hazır hale getirilecek.

Basit kullanım
--------------

Servis etkinleştirip devre dışı hale getirmek için **rc-update** komutu kullanılır. Aşağıda **udhcpc** internet servisi örnek olarak gösterilmiştir. **/etc/init.d/** konumunda **udhcpc** dosyamızın olması gerekmektedir.

.. code-block:: shell

	# servis etkinleştirmek için
	$ rc-update add udhcpc boot
	# servisi devre dışı yapmak için
	$ rc-update del udhcpc boot
	# Burada udhcpc servis adı boot ise runlevel adıdır.
	
 
.. raw:: pdf

   PageBreak




rsync
+++++

rsync, dosya transferi ve senkronizasyonu için geliştirilmiş bir yazılımdır. Temel işlevi, yerel veya uzak sistemler arasında dosyaların ve dizinlerin hızlı ve verimli bir şekilde kopyalanmasını sağlamaktır. rsync, yalnızca değişen verileri transfer ederek bant genişliği kullanımını optimize eder. Bu özellik, büyük dosyaların veya dizinlerin güncellenmesi gerektiğinde önemli bir avantaj sunar.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install libzstd-dev libacl1-dev libacl1** 

komutuyla paketin kurulması gerekmektedir.


.. code-block:: shell
	
	#!/usr/bin/env bash
	version="3.2.7"
	name="rsync"
	depends="glibc,acl,openssl"
	description="shell ve network copy"
	source="https://download.samba.org/pub/rsync/src/${name}-${version}.tar.gz"
	groups="net.misc"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		./configure --prefix=/usr --libdir=/lib64/ --with-included-popt --with-included-zlib --disable-xxhash --disable-lz4
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(rsync) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




kbd
+++

KBD paketi, Linux tabanlı sistemlerde klavye ile etkileşimi yönetmek için kritik bir bileşendir. Bu paket, farklı klavye düzenlerini destekler ve kullanıcıların ihtiyaçlarına göre özelleştirilmiş tuş atamaları yapmalarına olanak tanır. Örneğin, bir kullanıcı farklı bir dilde yazmak istediğinde, KBD paketi sayesinde o dilin klavye düzenine geçiş yapabilir.


Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="kbd"
	version="2.6.4"
	description="Keytable files and keyboard utilities"
	source="https://www.kernel.org/pub/linux/utils/kbd/kbd-${version}.tar.gz"
	depends="pam"
	makedepend="flex,autoconf,automake"
	group="sys.apps"

	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"      #Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')    #Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		        mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		        rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		        cd $ROOTBUILDDIR #dizinine geçiyoruz
				wget ${source}
				for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		        dowloadfile=$(ls|head -1)
		        filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		        if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		        director=$(find ./* -maxdepth 0 -type d)
		        directorname=$(basename ${director})
		        if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		        mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		    cp -prfv $PACKAGEDIR/files $SOURCEDIR/
		autoreconf -fvi
		./configure --prefix=/usr --sysconfdir=/etc --datadir=/usr/share/kbd --enable-optional-progs
	}
	build(){
		make KEYCODES_PROGS=yes RESIZECONS_PROGS=yes
	}
	package(){
		make DESTDIR=${DESTDIR} install
		for level in boot default nonetwork shutdown sysinit ; do
		mkdir -p ${DESTDIR}/etc/runlevels/$level
		done
		install -Dm755 $SOURCEDIR/files/loadkeys.initd "$DESTDIR"/etc/init.d/loadkeys
		install -Dm755  $SOURCEDIR/files/loadkeys.initd ${DESTDIR}/etc/runlevels/default/loadkeys

		install -Dm644 $SOURCEDIR/files/loadkeys.confd "$DESTDIR"/etc/conf.d/loadkeys
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/kbd/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **kbd** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(kbd) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




kernel
++++++

Kernel, bilgisayar sistemlerinde işletim sisteminin kalbini oluşturan bir yazılım katmanıdır. Donanım kaynaklarını yönetir, sistem çağrılarını işler ve uygulama yazılımlarının donanım ile etkileşimini sağlar. Linux işletim sisteminde, kernel, çoklu görev yönetimi, bellek yönetimi, dosya sistemi erişimi ve ağ iletişimi gibi kritik işlevleri yerine getirir.

Aşağıda nasıl derlendiği detaylıca anlatılmıştır. Derleme işlemi zaman ve tecrübe gerektirdiği için hazır derlenmiş olanı kullanacağız. Aslında debian, arch vb. dağıtımların kernelini derlemeden kullanabiliriz. Bir uyumsuzluk yaratmayacaktır. Bundan dolayı kendi derlediğimiz kernelini indirip kendi sistemimize yükleyen bir işlem yapacağız. Fakat derlemek isterseniz Derleme başlığı altında paylaşılan scripti kullanabilirsiniz. Kerneli hazırladığımız sistemem kurmak için aşağıda script verilmiştir.

Debian Kernel
-------------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="6.10.6"
	name="linux-image"
	depends=""
	description="temel dağıtım kernel dosyası ve moduller"
	source=""
	groups="sys.base"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		mkdir -p $SOURCEDIR
		cd $SOURCEDIR
		wget -O kernel.bps https://github.com/basitdagitim/kly-binary-packages/raw/master/kernel/kernel-6.10.8.bps
		tar -xf kernel.bps
		tar -xf rootfs.tar.xz
	}
	build(){
		echo ""
	}
	package(){
		cd $SOURCEDIR
		cp -prfv boot  ${DESTDIR}/
		cp -prfv lib/*  ${DESTDIR}/lib/
		find ${DESTDIR}/ -iname "*" -exec unxz {} \;
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


.. raw:: pdf

   PageBreak

Kernel Derleme
--------------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="kernel-headers"
	version="6.9.9"
	description="Linux kernel"
	source="https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$version.tar.xz"
	depends="kernel"
	builddepend="rsync,bc,cpio,gettext,elfutils,pahole,perl,python,tar,xz-utils"
	group="sys.kernel"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		cp -prvf $PACKAGEDIR/files/ $SOURCEDIR/
		patch -Np1 -i $PACKAGEDIR/files/patch-$version
		cp $PACKAGEDIR/files/config $SOURCEDIR/.config
		make olddefconfig
	}
	build(){
		make bzImage -j$(nproc)
		make modules -j$(nproc)
	}
	package(){
		#-------------------------------------- 						install 			-------------------------------------
		arch="x86"
		kernelbuilddir="${DESTDIR}/lib/modules/${version}/build"
		# install bzImage
		mkdir -p "$DESTDIR/boot"
		install -Dm644 "$(make -s image_name)" "$DESTDIR/boot/vmlinuz-${version}"
		#make INSTALL_PATH=$DESTDIR install ARCH=amd64
		# install modules
		mkdir -p ${DESTDIR}/lib/modules/${version}
		mkdir -p $DESTDIR/usr/src
		mkdir -p ${DESTDIR}/lib/modules/${version}/build
		make INSTALL_MOD_PATH=$DESTDIR modules_install INSTALL_MOD_STRIP=1 -j$(nproc)
		rm "${DESTDIR}/lib/modules/${version}"/{source,build} || true
		depmod --all --verbose --basedir="$DESTDIR" "${version}" || true
		# install build directories
		install .config "$DESTDIR/boot/config-${version}"
		install -Dt "$kernelbuilddir/kernel" -m644 kernel/Makefile
		install -Dt "$kernelbuilddir/arch/$arch" -m644 arch/$arch/Makefile
		cp -t "$kernelbuilddir" -a scripts
		install -Dt "$kernelbuilddir/tools/objtool" tools/objtool/objtool
		mkdir -p "$kernelbuilddir"/{fs/xfs,mm}
		ln -s "../../lib/modules/${version}/build" "$DESTDIR/usr/src/linux-headers-${version}"
		install -Dt "$kernelbuilddir" -m644 Makefile Module.symvers System.map vmlinux
		# install libc headers
		mkdir -p "$DESTDIR/usr/include/linux"
		cp -v -t "$DESTDIR/usr/include/" -a include/linux/
		cp -v -t "$DESTDIR/usr/" -a tools/include	
		make headers_install INSTALL_HDR_PATH=$DESTDIR/usr
		#-------------------------------------- 					install headers				-------------------------------------
		mkdir -p "$kernelbuilddir" "$kernelbuilddir/arch/$arch"
		cp -v -t "$kernelbuilddir" -a include
	   	cp -v -t "$kernelbuilddir/arch/$arch" -a arch/$arch/include
		install -Dt "$kernelbuilddir/arch/$arch/kernel" -m644 arch/$arch/kernel/asm-offsets.*
		install -Dt "$kernelbuilddir/drivers/md" -m644 drivers/md/*.h
		install -Dt "$kernelbuilddir/net/mac80211" -m644 net/mac80211/*.h
		install -Dt "$kernelbuilddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h
		install -Dt "$kernelbuilddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
		install -Dt "$kernelbuilddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
		install -Dt "$kernelbuilddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h
		install -Dt "$kernelbuilddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h 		# https://bugs.archlinux.org/task/71392
		find . -name 'Kconfig*' -exec install -Dm644 {} "$kernelbuilddir/{}" \;
		find -L "$kernelbuilddir" -type l -printf 'Removing %P\n' -delete					# clearing
		find "$kernelbuilddir" -type f -name '*.o' -printf 'Removing %P\n' -delete
		#-------------------------------------- 					install 										------------------------------------
		if [[ -d "$kernelbuilddir" ]] ; then
	    while read -rd '' file; do
		case "$(file -Sib "$file")" in
		    application/x-sharedlib\;*)      # Libraries (.so)
		        strip "$file" ;;
		    application/x-executable\;*)     # Binaries
		        strip "$file" ;;
		    application/x-pie-executable\;*) # Relocatable binaries
		        strip "$file" ;;
		esac
	    done < <(find "$kernelbuilddir" -type f -perm -u+x ! -name vmlinux -print0)
		fi
		if [[ -f "$kernelbuilddir/vmlinux" ]] ; then
	    strip "$kernelbuilddir/vmlinux"
		fi
		mkdir -p "$DESTDIR/usr/src"
		ln -sr "$kernelbuilddir" "$DESTDIR/usr/src/linux"
	    mv -vf System.map $DESTDIR/boot/System.map-$version
	    find ${DESTDIR}/ -iname "*" -exec unxz {} \;
	    depmod -b "$DESTDIR" -F $DESTDIR/boot/System.map-$version $version
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/kernel/files.tar>`_ tar dosyasını indirdikten sonra istediğiniz bir konumda **kernel** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build&&sudo ./build
  
.. raw:: pdf

   PageBreak


dialog
++++++

Dialog paketi, terminal tabanlı uygulamalar için kullanıcı ile etkileşim kurmayı kolaylaştıran bir araçtır. Bu paket, kullanıcıdan bilgi almak veya kullanıcıya bilgi sunmak amacıyla çeşitli diyalog kutuları oluşturmanıza olanak tanır. Örneğin, metin kutuları, onay kutuları, seçim kutuları gibi farklı türde diyaloglar oluşturabilirsiniz.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.3-20230209"
	name="dialog"
	depends="glibc,readline,ncurses"
	description="shell box kütüphanesi"
	source="https://invisible-island.net/archives/dialog/${name}-${version}.tgz"
	groups="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
    	./configure --prefix=/usr --libdir=/lib64/ --with-ncursesw
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(dialog) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





live-boot
+++++++++

Live-boot paketi, kullanıcıların bir işletim sistemini kurmadan önce denemelerine olanak tanıyan bir araçtır. Genellikle bir USB bellek veya CD/DVD gibi taşınabilir bir ortamda bulunur. Bu paket, sistemin kurulu olduğu ortamdan bağımsız olarak çalışır ve kullanıcıların işletim sisteminin özelliklerini, performansını ve uyumluluğunu test etmelerine imkan tanır.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install po4a** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1230131"
	name="live-boot"
	depends="glibc,acl,openssl"
	description="shell ve network copy"
	source="https://salsa.debian.org/live-team/live-boot/-/archive/debian/1%2520230131/live-boot-debian-1%2520230131.tar.gz"
	groups="sys.kernel"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		echo ""
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		sed -i "s/copy_exec \/bin\/mount \/bin/copy_exec \/usr\/bin\/mount \/bin/g" $DESTDIR/usr/share/initramfs-tools/hooks/live
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(live-boot) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak






live-config
+++++++++++

Live-Config, özellikle canlı CD veya USB ortamlarında kullanılan bir yapılandırma paketidir. Bu paket, sistemin başlangıçta otomatik olarak belirli ayarlarla başlatılmasını sağlar. Örneğin, ağ ayarları, kullanıcı hesapları ve diğer sistem yapılandırmaları gibi unsurlar, Live-Config aracılığıyla önceden tanımlanabilir.

Kullanıcılar, Live-Config ile özelleştirilmiş bir canlı sistem oluşturabilir ve bu sistemin her açılışında belirli ayarların otomatik olarak uygulanmasını sağlayabilir. Bu, özellikle eğitim, test veya kurtarma senaryolarında büyük bir avantaj sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="11.0.4"
	name="live-config"
	depends="glibc,acl,openssl"
	description="shell ve network copy"
	source="https://salsa.debian.org/live-team/live-config/-/archive/debian/11.0.4/live-config-debian-11.0.4.tar.gz"
	groups="sys.kernel"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
			wget ${source}
			for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		echo ""
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(live-config) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





parted
++++++

Parted, Linux tabanlı sistemlerde disk bölümlerini oluşturmak, silmek, boyutlandırmak ve düzenlemek için kullanılan bir komut satırı aracıdır. Kullanıcıların disk alanlarını daha verimli bir şekilde yönetmelerine yardımcı olur. Parted, hem MBR (Master Boot Record) hem de GPT (GUID Partition Table) bölümlendirme şemalarını destekler.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install libparted-dev** 

komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="3.6"
	name="parted"
	depends="glibc"
	description="disks tools"
	source="https://ftp.gnu.org/gnu/parted/parted-${version}.tar.xz"
	groups="sys.block"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
		    wget ${source}
		    for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
    	./configure --prefix=/usr --libdir=/usr/lib64/ --sbindir=/usr/bin --disable-rpath --disable-device-mapper	
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(parted) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





busybox
+++++++

BusyBox, Linux tabanlı sistemlerde "İsviçre Çakısı" benzeri bir işlevsellik sunarak, çeşitli komutları tek bir ikili dosya altında toplar. 

BusyBox, ls, cp, mv, rm gibi temel komutların yanı sıra, ağ yönetimi, dosya sistemleri ve sistem yönetimi gibi birçok alanda işlevsellik sunar. Kullanıcılar, bu komutları BusyBox ile çağırarak bir dosyayı kopyalamak için aşağıdaki komut kullanılabilir:

.. code-block:: shell
	
	busybox cp kaynak_dosya hedef_dosya

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="1.36.1"
	name="busybox"
	depends="glibc"
	description="minimal linux araç paketi static derlenmiş hali"
	source="https://busybox.net/downloads/${name}-${version}.tar.bz2"
	group="sys.base"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		cp -prfv $PACKAGEDIR/files $SOURCEDIR/
		make defconfig
		sed -i "s|.*CONFIG_STATIC_LIBGCC .*|CONFIG_STATIC_LIBGCC=y|" .config
		sed -i "s|.*CONFIG_STATIC .*|CONFIG_STATIC=y|" .config
	}
	build(){ 
		make 
	}
	package(){
		mkdir -p $DESTDIR/bin
		install busybox ${DESTDIR}/bin/busybox
		mkdir -p ${DESTDIR}/usr/share/udhcpc/ ${DESTDIR}/etc/init.d/
		install $SOURCEDIR/files/udhcpc.script ${DESTDIR}/usr/share/udhcpc/default.script	 	# install udhcpc script and service	
		install $SOURCEDIR/files/udhcpc.openrc ${DESTDIR}/etc/init.d/udhcpc
		cd $DESTDIR/bin&&ln -s busybox hostname
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/busybox/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **busybox** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.


Paket adında(busybox) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





nano
++++

Nano, terminal tabanlı bir metin düzenleyici olup, GNU projesinin bir parçasıdır. Kullanıcıların metin dosyalarını kolayca oluşturmasına, düzenlemesine ve kaydetmesine olanak tanır. Nano, vi veya emacs gibi daha karmaşık metin düzenleyicilere göre daha basit bir kullanım sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	version="7.2"
	name="nano"
	depends="glibc,readline,ncurses,file"
	description="şıkıştırma kütüphanesi"
	source="https://www.nano-editor.org/dist/v7/${name}-${version}.tar.xz"
	groups="app.editor"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
		    wget ${source}
		    for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		./configure --prefix=/usr
	}
	build(){
		make 
	}
	package(){
		make install DESTDIR=$DESTDIR
		cd $DESTDIR
		mkdir -p $DESTDIR/lib
		echo "INPUT(-lncursesw)" > $DESTDIR/lib/libncurses.so
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(nano) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





grub
++++

GRUB (GRand Unified Bootloader), çoklu işletim sistemlerini destekleyen ve kullanıcıların sistemlerini başlatmalarını sağlayan bir önyükleyici yazılımıdır. GRUB yapılandırma dosyası genellikle /boot/grub/grub.cfg konumunda bulunur.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="grub"
	version="2.12"
	description="GNU GRand Unified Bootloader"
	source="https://ftp.gnu.org/gnu/grub/grub-$version.tar.xz"
	depends="glibc,readline,ncurses,xz-utils,efibootmgr"
	builddepend="rsync,freetype,ttf-dejavu"
	group="sys.boot"
	uses=(efi bios)
	uses_extra=(ia32)
	dontstrip=1
	efi_dp=(efibootmgr)
	ia32_dp=(efibootmgr)
	unset CFLAGS
	unset CXXFLAGS

	get_grub_opt(){ echo -n "--disable-efiemu "
		if [[ "$1" == "efi" ]] ; then echo -n "--with-platform=efi --target=x86_64"
		elif [[ "$1" == "ia32" ]] ; then echo -n "--with-platform=efi --target=i386"
		elif [[ "$1" == "bios" ]] ; then echo -n "--with-platform=pc"
		fi
		}
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
		        mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		        rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		        cd $ROOTBUILDDIR #dizinine geçiyoruz
		        wget ${source}
		        for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		        dowloadfile=$(ls|head -1)
		        filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		        if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		        director=$(find ./* -maxdepth 0 -type d)
		        directorname=$(basename ${director})
		        if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		        mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){	cd $ROOTBUILDDIR
	 echo depends bli part_gpt > $SOURCEDIR/grub-core/extra_deps.lst
		for tgt in ${uses[@]} ; do cp -prfv $name-$version $tgt; done
		for tgt in ${uses[@]} ; do
		    cd $tgt
		    autoreconf -fvi
		    ./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib64/ --disable-nls --disable-werror --disable-grub-themes $(get_grub_opt $tgt)
		    cd ..
		done
	}
	build(){ for tgt in ${uses[@]} ; do make $jobs -C $tgt; done	}
	package(){
		for tgt in ${uses[@]} ; do make $jobs -C $tgt install DESTDIR=$DESTDIR; done
		mkdir -p $DESTDIR/etc/default $DESTDIR/usr/bin/
		install $PACKAGEDIR/files/grub $DESTDIR/etc/default/grub
		install -vDm 755  $PACKAGEDIR/files/update-grub $DESTDIR/usr/bin/update-grub
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/grub/files.tar>`_

tar dosyasını indirdikten sonra istediğiniz bir konumda **grub** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız. Oluşturuluna dizinde yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




efibootmgr
++++++++++

efibootmgr, UEFI (Unified Extensible Firmware Interface) tabanlı sistemlerde önyükleme yöneticisi olarak işlev gören bir Linux aracıdır. Bu paket, UEFI önyükleme seçeneklerini yönetmek için kullanılır ve sistemin önyükleme sırasını, önyükleme girişlerini ve diğer ilgili ayarları düzenlemeye olanak tanır.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install libefiboot-dev** 
- **sudo cp -prfv /usr/include/efivar/* /usr/include/**

komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="efibootmgr"
	version="16"
	description="Linux user-space application to modify the Intel Extensible Firmware Interface (EFI) Boot Manager."
	source="https://github.com/rhboot/efibootmgr/archive/refs/tags/$version.tar.gz"
	depends="efivar,popt"
	builddepend=""
	group="sys.boot"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		echo ""
	}
	build(){
	    make sbindir=/usr/bin EFIDIR=/boot/efi PCDIR=/usr/lib64/pkgconfig
	}
	package(){
		EFIDIR="/boot/efi" sbindir=/usr/bin make DESTDIR="$DESTDIR" install
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(efibootmgr) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




efivar
++++++

efivar paketi, UEFI tabanlı sistemlerde, firmware ile işletim sistemi arasında veri alışverişini sağlamak için kritik bir rol oynamaktadır. UEFI, BIOS'un yerini alarak daha modern bir arayüz sunmakta ve sistem başlangıcında daha fazla esneklik sağlamaktadır. efivar, UEFI değişkenlerini okuma, yazma ve silme işlemlerini gerçekleştirmek için bir dizi komut sunar.

Derleme
--------

Debian ortamında bu paketin derlenmesi için; **sudo apt install libefivar-dev** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="efivar"
	version="39"
	description="Tools and libraries to work with EFI variables"
	source="https://github.com/rhboot/efivar/archive/refs/tags/$version.tar.gz"
	depends=""
	builddepend=""
	group="sys.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		export ERRORS=''
		export PATH=$PATH:$HOME
	    echo "exit 0" > $HOME/mandoc		# fake mandoc for ignore extra dependency
	    chmod +x $HOME/mandoc
	}
	build(){
	    make
	}
	package(){
		local make_options=(V=1 libdir=/usr/lib64/ bindir=/usr/bin/ mandir=/usr/share/man/ includedir=/usr/include/)
	    make DESTDIR=$DESTDIR "${make_options[@]}" install
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(efivar) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak





libssh
++++++

libssh, SSH protokolünü uygulamak için kullanılan açık kaynaklı bir C kütüphanesidir. Bu kütüphane, geliştiricilere güvenli bir şekilde veri iletimi, uzaktan erişim ve dosya transferi gibi işlevleri gerçekleştirme imkanı tanır. libssh, hem istemci hem de sunucu tarafında kullanılabilir ve çoklu platform desteği sunar.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="libssh"
	version="0.10.4"
	description="C library implenting the SSHv2 protocol on client and server side"
	source=("https://www.libssh.org/files/0.10/libssh-${version}.tar.xz")
	group="net.libs"
	depends="openssl,zlib"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup() {
	    cmake -S $SOURCEDIR -B $BUILDDIR -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib64 \
		-DWITH_EXAMPLES=NO -DBUILD_SHARED_LIBS=YES -DBUILD_STATIC_LIB=YES -DWITH_NACL=OFF \
		-DWITH_GCRYPT=OFF -DWITH_MBEDTLS=OFF -DWITH_GSSAPI=OFF \
		-DWITH_PCAP=OFF -DWITH_SERVER=ON -DWITH_SFTP=ON -DWITH_ZLIB=ON
	}
	build() {
	    make -C $BUILDDIR
	}
	package() {
	    make -C $BUILDDIR install DESTDIR=$DESTDIR
	    install $BUILDDIR/src/libssh.a ${DESTDIR}/usr/lib64/
	    ${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(libssh) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




openssh
+++++++

OpenSSH, Secure Shell (SSH) protokolünü uygulayan bir yazılım paketidir ve genellikle Linux ve Unix tabanlı sistemlerde kullanılır. Bu paket, kullanıcıların uzak sunuculara güvenli bir şekilde bağlanmalarını, dosya transferi yapmalarını ve uzaktan komut çalıştırmalarını sağlar. OpenSSH, veri iletimini şifreleyerek, ağ üzerinden yapılan iletişimlerin güvenliğini artırır.

OpenSSH, genellikle ssh, scp, sftp ve sshd gibi araçları içerir. 

Derleme
--------

Debian ortamında bu paketin derlenmesi için; **sudo apt install libcrypt-dev** komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="openssh"
	version="9.6p1"
	description="OpenBSD ssh server & client"
	source="https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-$version.tar.gz"
	depends="zlib,libxcrypt,openssl,libmd,libssh"
	group="net.misc"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		cp -prfv $PACKAGEDIR/files $SOURCEDIR/
		./configure --prefix=/usr --libdir=/usr/lib64/ --sysconfdir=/etc/ssh --without-pam --disable-strip \
		    --with-ssl-engine --with-privsep-user=nobody --with-pid-dir=/run --with-default-path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
	}
	build(){
		make
	}
	package(){
		make install DESTDIR=$DESTDIR
		mkdir -p "$DESTDIR"/etc/{passwd,group,sysconf,init,conf}.d
		install -m755 -D $SOURCEDIR/files/sshd.initd "$DESTDIR"/etc/init.d/sshd
		install $SOURCEDIR/files/sshd.initd  ${DESTDIR}/etc/runlevels/default/sshd
		install -m755 -D $SOURCEDIR/files/sshd.confd "$DESTDIR"/etc/conf.d/sshd
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
		sed -i "/nobody/d"  ${DESTDIR}/etc/group
		sed -i "/nobody/d"  ${DESTDIR}/etc/passwd
		mkdir -p  ${DESTDIR}/var/empty
		chown root:root  ${DESTDIR}/var/empty
		chmod 755  ${DESTDIR}/var/empty
		echo "nobody:!:65534:" >>  ${DESTDIR}/etc/group
		echo "nobody:!:65534:65534::/var/empty:/usr/sbin/nologin" >>  ${DESTDIR}/etc/passwd
		sed -i "/PermitRootLogin/d" /etc/ssh/sshd_config
		echo -e "\nPermitRootLogin yes">> /etc/ssh/sshd_config
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/openssh/files.tar>`_ 

tar dosyasını indirdikten sonra istediğiniz bir konumda **openssh** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız.

Paket adında(openssh) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build

.. raw:: pdf

   PageBreak




pam
+++

PAM, "Pluggable Authentication Modules" ifadesinin kısaltmasıdır ve Linux işletim sistemlerinde kimlik doğrulama süreçlerini esnek bir şekilde yönetmek için tasarlanmıştır. PAM, sistem yöneticilerine, kimlik doğrulama yöntemlerini modüler bir yapıda değiştirme ve özelleştirme imkanı sunar. Örneğin, bir sistem yöneticisi, kullanıcıların şifre ile kimlik doğrulamasını sağlarken, aynı zamanda iki faktörlü kimlik doğrulama gibi ek güvenlik önlemleri de ekleyebilir.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="pam"
	version="1.6.0"
	depends="libtirpc,libxcrypt,libnsl,audit"
	description="PAM (Pluggable Authentication Modules) library'"
	source="https://github.com/linux-pam/linux-pam/releases/download/v$version/Linux-PAM-$version.tar.xz"
	groups="sys.libs"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
	    ./configure --prefix=/usr --sbindir=/usr/sbin --libdir=/usr/lib64 \
		--enable-securedir=/usr/lib64/security --enable-static --enable-shared --disable-nls --disable-selinux
		}
	build(){
		make
	}
	package(){
		make install DESTDIR=$DESTDIR
		chmod +s "$DESTDIR"/usr/sbin/unix_chkpwd
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Paket adında(pam) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	sudo ./build
  
.. raw:: pdf

   PageBreak




.. _paketderleme:
Paket Derleme
=============

kernel-headers
++++++++++++++

Kernel-headers paketi, Linux çekirdeği başlık dosyalarını barındırır. Kernel-headers paketi derleme yaparsanız lazım olacaktır.

Derleme
--------

.. code-block:: shell
	
	#!/usr/bin/env bash
	name="kernel-headers"
	version="6.9.9"
	description="Linux kernel"
	source="https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$version.tar.xz"
	depends="kernel"
	builddepend="rsync,bc,cpio,gettext,elfutils,pahole,perl,python,tar,xz-utils"
	group="sys.kernel"
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum
	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	setup(){
		cp -prvf $PACKAGEDIR/files/ $SOURCEDIR/
		patch -Np1 -i $PACKAGEDIR/files/patch-$version
		cp $PACKAGEDIR/files/config $SOURCEDIR/.config
		make olddefconfig
	}
	build(){
		make bzImage -j$(nproc)
		make modules -j$(nproc)
	}
	package(){
		arch="x86"
		kernelbuilddir="${DESTDIR}/lib/modules/${version}/build"
		# install bzImage
		mkdir -p "$DESTDIR/boot"
		install -Dm644 "$(make -s image_name)" "$DESTDIR/boot/vmlinuz-${version}"
		#make INSTALL_PATH=$DESTDIR install ARCH=amd64
		# install modules
		mkdir -p ${DESTDIR}/lib/modules/${version}
		mkdir -p $DESTDIR/usr/src
		mkdir -p ${DESTDIR}/lib/modules/${version}/build
		make INSTALL_MOD_PATH=$DESTDIR modules_install INSTALL_MOD_STRIP=1 -j$(nproc)
		rm "${DESTDIR}/lib/modules/${version}"/{source,build} || true
		depmod --all --verbose --basedir="$DESTDIR" "${version}" || true
		# install build directories
		install .config "$DESTDIR/boot/config-${version}"
		install -Dt "$kernelbuilddir/kernel" -m644 kernel/Makefile
		install -Dt "$kernelbuilddir/arch/$arch" -m644 arch/$arch/Makefile
		cp -t "$kernelbuilddir" -a scripts
		install -Dt "$kernelbuilddir/tools/objtool" tools/objtool/objtool
		mkdir -p "$kernelbuilddir"/{fs/xfs,mm}
		ln -s "../../lib/modules/${version}/build" "$DESTDIR/usr/src/linux-headers-${version}"
		install -Dt "$kernelbuilddir" -m644 Makefile Module.symvers System.map vmlinux
		# install libc headers
		mkdir -p "$DESTDIR/usr/include/linux"
		cp -v -t "$DESTDIR/usr/include/" -a include/linux/
		cp -v -t "$DESTDIR/usr/" -a tools/include	
		make headers_install INSTALL_HDR_PATH=$DESTDIR/usr
		mkdir -p "$kernelbuilddir" "$kernelbuilddir/arch/$arch"
		cp -v -t "$kernelbuilddir" -a include
	   	cp -v -t "$kernelbuilddir/arch/$arch" -a arch/$arch/include
		install -Dt "$kernelbuilddir/arch/$arch/kernel" -m644 arch/$arch/kernel/asm-offsets.*
		install -Dt "$kernelbuilddir/drivers/md" -m644 drivers/md/*.h
		install -Dt "$kernelbuilddir/net/mac80211" -m644 net/mac80211/*.h
		install -Dt "$kernelbuilddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h
		install -Dt "$kernelbuilddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
		install -Dt "$kernelbuilddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
		install -Dt "$kernelbuilddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h
		install -Dt "$kernelbuilddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h 		# https://bugs.archlinux.org/task/71392
		find . -name 'Kconfig*' -exec install -Dm644 {} "$kernelbuilddir/{}" \;
		find -L "$kernelbuilddir" -type l -printf 'Removing %P\n' -delete					# clearing
		find "$kernelbuilddir" -type f -name '*.o' -printf 'Removing %P\n' -delete
		#-------------------------------------- 					install 										------------------------------------
		if [[ -d "$kernelbuilddir" ]] ; then
	    while read -rd '' file; do
		case "$(file -Sib "$file")" in
		    application/x-sharedlib\;*)      # Libraries (.so)
		        strip "$file" ;;
		    application/x-executable\;*)     # Binaries
		        strip "$file" ;;
		    application/x-pie-executable\;*) # Relocatable binaries
		        strip "$file" ;;
		esac
	    done < <(find "$kernelbuilddir" -type f -perm -u+x ! -name vmlinux -print0)
		fi
		if [[ -f "$kernelbuilddir/vmlinux" ]] ; then
	    strip "$kernelbuilddir/vmlinux"
		fi
		mkdir -p "$DESTDIR/usr/src"
		ln -sr "$kernelbuilddir" "$DESTDIR/usr/src/linux"
	    mv -vf System.map $DESTDIR/boot/System.map-$version
	    find ${DESTDIR}/ -iname "*" -exec unxz {} \;
	    depmod -b "$DESTDIR" -F $DESTDIR/boot/System.map-$version $version
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Yukarıdaki kodların sorunsuz çalışabilmesi için ek dosyayalara ihtiyaç vardır. Bu ek dosyaları indirmek için `tıklayınız. <https://kendilinuxunuyap.github.io/_static/files/kernel-headers/files.tar>`_ tar dosyasını indirdikten sonra istediğiniz bir konumda **kernel-headers** adında bir dizin oluşturun ve tar dosyasını oluşturulan dizin içinde açınınız. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build&&sudo ./build
  
.. raw:: pdf

   PageBreak




lz4
+++

LZ4, yüksek hızda veri sıkıştırma ve açma işlemleri gerçekleştiren bir algoritmadır. Genellikle, büyük veri setlerini hızlı bir şekilde sıkıştırmak ve açmak için kullanılır. LZ4, özellikle performansın kritik olduğu durumlarda tercih edilir. Örneğin, oyun verileri, veri tabanları ve ağ iletişimi gibi alanlarda sıkça kullanılır.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install liblz4-dev** 

komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
		
	#!/usr/bin/env bash
	name="lz4"
	version="1.9.4"
	description="Extremely fast compression algorithm"
	source="https://github.com/lz4/lz4/archive/refs/tags/v1.9.4.tar.gz"
	depends=""
	builddepend=""
	group="app.arch"


	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"      #Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')    #Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		        mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		        rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		        cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		        dowloadfile=$(ls|head -1)
		        filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		        if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		        director=$(find ./* -maxdepth 0 -type d)
		        directorname=$(basename ${director})
		        if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		        mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		echo ""
	}

	build(){
		cd $SOURCEDIR
		make PREFIX=/usr
	}

	package(){
		make install DESTDIR=$DESTDIR PREFIX=/usr
		mv ${DESTDIR}/usr/{lib,lib64}
	}

	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
	
Paket adında(lz4) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build

.. raw:: pdf

   PageBreak




lzo
+++

LZO (Lempel-Ziv-Oberhumer), hızlı veri sıkıştırma ve açma işlemleri için tasarlanmış bir algoritmadır. Özellikle, yüksek hızda sıkıştırma ve açma işlemleri gerektiren uygulamalarda tercih edilir. LZO, kayıpsız bir sıkıştırma yöntemi sunar; yani, sıkıştırılmış veriyi açtığınızda orijinal veriyi tam olarak geri alırsınız.

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install liblz4-dev** 

komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
		
	#!/usr/bin/env bash
	version="2.10"
	name="lzo"
	depends=""
	description="squashfs lzo"
	source="https://www.oberhumer.com/opensource/lzo/download/lzo-2.10.tar.gz"
	groups="app.shell"

	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"      #Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')    #Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		        mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		        rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		        cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		        dowloadfile=$(ls|head -1)
		        filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		        if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		        director=$(find ./* -maxdepth 0 -type d)
		        directorname=$(basename ${director})
		        if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		        mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup()
	{
		cd $SOURCEDIR
	  ./configure --prefix=/usr --enable-shared
	 
		
	}
	build()
	{
		make
	  # build minilzo
	  gcc $CPPFLAGS $CFLAGS -fpic -Iinclude/lzo -o minilzo/minilzo.o -c minilzo/minilzo.c
	  gcc $LDFLAGS -shared -o libminilzo.so.0 -Wl,-soname,libminilzo.so.0 minilzo/minilzo.o
	}
	package()
	{

	  make DESTDIR="${DESTDIR}" install

	  # install minilzo
	  install -m 755 libminilzo.so.0 "${DESTDIR}"/usr/lib
	  install -p -m 644 minilzo/minilzo.h ${DESTDIR}/usr/include/lzo
	  cd "${DESTDIR}"/usr/lib
	  ln -s libminilzo.so.0 libminilzo.so

	}


	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
	
Paket adında(lzo) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build

.. raw:: pdf

   PageBreak




squashfs-tools
++++++++++++++

squashfs-tools, Linux tabanlı sistemlerde sıkıştırılmış dosya sistemleri oluşturmak ve yönetmek için kullanılan bir araç setidir. SquashFS, özellikle depolama alanını verimli bir şekilde kullanmak amacıyla dosyaları sıkıştırarak depolayan bir dosya sistemidir. Bu paket, mksquashfs ve unsquashfs gibi komutları içerir. 

Derleme
--------

Debian ortamında bu paketin derlenmesi için;

- **sudo apt install liblz4-dev** 

komutuyla paketin kurulması gerekmektedir.

.. code-block:: shell
		
	#!/usr/bin/env bash
	version="4.6.1"
	name="squashfs-tools"
	depends="squashfs"
	description="squashfs"
	source="https://github.com/plougher/squashfs-tools/archive/refs/tags/4.6.1.tar.gz"
	groups="app.shell"

	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"      #Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')    #Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		cd $ROOTBUILDDIR #dizinine geçiyoruz
		wget ${source}
		for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		directorname=$(basename ${director})
		if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}

	setup(){
		cd $SOURCEDIR/squashfs-tools
	}

	build(){
		make GZIP_SUPPORT=1 LZ4_SUPPORT=1 LZMA_XZ_SUPPORT=1 LZO_SUPPORT=1 XATTR_SUPPORT=1 XZ_SUPPORT=1 ZSTD_SUPPORT=1
	}
	package(){
	  	make INSTALL_PREFIX="$DESTDIR/usr" INSTALL_MANPAGES_DIR='$(INSTALL_PREFIX)/share/man/man1' install
	  	install -vDm 644 $SOURCEDIR/{ACTIONS-README,CHANGES,"README-$version",USAGE*} -t "$DESTDIR/usr/share/doc/$name/"
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
	
Paket adında(squashfs-tools) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.

.. code-block:: shell
	
	chmod 755 build
	sudo ./build

.. raw:: pdf

   PageBreak




.. _paketsistemi:

**Paket Sitemi**
++++++++++++++++

Paket yönetim sistemleri bir dağıtımda bulunan en temel parçadır.
Sistem üzerine paket kurma ve kaldırma güncelleme yapma gibi işlemlerden sorumludur.
Başlıca 2 tip paket sistemi vardır:

* Binary (ikili) paket sistemi
* Source (kaynak) paket sistemi

Bir paket sistemi hem binary hem source paket sistemi özelliklerine sahip olabilir. Bununla birlikte son kullanıcı dağıtımlarında genellikle binary paket sistemleri tercih edilir.


**Binary Paket Sistemi**
------------------------

Bu tip paket sistemlerinde önceden derlenmiş olan paketler hazır şekilde indirilir ve açılarak sistem ile birleştirilir. 
Binary paket sistemlerinde paketler önceden derleme talimatları ile oluşturulmalıdır.

Binary paket sistemine örnek olarak **apt**, **dnf**, **pacman** örnek verilebilir.

**Source Paket Sistemi**
------------------------

Bu tip paket sistemlerinde derleme talimatları kurulum yapılacak bilgisayar üzerinde kullanılarak paketler kurulum yapılacak bilgisayarda oluşturulur ve kurulur.

Source paket sistemine örnek olarak **portage** örnek verilebilir.


**Paket sisteminin temel yapısı**
---------------------------------

Dağıtımlarda uygulamalar paketler halinde hazırlanır. Bu paketleri dağıtımda kullanabilmek için temel işlemler şunlardır;

1. Paket Oluşturma
2. Paket Liste İndexi Güncelleme
3. Paket Kurma
4. Paket Kaldırma
5. Paket Yükseltme gibi işlemleri yapan uygulamaların tamamı paket sistemi olarak adlandırılır.

Paket sisteminde, uygulama paketi haline getirilip sisteme kurulur. Genelde paket sistemi dağıtımın temel bir parçası olması sebebiyle üzerinde yüklü gelir.

Bazı dağıtımların kullandığı paket sistemeleri şunlardır.

- apt: Debian dağıtımının kullandığı paket sistemi.
- emerge :Gentoo dağıtımının kullandığı paket sistemi.

**bps Paket Sistemi**
---------------------

Bu dokümanda hazırlanan dağıtımın paket sistemi için ise bps(basit/basic/base paket sistemi) olarak ifade edeceğimiz paket sistemi adını kullandık. Bps paket sistemindeki beş temel işlemin nasıl yapılacağı ayrı başlıklar altında anlatılacaktır. Paket sistemi derlemeli bir dil yerine bash script ile yapılacaktır. Bu dokumanı takip eden kişi, bu dokümanda yazılanları anlaması için orta seviye bash script bilmesi gerekmektedir.


.. raw:: pdf

   PageBreak


Paket Oluşturma
+++++++++++++++

Paket sisteminde en önemli kısımlardan birisi paket oluşturmadır. Bu işlem paketin derlenmesi ve derlenmiş paketin belirli bir yapıyla saklanması olayıdır. Bu saklanan paket daha sonra ihtiyaç halinde uzaktan(internet üzerinden) ve yerelden istediğimiz sisteme kurma işlemidir. Bu başlıkta paketin derlenmesi ve saklanması(paket oluşturma) anlatılacaktır.

Paket oluşturma işlemi sırayla şu aşamalardan oluşmaktadır.

1. Paketin indirilmesi
2. Paketin derleme öncesi hazırlanması(configure)
3. Paketin derlenmesi
4. Derlenmiş paketin bir dizine yüklenmesi
5. Yüklenen dizindeki dosya ve dizin yapısının konum listesini tutan file.index oluşturulması
6. Derlenmiş paketin bir dizinin sıkıştırılması
7. Sıkıştırılmış derlenmiş dizin, file.index ve derleme talimatının paket isim ve versiyonuyla tekrardan sıkıştırılması

Burada maddeler halinde anlatılan işlem adımlarını bir paket oluşturma amacıyla sırasıyla yapmamız gerekmektedir. 7. maddede anlatılan son sıkıştırılma öncesi yapı aşağıda gösterilmiştir.

.. image:: /_static/images/bpspaketle-0.png
  	:width: 600


.. raw:: pdf

   PageBreak
   

**bps Paket Oluşturma**
-----------------------

bps paket sisteminin temel parçalarından en önemlisi paket oluşturma uygulamasıdır. Dokümanda temel paketlerin nasıl derlendiği **Paket Derleme** başlığı altında anlatılmıştı. Bir paket üzerinden(readline) örneklendirerek paketimizi oluşturacak scriptimizi yazalım.

Dokümanda readline paketi nasıl derleneceği aşağıdaki script olarak verilmiştir.

.. code-block:: shell

	#!/usr/bin/env bash
	version="8.2"
	name="readline"
	depends="glibc"
	description="readline kütüphanesi"
	source="https://ftp.gnu.org/pub/gnu/readline/${name}-${version}.tar.gz"
	groups="sys.apps"
	
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display
	ROOTBUILDDIR="/home/$user/distro/build" # Derleme konumu
	BUILDDIR="/home/$user/distro/build/build-${name}-${version}" #Derleme yapılan paketin derleme konumun
	DESTDIR="/home/$user/distro/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd) #paketin derleme talimatının verildiği konum
	SOURCEDIR="/home/$user/distro/build/${name}-${version}" #Paketin kaynak kodlarının olduğu konum

	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
            wget ${source}
            for f in *\ *; do mv "$f" "${f// /}"; done #isimde boşluk varsa silme işlemi yapılıyor
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $SOURCEDIR
	}
	
	setup(){
		cp -prvf $PACKAGEDIR/files $SOURCEDIR/
		./configure --prefix=/usr \
			--libdir=/usr/lib64
	}

	build(){
		make SHLIB_LIBS="-L/tools/lib -lncursesw"
	}

	package(){
		make SHLIB_LIBS="-L/tools/lib -lncursesw" DESTDIR="$DESTDIR" install pkgconfigdir="/usr/lib64/pkgconfig"
		
		install -Dm644 $SOURCEDIR/files/inputrc "$DESTDIR"/etc/inputrc
		${DESTDIR}/sbin/ldconfig -r ${DESTDIR}           # sistem guncelleniyor
	}
	initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
	setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
	build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
	package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.


Bu script readline kodunu internetten indirip derliyor ve kurulumu yapıyor. Aslında bu scriptle **paketleme**, **paket kurma** işlemini bir arada yapıyor. Bu işlem mantıklı gibi olsada paket sayısı arttıkça ve rutin yapılan işlemleri tekrar tekrar yapmak gibi işlem fazlalığına sebep olmaktadır.

Bu sebeplerden dolayı **readline** paketleme scriptini yeniden düzenleyelim. Yeni düzenlenen halini  **bpspaketle** ve **bpsbuild** adlı script dosyaları olarak düzenleyeceğiz. Genel yapısı aşağıdaki gibi olacaktır. Script dosyasının yeniden bpspaketle ve bpsbuild şeklinde ayrıştırılmış hali resimde gözükmektedir. Devamında ise **packageindex** ve **packagecompress** fonksiyonları bpspaketle dosyasına eklenecektir.

.. image:: /_static/images/bpspaketle-1.png
  	:width: 600


**bpsbuild** Dosyası
--------------------

.. code-block:: shell
	
	setup()	{}
	build()	{}
	package() {}

**bpspaketle** Dosyası
----------------------

.. code-block:: shell
	
	#genel değişkenler tanımlanır
	initsetup() {}
	
	#bpsbuild dosya fonksiyonları birleştiriliyor
	source bpsbuild # bu komutla setup build package fonsiyonları bpsbuild doyasından alınıp birleştiriliyor
	
	packageindex() {}
	packagecompress() {}

.. raw:: pdf

   PageBreak
   
Aslında yukarıdaki **bpspaketle** ve **bpsbuild** adlı script dosyaları tek bir script dosyası olarak **bpspaketle** dosyası. İki dosyayı birleştiren **source bpsbuild** komutudur. **bpspaketle** dosyası aşağıdaki gibi düşünebiliriz.

.. code-block:: shell
	
	#genel değişkenler tanımlanır
	initsetup() {}
	
	setup()	{} #bpsbuild dosyasından gelen fonksiyon, "source bpsbuild" komutu sonucu gelen fonksiyon
	build()	{} #bpsbuild dosyasından gelen fonksiyon, "source bpsbuild" komutu sonucu gelen fonksiyon
	package() {} #bpsbuild dosyasından gelen fonksiyon, "source bpsbuild" komutu sonucu gelen fonksiyon
	
	packageindex() {}
	packagecompress() {}

Bu şekilde ayrılmasının temel sebebi  **bpspaketle** scriptinde hep aynı işlemler yapılırken **bpsbuild** scriptindekiler her pakete göre değişmektedir. Böylece paket yapmak için ilgili pakete özel **bpsbuild** dosyası düzenlememiz yeterli olacaktır. **bpspaketle** dosyamızda **bpsbuild** scriptini kendisiyle birleştirip paketleme yapacaktır.

**bpsbuild** Dosyamızın Son Hali
----------------------------------

.. code-block:: shell

	#!/usr/bin/env bash
	version="8.2"
	name="readline"
	depends="glibc"
	description="readline kütüphanesi"
	source="https://ftp.gnu.org/pub/gnu/readline/${name}-${version}.tar.gz"
	groups="sys.apps"
	#2. madde, derleme öncesi hazırlık 
	setup(){
		cp -prvf $PACKAGEDIR/files $BUILDDIR/
		$SOURCEDIR/configure --prefix=/usr \
			--libdir=/usr/lib64
	}
	#3. madde, paketin derlenmesi 	
	build(){
		make SHLIB_LIBS="-L/tools/lib -lncursesw"
	}
	#4. madde, derlenen paketin bir dizine yüklenmesi 
	package(){
		make SHLIB_LIBS="-L/tools/lib -lncursesw" DESTDIR="$DESTDIR" install pkgconfigdir="/usr/lib64/pkgconfig"
		
		install -Dm644 files/inputrc "$DESTDIR"/etc/inputrc
	}



**bpspaketle** Dosyamızın Son Hali
----------------------------------

.. code-block:: shell
	
	#!/usr/bin/env bash
	set -e
	paket=$1
	dizin=$(pwd)
	if [ ! -d ${paket} ]; then echo "Bir paket değil!"; exit; fi
	if [ ! -f "${paket}/bpsbuild" ]; then echo "Paket dosyası bulunamadı!"; exit; fi
	echo "Paket : $paket"
	source ${paket}/bpsbuild
	ROOTBUILDDIR="/tmp/bps/build"
	BUILDDIR="/tmp/bps/build/build-${name}-${version}" #Derleme yapılan dizin
	DESTDIR="/tmp/bps/rootfs" #Paketin yükleneceği sistem konumu
	PACKAGEDIR=$(pwd)
	SOURCEDIR="/tmp/bps/build/${name}-${version}"
	#1. madde, paketin indirilmesi
	initsetup(){
		    mkdir -p  $ROOTBUILDDIR #derleme dizini yoksa oluşturuluyor
		    rm -rf $ROOTBUILDDIR/* #içeriği temizleniyor
		    cd $ROOTBUILDDIR #dizinine geçiyoruz
		    wget ${source}
		    dowloadfile=$(ls|head -1)
		    filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		    if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		    director=$(find ./* -maxdepth 0 -type d)
		    directorname=$(basename ${director})
		    if [ "${directorname}" != "${name}-${version}" ]; then mv $directorname ${name}-${version};fi
		    mkdir -p $BUILDDIR&&mkdir -p $DESTDIR&&cd $BUILDDIR
	}


	#6. madde, paketlenecek dosların listesini tutan file.index dosyası oluşturulur
	packageindex() 
		rm -rf file.index
		cd /tmp/bps/build/rootfs-${name}-${version}
		find . -type f | while IFS= read file_name; do if [ -f ${file_name} ]; then echo ${file_name:1}>>../file.index; fi done
		find . -type l | while IFS= read file_name; do if [ -L ${file_name} ]; then echo ${file_name:1}>>../file.index; fi done
	}

	# paket dosyası oluşturulur;
	# kurulacak data rootfs.tar.xz, file.index ve bpsbuild dosyaları tek bir dosya olarak tar.gz dosyası olarak  hazırlanıyor.
	
	#7. madde, tar.gz dosyası olarak hazırlanan dosya bps ismiyle değiştirilip paketimiz hazırlanır.
	packagecompress() 
	{
	cd /tmp/bps/build/rootfs-${name}-${version}
	tar -cf ../rootfs.tar ./*
	cd /tmp/bps/build/
	xz -9 rootfs.tar
	tar -cvzf paket-${name}-${version}.tar.gz rootfs.tar.xz file.index bpsbuild
	cp paket-${name}-${version}.tar.gz ${dizin}/${paket}/${name}-${version}.bps
	}

	# fonksiyonlar aşağıdaki sırayla çalışacaktır.
	
	initsetup #bu dosya içindeki fonksiyon (indirilmesi)
	setup #bpsbuild dosyasından gelen fonksiyon (derleme öncesi hazırlık)
	build #bpsbuild dosyasından gelen fonksiyon (derleme)
	package #bpsbuild dosyasından gelen fonksiyon (derlenen paketin dizine yüklenemesi)
	packageindex #bu dosya içindeki fonksiyon (dizine yüklelen paketin indexlenmesi)
	packagecompress #bu dosya içindeki fonksiyon (index.lst, derleme talimatı ve dizinin sıkıştırılmas)

Burada **readline** paketini örnek alarak **bpspaketle** dosyasının ve **bpsbuild** dosyasının nasıl hazırlandığı anlatıldı.
Diğer paketler için sadece hazırlanacak pakete uygun şekilde **bpsbuild** dosyası hazırlayacağız. **bpspaketle**  dosyamızda değişiklik yapmayacağız. Artık  **bpspaketle**  dosyası paketimizi oluşturan script **bpsbuild** ise hazırlanacak paketin bilgilerini bulunduran script doyasıdır.

.. raw:: pdf

   PageBreak
   
**Paket Yapma**
---------------

Bu bilgilere göre readline paketi nasıl oluşturulur onu görelim. Paketlerimizi oluşturacağımız bir dizin oluşturarak aşağıdaki işlemleri yapalım. Burada yine **readline** paketi anlatılacaktır.


.. code-block:: shell

	mkdir readline
	cd readline
	#readline için hazırlanan bpsbuild dosyası bu konuma oluşturulur ve içeriği readline için oluşturduğumuz bpsbuild dosyası bu konuma kopyalayın
	cd ..
	./bpspaketle readline # bpspaketle dosyamızın bu konumda olduğu varsayılmıştır ve parametre olarak readline dizini verilmiştir.

Komut çalışınca readline/readline-8.1.bps dosyası oluşacaktır. Aşağıda resimde nasıl yapıldığı gösterilmiştir. Burada anlatılan **bpspaketle** script dosyasını **/bin/** konumuna oluşturnuz ve **chmod 755 /bin/bpspaketle** komutuyla çalıştırma izni vermeliyiz. **bps** paket sistemi için yapılacak olan **bsppaketle, bpsupdate, bpskur, bpskaldir** scriptlerinide **/bin/** konumunda oluşturulmalı veya kopyalanmalı ve çalıştırma izni verilmeli.

.. image:: /_static/images/bpspaketle-2.png
  	:width: 600

Artık sisteme kurulum için ikili dosya, kütüphaneleri ve dizinleri barındıran paketimiz oluşturuldu. Bu paketi sistemimize nasıl kurarız? konusu **Paket Kurma** başlığı altında anlatılacaktır.

.. raw:: pdf

   PageBreak


Depo indexleme
++++++++++++++

Depo paketlerimizin olduğu alandır. Paketler genel olarak;

1. Sıkıştırılmış bir dosyadır
2. İçerisinde sisteme yüklenecek derlenmiş paket dizini(sıkıştırılmış olur genelde)
3. Sisteme yüklenecek derlenmiş paket dizini içindeki dosyaların ve dizinleri konumu ve listesi(file.LST)
4. Paket derleme talimatı.

Depoada ne kadar paket varsa bunların isimleri sürüm numaraları gibi bilgiler ile adreslerini liste halinde oluşturma işlemine **depo indexleme** denir.
Depo indexlenirken genellikle bilgiler **paket derleme talimatı** dosyasından alınır.
Paketlerin listesi oluşturlduktan sonra paketler kurulurken, silinirken ve güncellenirken bu listeden yararlanılır.

.. code-block:: yaml

	Name: bash
	Version: 1.0
	Dependencies: glibc, ncurses, readline
	Path: b/bash/bash_1.0.zip
	
	Name: test
	Version: 1.1
	Dependencies:
	Path: t/test/test_2.0.zip
	
	...

Yukarıdaki örnekte paket adı bilgisi sürüm bilgisi ve bağımılılıklar gibi bilgiler ile paketin sunucu içerisindeki konumu yer almaktadır.
Depo indexi paketlerin içinde yer alan paket bilgileri okunarak otomatik olarak oluşturulur.

Örneğin paketlerimiz zip dosyası olsun ve paket bilgisini **build** dosyası taşısın. Aşağıdaki gibi depo indexi alabiliriz.

.. code-block:: shell

	function index {
	    > index.txt
	    for i in $@ ; do
	        unzip -p $i build >> index.txt
	        echo "Path: $i" >> index.txt
	    done
	}
	
	index t/test/test_2.0.zip b/bash/bash_1.0.zip ...

Bu örnekte paketlerin içindeki paket bilgisi içeren dosyaları uç uca ekledik.
Buna ek olarak paketin nerede olduğunu anlamak için paket konumunu da ekledik. Çıktısı aşağıdaki gibidir.

.. code-block:: shell

	Path: t/test/test_2.0.zip
	Path: b/bash/bash_1.0.zip

.. raw:: pdf

   PageBreak


bps github Depo Yapma
---------------------

Bu doküman kullanılarak hazırlanan paketleri bilgisayarınızda bir dizinde tutabiliriz. Fakat bu çok kısıtlı bir sistem olmasına sebep olacaktır. Paketleri bir internet ortamında bir yerde saklayarak, kurmak istediğimizde internet(uzak) üzwerinden kurulması daha doğru bir yöntemdir. Bu dağıtımda paketlerimizi github.com üzerinde oluşturulan bir repostory üzerinden çekilmektedir. İnternetteki paketlerimizin listesi her yeni paketi yükleme sırasında güncellenmektedir. Bu işlem github hesabı üzerinden yapılmaktadır. github hakkında temel işlemler için `tıklayınız. <../10.yardimci-konular/39-github.html>`_

**github üzerinde depolamak için;**

- github hesabı açılır(basitdagitim)
- github repository oluşturulur(kly-binary-packages)
- kly-binary-packages deposuna aşağıda verilen index dosyasını oluşturunuz.
- kly-binary-packages deposuna .github/workflows dizinini ouşturarak aşağıda verilen main.yml dosyasını oluşturunuz.
- internet üzerinden kly-binary-packages reposunda settings->action->general->Workflow permissions->Read and write permissions  işaretlenmelidir.
- Yapılan paketler github üzerinde gönderilmelidir.

index Dosyası
-------------

Bu script bps paket dosyalarımızın olduğu dizinde tüm paketleri açarak içerisinden **bpsbuild** dosyalarını çıkartarak paketle ilgili bilgileri alıp **index.lst** dosyası oluşturmaktadır. istersek paketler local ortamdada index oluşturabiliriz. Bu dokümanda github üzerinde oluşturacak şekilde anlatılmıştır.Paket indeksi oluşturan **index.lst** dosyası aşağıdaki gibi olacaktır. Listede name, version ve depends(bağımlı olduğu paketler) bilgileri bulunmaktadır. Bilgilerin arasında **|** karekteri kullanılmıştır.

.. code-block:: shell

	#!/bin/sh
	#set -ex
	mkdir /output -p
	mkdir -p /bpssource
	>index.lst
	find * -type f -name *.bps |
			while IFS= read file_name; do
				dosya="$(dirname $file_name)/bpsbuild"
				version=$(cat $dosya|grep version=)
				name=$(cat $dosya|grep name=)
				depends=$(cat $dosya|grep depends=)
				echo "$name|$version|$depends|$(dirname $file_name)">>index.lst
			done
	cp -rf index.lst /output

	# *****************************source files******************************
	cp -prfv ./* /bpssource/

	find /bpssource/* -type f -name *.bps |
			while IFS= read file_name; do
			rm -rf "$file_name"
			done
	tar -cf /output/bpssourcepackage.tar /bpssource/
	rm -rf /bpssource


index.lst İçeriği
.................

https://github.com/basitdagitim/kly-binary-packages/releases/download/current/index.lst adresinde bulunan dosya aşağıdaki gibi liste oluşturacaktır.

.. code-block:: shell

	name="acl"|version="2.3.1"|depends="attr"|acl
	name="attr"|version="2.5.1"|depends=""|attr
	name="audit"|version='3.1.1'|depends=""|audit
	name="bash"|version="5.2.21"|depends="glibc,readline,ncurses"|bash

main.yml
--------

.. code-block:: shell

	name: CI

	on:
	  push:
		branches: [ master ]
	  schedule:
		- cron: "0 0 1 2 6"

	jobs:
		compile:
		    name: depoindex
		    runs-on: ubuntu-latest
		    steps:
		      - name: Check out the repo
		        uses: actions/checkout@v2
		      - name: Run the build process with Docker
		        uses: addnab/docker-run-action@v3
		        with:
		            image: debian:testing
		            options: -v ${{ github.workspace }}:/root -v /output:/output
		            run: |
		                cd /root
		                sh index
		      - uses: "marvinpinto/action-automatic-releases@latest"
		        with:
		            repo_token: "${{ secrets.GITHUB_TOKEN }}"
		            automatic_release_tag: "current"
		            prerelease: false
		            title: "Latest release"
		            files: |
		              /output/*


.. raw:: pdf

   PageBreak



index Güncelleme
++++++++++++++++

İndex güncelleme uzak(internet) depodaki paketlerin index listesinin yerelde tutulan index dosyasıyla eşitlemek işlemidir.
Depoda olan paketlerin listesi yerelde tutulan index.lst dosyasındada olması gerekmetedir. Bu işlemi yapan bpsupdate dosya içeriği aşağıdadır.

**bpsupdate** 
-------------

.. code-block:: shell
	
	#!/bin/sh
	curl -Lo /etc/bps/index.lst https://github.com/basitdagitim/kly-binary-packages/releases/download/current/index.lst

**index.lst** dosyamızı github üzerinden indiren scriptimiz tek bir satırdan oluşmaktadır. Bu hali şimdilik ihtiyacımızı görecektir.
Bu komut https://github.com/basitdagitim/kly-binary-packages/releases/download/current/index.lst adresindeki dosyayı index.lst dosyasını /etc/bps/index.lst konumuna indirecektir.

Fakat birden fazla depo(github repository) olması durumunda birazdah karmaşık bir yapısı olacaktır. Bu durumda debian sisteminde /etc/apt/source.list gibi bir yapıkullanılarak her depo indexi çekilip tek bir index.lst dosyası oluşturulabilir. Bu sistem için ise /etc/bps/source.list dosyası kullanılmaktadır. Birden fazla index dosyasını birleştiren ve güncelleyen scriptimiz aşağıdadır.
 
.. code-block:: shell
	
	#!/bin/sh
	curl -Lo /tmp/index.lst https://github.com/basitdagitim/kly-binary-packages/releases/download/current/index.lst
	target=""
	if [ -n "${1}" ];then target="$1"; else target="/";fi
	mkdir -p $target/etc/bps
	rm -rf $target/etc/bps/index.lst
	rm -rf $target/tmp/temp.lst
	while IFS= read -r adres
	do
	rm -rf $target/tmp/temp.lst 1>$target/dev/null 2>$target/dev/null
	github_adres=$(echo $adres|cut -d"/" -f1)
	binary_package_adres=$(echo $adres|cut -d"/" -f2)
	#echo $github_adres
	#echo $binary_package_adres

	curl -Lo /tmp/temp.lst "https://github.com/${github_adres}/${binary_package_adres}/releases/download/current/index.lst"
	if [ ! -f "$target/tmp/temp.lst"  ]; then echo "Paket adresleri hatalı /etc/bps/sources.list dosya içeriğini kontrol ediniz!"; continue; fi

		while IFS= read -r liste
		do
			echo "${liste}|https://github.com/${adres}/raw/master/">>$target/etc/bps/index.lst
		done < $target/tmp/temp.lst
		
	done < $target/etc/bps/sources.list
    
**bpsupdate** Kullanma
----------------------

Script bir parametre almaktadır. Parametremiz --update veya -u olmalıdır. Bu scripti kullanarak /etc/bps/index.lst dosyasını github depomuzdaki paket listesiyle güncelleyecektir. 

.. code-block:: shell
	
	./bpsupdate -u	


.. raw:: pdf

   PageBreak



Paket Kurma
+++++++++++

Hazırlanan dağıtımda paketlerin kurulması için  sırasıyla aşağıdaki işlem adımları yapılmalıdır.

1. Paketin indirilmesi
2. İndirilen paketin /tmp/bps/kur/ konumunda açılması
3. Açılan paket dosyalarının / konumuna yüklenmesi(kopyalanması)

	- Paketin bağımlı olduğu paketler varmı kontrol edilir
	- Yüklü olmayan bağımlılıklar yüklenir
	
4. Yüklenen paket bilgileri(name, version ve bağımlılık) yüklü paketlerin index bilgilerini tutan paket sistemi dizininindeki index dosyasına eklenir.	
5. Açılan paket içindeki yüklenen dosyaların nereye yüklendiğini tutan file.index dosyası paket sistemi dizinine yüklenir


Bu işlemler daha detaylandırılabilir. Bu işlemlerin detaylı olması paket sisteminin kullanılabilirliğini ve yetenekleri olarak ifade edebiliriz. İşlem adımlarını kolaylıkla sıralarken bunları yapacak script yazmak ciddi planlamalar yapılarak tasarlanması gerekmektedir.


Örneğin bir paketimiz zip dosyası olsun ve içinde dosya listesini tutan **file.index** adında bir dosyamız olsun. Paketi aşağıdaki gibi kurabiliriz.

.. code-block:: shell

	cd /tmp/kur/
	unzip /dosya/yolu/paket.zip
	cp -rfp ./* /
	cp file.index /paket/veri/yolu/paket.index

- Bu örnekte ilk satırda geçici dizine gittik 
- Paketi oraya açtık.
- Paket içeriğini kök dizine kopyaladık.
- Paket dosya listesini verilerin tutulduğu yere kopyaladık.

Bu işlemden sonra paket kurulmuş oldu.


.. raw:: pdf

   PageBreak

**bps Paket Kurma Scripti Tasarlama**
-------------------------------------
Burada basit seviyede kurulum yapan script kullanılmıştır. Detaylandırıldıkça doküman güncellenecektir. Kurulum scripti aşağıda görülmektedir.

Paket kurulurken paket içerisinde bulunan dosyalar sisteme kopyalanır.
Daha sonra istenirse silinebilmesi için paket içeriğinde dosyaların listesi tutulur.
Bu dosya ayrıca paketin bütünlüğünü kontrol etmek için de kullanılır.


**bpskur** Scripti
..................

.. code-block:: shell
	
	#!/bin/sh
	#set -e
	paket=$1
	paketname="name=\"${paket}\""
	ROOTFS=$2
	#echo "$paket"
	indexpaket=$(cat /etc/bps/index.lst|grep $paketname)
	name=""
	version=""
	depends=""
	if [ -n "${indexpaket}" ]
		then
			namex=$(echo $indexpaket|cut -d"|" -f1)
			versionx=$(echo $indexpaket|cut -d"|" -f2)
			dependsx=$(echo $indexpaket|cut -d"\|" -f3)
			name=${namex:6:-1}
			version=${versionx:9:-1}
			depends=${dependsx:9:-1}
		else
		echo "***********Paket Bulunamadı**********"; exit
	fi

	# 1. adım paketi indirme
	mkdir -p /tmp/bps
	mkdir -p /tmp/bps/kur
	rm -rf /tmp/bps/kur/*
	curl -Lo /tmp/bps/kur/${name}-${version}.tar.gz https://github.com/basitdagitim/kly-binary-packages/raw/master/${name}/${name}-${version}.bps
	
	mkdir -p /var/lib/bps
	cd /tmp/bps/kur/

	#2. adım paketi açma
	tar -xf ${name}-${version}.tar.gz
	mkdir -p rootfs
	tar -xf rootfs.tar.xz -C rootfs

	#3. adım  paketi kurma
	cp -prfv rootfs/* $ROOTFS/

	#4. adım name version depends /var/lib/bps/index.lst eklenmesi
	echo "name=\"${name}\":"version=\"${version}\":"depends=\"${depends}\"">>var/bps/index.lst
	# 5. adım paket içinde gelen paket dosyalarının dosya ve dizin yapısını tutan file index dosyanının /var/lib/bps/ konumuna kopyalanması
	cp file.index /var/lib/bps/${name}-${version}.lst



**bpskur** Scriptini Kullanma
.............................

Script iki parametre almaktadır. İlk parametre paket adı. İkinci parametremiz ise nereye kuracağını belirten hedef olmalıdır. Bu scripti kullanarak readline paketi aşağıdaki gibi kurulabilir. 

.. code-block:: shell
	
	./bpskur readline /	

.. raw:: pdf

   PageBreak



Paket Kaldırma
++++++++++++++

Sistemde kurulu paketleri kaldırmak için işlem adımları şunlardır.

1. Paketin kullandığı bağımlılıkları başka paketler kullanıyor mu kontrol edilir. Eğer kullanılmıyorsa kaldırılır.
2. Paketin paket.LIST dosyası içerisindeki dosyalar, dizinler kaldırılır.
3. Kaldırılan dosyalardan sonra /paket/veri/yolu/paket.LIST dosyasından paket bilgisi kaldırılır.
4. sistemde kurulu paketler index dosyasından ilgili paket satırı kaldırılmalıdır.


Paketi kaldırmak için ise aşağıdaki örnek kullanılabilir.

.. code-block:: shell

	cat /paket/veri/yolu/paket.LIST | while read dosya ; do
	    if [[ -f "$dosya" ]] ; then
	        rm -f "$dosya"
	    fi
	done
	cat /paket/veri/yolu/paket.LIST | while read dizin ; do
	    if [[ -d "$dizin" ]] ; then
	        rmdir "$dizin" || true
	    fi
	done
	rm -f /paket/veri/yolu/paket.LIST

Bu örnekte paket listesini satır satır okuduk. Önce dosya olanları sildik.
Daha sonra tekrar okuyup boş kalan dizinleri sildik.
Son olarak palet listesi dosyamızı sildik.
Bu işlem sonunda paket silinmiş oldu.


.. raw:: pdf

   PageBreak
   

**bps Paket Kaldırma Scripti Tasarlama**
----------------------------------------

Dokumanda örnek olarak verilen bps paket sistemi için yukarıdaki paket kaldırma bilgilerini kullanarak tasarlanmıştır.

**bpskaldir** scripti
.....................

.. code-block:: shell
	
	#!/bin/sh
	#set -e
	paket=$1
	paketname="name=\"${paket}\""
	indexpaket=$(cat /var/lib/bps/index.lst|grep $paketname)
	name=""
	version=""
	depends=""
	if [ -n "${indexpaket}" ]; then
		namex=$(echo $indexpaket|cut -d":" -f1)
		versionx=$(echo $indexpaket|cut -d":" -f2)
		dependsx=$(echo $indexpaket|cut -d":" -f3)
		name=${namex:6:-1}
		version=${versionx:9:-1}
		depends=${dependsx:9:-1}
	else
		echo "***********Paket Bulunamadı**********"; exit
	fi
	# Bağımlılıkları başka paketler kullanıyor mu kontrol edilir
	echo "bağımlılık kontrolü yapılacak"
	 
	# Paketin file.lst dosyası içerisindeki dosyalar, dizinler kaldırılır.
	cat /var/lib/bps/${paket}-${version}.lst | while read dosya ; do if [[ -f "$dosya" ]] ; then rm -f "$dosya"; fi done
	cat /var/lib/bps/${paket}-${version}.lst  | while read dizin ; do if [[ -d "$dizin" ]] ; then rmdir "$dizin" || true; fi done

	#/var/lib/bps/paket-version.lst dosyasından paket bilgisi kaldırılır.
	rm -f /var/lib/bps/${paket}-${version}.lst
	#/var/lib/bps/index.lst dosyasından ilgili paket satırı kaldırılır.
	sed '/^name=\"${paket}\"/d' /var/lib/bps/index.lst
	
Bağımlılıkları başka paketler kullanıyor mu kontrol edilir. Script içinde bu işlem yapılmamıştır. Daha sonra güncellenecektir.
Bu örnekte paket listesini satır satır okuduk. Önce dosya olanları sildik.
Daha sonra tekrar okuyup boş kalan dizinleri sildik.
Son olarak paket listesi dosyamızı sildik.
Bu işlem sonunda paket silinmiş oldu.

**bpskaldir** Kullanma
......................

**bpskaldir** scripti aşağıdaki gibi kullanılır.

.. code-block:: shell
	
	./bpskaldir readline

.. raw:: pdf

   PageBreak


.. _paketsistemi:
Paket Sistemi
=============

İso Hazırlama
+++++++++++++

Önceki bölümlerde paketler derlendi. Bu paketler oturum açtığınız kullanıcı ev dizinde **$HOME/distro/rootfs** konumunda olacaktır. Burada **$HOME** açık olan kullanıcı neyse onun konumunu verecektir. Örneğin kullanıcı adımız **bd** olsun. Bu durumda **$HOME** değeri **/home/bd/** olacaktır. Bu örneğimize göre **$HOME/distro/rootfs** ifadesi aslında **/home/bd/distro/rootfs** dir.

İso hazırlama işlemini yazımızın başında minimal iso yapma anlatılmıştı. Burada da benzer yol izlenecek. Sistemimin yani oluşacak **iso** dosyasının yapısı aşağıdaki gibi olacaktır. Buradaki dört dsyanunda nasıl hazırlanacağı ayrı ayrı anlatılacak ve en son hepsini kapsayan iso yapma scriptimizi vereceğiz.

.. code-block:: shell
	
	$HOME/distro/iso/boot/grub/grub.cfg
	$HOME/distro/iso/boot/initrd.img
	$HOME/distro/iso/boot/vmlinuz
	$HOME/distro/iso/live/filesystem.squashfs
	
**grub.cfg Hazırlama**
----------------------

 Sistemin açılmasını sağlayan dosyalardan birisi **grub.cfg** dosyasıdır. Genel olarak grub.cfg dosyası aşağıdaki gibi olmalıdır.

.. code-block:: shell

	linux /boot/vmlinuz
	initrd /boot/initrd.img
	boot


 Bu sistem için grub.cfg dosyası aşağıdaki gibi düzenlendi. Burada dikkat edilmesi gereken menü seçeneklerinde **live** ifadesi kulllanılması. Ayrıca sistemimizin servis yönetici ile başlatılmasını istediğimiz için **linux /boot/vmlinuz boot=live init=/sbin/openrc-init net.ifnames=0 biosdevname=0** sistemi canlı açılmasını sağlıyor.
 Kurulum için ise canlı(**live**) açıp kurulum yapmasını sağlayan satırımız **linux /boot/vmlinuz boot=live init=/bin/kur quiet** dır.

.. code-block:: shell

	#### Write grub.cfg
	# Timeout for menu
	echo -e "set timeout=3\n"> $HOME/distro/iso/boot/grub/grub.cfg

	# Default boot entry
	echo -e "set default=1\n">> $HOME/distro/iso/boot/grub/grub.cfg

	# Menu Colours
	echo -e "set menu_color_normal=white/black\n">>$HOME/distro/iso/boot/grub/grub.cfg
	echo -e "set menu_color_highlight=white\/blue\n">> $HOME/distro/iso/boot/grub/grub.cfg
	echo -e "insmod all_video">> $HOME/distro/iso/boot/grub/grub.cfg
	echo -e "terminal_output console">> $HOME/distro/iso/boot/grub/grub.cfg
	echo -e "terminal_input console">> $HOME/distro/iso/boot/grub/grub.cfg

	echo 'menuentry "Canli(live) GNU/Linux 64-bit" --class liveiso  {' >> $HOME/distro/iso/boot/grub/grub.cfg
	echo '    linux /boot/vmlinuz boot=live init=/sbin/openrc-init net.ifnames=0 biosdevname=0' >> $HOME/distro/iso/boot/grub/grub.cfg
	echo '    initrd /boot/initrd.img' >> $HOME/distro/iso/boot/grub/grub.cfg
	echo '}' >> $HOME/distro/iso/boot/grub/grub.cfg

	echo 'menuentry "Kur GNU/Linux 64-bit" --class liveiso  {' >> $HOME/distro/iso/boot/grub/grub.cfg
	echo '    linux /boot/vmlinuz boot=live init=/bin/kur quiet' >> $HOME/distro/iso/boot/grub/grub.cfg
	echo '    initrd /boot/initrd.img' >> $HOME/distro/iso/boot/grub/grub.cfg
	echo '}' >> $HOME/distro/iso/boot/grub/grub.cfg


**initrd.img Hazırlanması**
---------------------------


**initrd Oluşturma/Güncelleme**
-------------------------------

Sistemin initrd.img dosyasının güncellenmesi/oluşturulması için çalıştığınız sistemde  aşağıdaki komutlarla yapılabilir. 

.. code-block:: shell

	/usr/sbin/update-initramfs -u -k $(uname -r) #initrd günceller

Eğer bir dizin içinde bir sisteme initrd oluşturlacaksa, yani chroot ile sisteme erişiliyorsa yukarıdaki komut yeterli olmayacaktır. chroot öncesinde sistemin **dev sys proc run** dizinlerinin  bağlanılması gerekmektedir. Dizindeki sistemimizin dizin konumu **/$HOME/distro/rootfs** olsun. Buna göre aşağıda sisteme yukarıdaki komutu çalıştırmadan önce çalıştırılması gereken komutlar aşağıda verilmiştir. Dikkat edilmesi gereken en önemli noktalardan biriside bu komutlar **root** yetkisiyle çalıştırılmalıdır.

.. code-block:: shell

	## --------------------------------------------- 		initrd.img oluşturma scripti		 ---------------------------------------------
	rootfs="$HOME/distro/rootfs"
	distro="$HOME/distro"
	## Dizinler Oluşturuluyor
	mkdir -p $rootfs/dev
	mkdir -p $rootfs/sys
	mkdir -p $rootfs/proc 
	mkdir -p $rootfs/run
	mkdir -p $rootfs/tmp
	## Dizinler bağlanıyor
	mount --bind /dev $rootfs/dev
	mount --bind /sys $rootfs/sys
	mount --bind /proc $rootfs/proc
	mount --bind /run$rootfs/run
	mount --bind /tmp $rootfs/tmp
	
	### initrd.img oluşturuluyor/güncelleniyor
	fname=$(basename $rootfs/boot/config*)
	kversion=${fname:7}
	mv $rootfs/boot/config* $rootfs/boot/config-$kversion
	cp $rootfs/boot/config-$kversion $rootfs/etc/kernel-config
	chroot $rootfs update-initramfs -u -k $kversion
	
	## Dizin bağlantıları kaldırılıyor
	umount -lf -R $rootfs/dev 2>/dev/null
	umount -lf -R $rootfs/sys 2>/dev/null
	umount -lf -R $rootfs/proc 2>/dev/null
	umount -lf -R $rootfs/run 2>/dev/null
	umount -lf -R $rootfs/tmp 2>/dev/null
	#### initrd kopyalanıyor
	cp -pf $rootfs/boot/initrd.img-* $distro/iso/boot/initrd.img	

**vmlinuz Hazırlanması**
------------------------

Kernelimizi iso dizinimize taşıyoruz.

.. code-block:: shell

	rootfs="$HOME/distro/rootfs"
	distro="$HOME/distro"
	#### Copy kernel
	cp -pf $rootfs/boot/vmlinuz-* $distro/iso/boot/vmlinuz
	#rm -rf $rootfs/boot #istenir boyut küçültmek için bu komut aktifleştirilebilir.

**filesystem.squashfs Hazırlama**
---------------------------------

Sistemi **live** kullanma ve yükleme yapabilmek için yapılan sistemi **squashfs** dosya sıkıştırma yöntemiyle sıkılştırıyoruz. Bu dosyayı **$HOME/distro/iso/live/filesystem.squashfs** konumunda olmalı. Aşağıdaki komutlar dosyayı oluşturup **$HOME/distro//iso/live/filesystem.squashfs** konumuna taşımaktadır.

.. code-block:: shell

	cd $HOME/distro/
	mksquashfs $HOME/distro/rootfs $HOME/distro/filesystem.squashfs -comp xz -wildcards
	mv $HOME/distro/filesystem.squashfs $HOME/distro/iso/live/filesystem.squashfs



**İso Dosyasının Oluşturulması**
--------------------------------

.. code-block:: shell
	
	cd $HOME/distro
	grub-mkrescue iso/ -o distro.iso #iso doyamız oluşturulur.

**İsonun Test Edilmesi**
------------------------ 

isolarımız qemu veya virtualbox ile test edilebilir. Linux ortamında terminalden qemu kullanarak aşıdaki gibi test edebilirsiniz. Sistemde qemu paketinin kurulu olması gerekir.

.. code-block:: shell
	
	**qemu-system-x86_64 -cdrom $HOME/distro/distro.iso -m 1G** #komutuyla çalıştırıp test edebiliriz. 


.. raw:: pdf

   PageBreak
   
iso Oluşturma Scripti
---------------------

Sisteme giriş yaptığımız kullanıcının ev dizinindeki **distro/rootfs** disininden **distro/iso** dizinini kullanarak **distro** dizinine **distro.iso** dosyasını oluşturan scriptimiz aşağıdadır.

.. code-block:: shell
	
	#!/bin/bash
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"	#Detect the name of the display in use
	user=$(who | grep '('$display')' | awk '{print $1}')	#Detect the user using such display

	distro="/home/$user/distro"
	rootfs="/home/$user/distro/rootfs"
	rm -rf "$distro/iso"
	### system chroot  bind/mount
	for dir in dev dev/pts proc sys; do mount -o bind /$dir $rootfs/$dir; done
	
	chroot $rootfs echo -e "1\n1\n"|chroot $rootfs passwd root
	chroot $rootfs useradd live -m -s /bin/sh  -d /home/live
	chroot $rootfs echo -e "live\nlive\n"|chroot $rootfs passwd live

	for grp in users tty wheel cdrom audio dip video plugdev netdev; do
		chroot $rootfs usermod -aG $grp live || true
	done

	sed -i "/agetty_options/d" $rootfs/etc/conf.d/agetty
	echo -e "\nagetty_options=\"-l /usr/bin/login\"" >> $rootfs/etc/conf.d/agetty


	### update-initrd
	fname=$(basename $rootfs/boot/config*)
	kversion=${fname:7}
	mv $rootfs/boot/config* $rootfs/boot/config-$kversion
	cp $rootfs/boot/config-$kversion $rootfs/etc/kernel-config

	chroot $rootfs update-initramfs -u -k $kversion
	
	#### system chroot umount
	for dir in dev dev/pts proc sys ; do    while umount -lf -R $rootfs/$dir 2>/dev/null ; do true; done done
		
	#************************iso *********************************
	mkdir -p $distro/iso
	mkdir -p $distro/iso/boot
	mkdir -p $distro/iso/boot/grub
	mkdir -p $distro/iso/live || true

	#### Copy initramfs
	cp -pf $rootfs/boot/initrd.img-* $distro/iso/boot/initrd.img

	#### Copy kernel
	cp -pf $rootfs/boot/vmlinuz-* $distro/iso/boot/vmlinuz
	#rm -rf $rootfs/boot

	#### Create squashfs
	mksquashfs $rootfs $distro/filesystem.squashfs -comp xz -wildcards
	mv $distro/filesystem.squashfs $distro/iso/live/filesystem.squashfs

	#### Write grub.cfg
	# Timeout for menu
	echo -e "set timeout=3\n"> $distro/iso/boot/grub/grub.cfg


	# Default boot entry
	echo -e "set default=1\n">> $distro/iso/boot/grub/grub.cfg

	# Menu Colours
	echo -e "set menu_color_normal=white/black\n">> $distro/iso/boot/grub/grub.cfg
	echo -e "set menu_color_highlight=white\/blue\n">> $distro/iso/boot/grub/grub.cfg
	echo -e "insmod all_video">> $distro/iso/boot/grub/grub.cfg
	echo -e "terminal_output console">> $distro/iso/boot/grub/grub.cfg
	echo -e "terminal_input console">> $distro/iso/boot/grub/grub.cfg

	echo 'menuentry "Canli(live) GNU/Linux 64-bit" --class liveiso  {' >> $distro/iso/boot/grub/grub.cfg
	echo '    linux /boot/vmlinuz boot=live init=/sbin/openrc-init net.ifnames=0 biosdevname=0' >> $distro/iso/boot/grub/grub.cfg
	echo '    initrd /boot/initrd.img' >> $distro/iso/boot/grub/grub.cfg
	echo '}' >> $distro/iso/boot/grub/grub.cfg

	echo 'menuentry "Kur GNU/Linux 64-bit" --class liveiso  {' >> $distro/iso/boot/grub/grub.cfg
	echo '    linux /boot/vmlinuz boot=live init=/bin/kur quiet' >> $distro/iso/boot/grub/grub.cfg
	echo '    initrd /boot/initrd.img' >> $distro/iso/boot/grub/grub.cfg
	echo '}' >> $distro/iso/boot/grub/grub.cfg

	grub-mkrescue $distro/iso/ -o $distro/distro.iso

.. raw:: pdf

   PageBreak


bps ile İso Yapma
+++++++++++++++++

Dağıtımlarda, dağıtıma ait paket sistemini kullanarak iso hazırlanabilir. Bu dokümanda paket sistemi(bps) önceki bölümde anlatılmıştı. **bsp** paket sistemini kullanarak bir iso nasıl oluşturulur aşağıda verilmiştir. Burada anlatılan iso yapma scripti **Debian** vb. dağıtımlarda da benzer bir yapıdadır. Başka dağıtımlarda iso hazırlayan(deneyimi olan) geliştiriciler iso yapma aşamalırını benzer yapıda olduğunu göreceklerdir.

iso Scripti
-----------

.. code-block:: shell
	
	#!/bin/bash
	#set -x
	rootfs="/tmp/distro/rootfs"
	distro="/tmp/distro"
	#rm -rf distro/iso
	rm -rf $rootfs
	mkdir -p $rootfs
	mkdir -p $rootfs/bin $rootfs/etc


	##Kurulum scripti
	cp -prf files/bin/* $rootfs/bin/
	cp -prf files/etc/* $rootfs/etc/

	# temel dizinler ve dosyalar oluşturuluyor
	cd $rootfs/
	mkdir  -p bin dev etc home lib64 proc root run sbin sys usr var etc/bps tmp tmp/bps/kur \
	var/log  var/tmp usr/lib64/x86_64-linux-gnu usr/lib64/pkgconfig \
	usr/local/{bin,etc,games,include,lib,sbin,share,src}
	ln -s lib64 lib
	cd var&&ln -s ../run run&&cd -
	cd usr&&ln -s lib64 lib&&cd -
	cd usr/lib64/x86_64-linux-gnu&&ln -s ../pkgconfig  pkgconfig&&cd -

	bash -c "echo -e \"/bin/sh \n/bin/bash \n/bin/rbash \n/bin/dash\" >> $rootfs/etc/shell"
	bash -c "echo 'tmpfs /tmp tmpfs rw,nodev,nosuid 0 0' >> $rootfs/etc/fstab"
	bash -c "echo '127.0.0.1 kly' >> $rootfs/etc/hosts"
	bash -c "echo 'kly' > $rootfs/etc/hostname"
	bash -c "echo 'nameserver 8.8.8.8' > $rootfs/etc/resolv.conf"

	# paket adresi ekleniyor
	echo "basitdagitim/kly-binary-packages">$rootfs/etc/bps/sources.list

	### installing bps package in rootfs

	echo root:x:0:0:root:/root:/bin/sh > $rootfs/etc/passwd 
	chmod 755 $rootfs/etc/passwd

	### system chroot  bind/mount
	for dir in dev dev/pts proc sys; do mount -o bind /$dir $rootfs/$dir; done
	## paket listesi güncelleniyor
	$rootfs/bin/bps -u $rootfs

	## paketler kuruluyor
	for paket in glibc readline ncurses \bash openssl acl attr libcap libpcre2 gmp coreutils util-linux \grep \sed mpfr \gawk findutils libgcc libcap-ng \
	sqlite \gzip xz-utils zstd \bzip2 \elfutils libselinux \tar \zlib brotli curl shadow \file eudev cpio libsepol \
	kmod audit libxcrypt libnsl pam libtirpc e2fsprogs dosfstools  initramfs-tools libxml2 expat libmd libaio lvm2 popt icu iproute2 net-tools  dhcp \
	openrc  rsync kbd busybox kernel kernel-headers live-boot live-config parted  nano grub dialog efibootmgr efivar libssh openssh
	do
	chroot $rootfs /bin/bps -ri $paket; 
	#$rootfs/bin/bps -ri  $paket $rootfs
	done

	#### system chroot umount
	for dir in dev dev/pts proc sys ; do    while umount -lf -R $rootfs/$dir 2>/dev/null ; do true; done done
	exit

	chroot $rootfs useradd live -m -s /bin/sh  -d /home/live
	chroot $rootfs echo -e "live\nlive\n"|chroot $rootfs passwd live

	for grp in users tty wheel cdrom audio dip video plugdev netdev; do
		chroot $rootfs usermod -aG $grp live || true
	done

	sed -i "/agetty_options/d" $rootfs/etc/conf.d/agetty
	echo -e "\nagetty_options=\"-l /usr/bin/login\"" >> $rootfs/etc/conf.d/agetty


	### update-initrd
	fname=$(basename $rootfs/boot/config*)
	kversion=${fname:7}
	mv $rootfs/boot/config* $rootfs/boot/config-$kversion
	cp $rootfs/boot/config-$kversion $rootfs/etc/kernel-config

	chroot $rootfs update-initramfs -u -k $kversion

	#### system chroot umount
	for dir in dev dev/pts proc sys ; do    while umount -lf -R $rootfs/$dir 2>/dev/null ; do true; done done

	#************************									iso 										*********************************
	mkdir -p $distro/iso
	mkdir -p $distro/iso/boot
	mkdir -p $distro/iso/boot/grub
	mkdir -p $distro/iso/live || true

	#### Copy kernel and initramfs
	cp -pf $rootfs/boot/initrd.img-* $distro/iso/boot/initrd.img
	cp -pf $rootfs/boot/vmlinuz-* $distro/iso/boot/vmlinuz
	rm -rf $rootfs/boot

	#### Create squashfs
	mksquashfs $rootfs $distro/filesystem.squashfs -comp xz -wildcards
	mv $distro/filesystem.squashfs $distro/iso/live/filesystem.squashfs

	#### Write grub.cfg
	# Timeout for menu
	echo -e "set timeout=3\n"> $distro/iso/boot/grub/grub.cfg

	# Default boot entry
	echo -e "set default=1\n">> $distro/iso/boot/grub/grub.cfg

	# Menu Colours
	echo -e "set menu_color_normal=white/black\n">> $distro/iso/boot/grub/grub.cfg
	echo -e "set menu_color_highlight=white\/blue\n">> $distro/iso/boot/grub/grub.cfg
	echo -e "insmod all_video">> $distro/iso/boot/grub/grub.cfg
	echo -e "terminal_output console">> $distro/iso/boot/grub/grub.cfg
	echo -e "terminal_input console">> $distro/iso/boot/grub/grub.cfg

	echo 'menuentry "Canli(live) GNU/Linux 64-bit" --class liveiso  {' >> $distro/iso/boot/grub/grub.cfg
	echo '    linux /boot/vmlinuz boot=live init=/sbin/openrc-init net.ifnames=0 biosdevname=0' >> $distro/iso/boot/grub/grub.cfg
	echo '    initrd /boot/initrd.img' >> $distro/iso/boot/grub/grub.cfg
	echo '}' >> $distro/iso/boot/grub/grub.cfg

	echo 'menuentry "Kur GNU/Linux 64-bit" --class liveiso  {' >> $distro/iso/boot/grub/grub.cfg
	echo '    linux /boot/vmlinuz boot=live init=/bin/kur quiet' >> $distro/iso/boot/grub/grub.cfg
	echo '    initrd /boot/initrd.img' >> $distro/iso/boot/grub/grub.cfg
	echo '}' >> $distro/iso/boot/grub/grub.cfg

	grub-mkrescue $distro/iso/ -o $distro/distro.iso

.. raw:: pdf

   PageBreak


.. _isohazirlama:
iso Hazırlama
=============

.. _sistemkurma:

**Sistem Kurma**
++++++++++++++++

Hazırlanmış bir iso ile çeşitli kurulum araçları gelebilir. Bu araçların farklı kurulum yapma yöntemleri olmaktadır.
Sık kullanılan yöntemler şunlardır;

1. Tek bölüme sistem kurma
2. iki bölüme sistem kurma(boot+sistem)
3. uefi sistem kurma(boot+sistem)

Burada üç farklı kurulum yöntemi sırayla anlatılacaktır. Bu anlatılan yöntemler birden fazla senaryo isteğine cevap vermektedir. Fakat bu yöntemler için ayrı ayrı seçenek sunarak son kullanıcının kurulum yapılmasını istemek kafa karışıklığına sebep olabilir.
Örneğin efi seçeneği olsa fakat sistem legacy olsa veya tam tersi bir durumda kullanıcı bu detayları bilmeyebilir. Ayrıca sda veya nvme disklerde farklı senaryolar gerekecektir. Bizim yapacağımız sistem aşağıdaki tüm senaryolara cevap vermelidir. Muhtemel senaryolar;

- legacy-->sd*
- legacy-->nvme* 
- uefi-->sd* 
- uefi-->nvme*  kurulum yapılmak istenebilir. 

Bu senaryolara göre sorunsuz çalışacak kurlum scriptimiz **dialog** kullanarak hazırlanmıştır. Bu kurulum scriplerinin **base-file** paketinin **files.rar** paketinde bulunmaktadır. Bu bölümde sadece legacy ve uefi kurulum hangi adımlarla yapıldığını anlatan genel bir yazıdır. Bu yöntemleri kendi ihtiyacınıza göre düzenleyip kullanabilirsiniz. 




.. raw:: pdf

   PageBreak


Tek Bölüm Kurulum
=================
Diskler üzerinde işlem yapabilmek için evdev veya udevd servisi çalışıyor olmalı.
Ayrıca aşağıdaki modüllerin yüklü olduğundan emin olun.
Anlatım boyunca **/dev/sda** diski üzerinden örnekleme yapılmıştır. Siz kendi diskinize göre düzenleyebilirsiniz.
Disk ve isoya erişim için aşağıdaki modüllerin yüklü olduğundan emin olun.

- loop
- squashfs
- ext4 modulleri **modprobe** komutuyla yüklenmeli.

Disk Hazırlanmalı(legacy)
^^^^^^^^^^^^^^^^^^^^^^^^^
Öncelikle **cfdisk** veya **fdisk** komutları ile diski bölümlendirelim. Ben bu anlatımda **cfdisk** kullanacağım.


0. cfdisk komutuyla disk bölümlendirilmeli.

.. code-block:: shell
		
	$ cfdisk /dev/sda
	
1. dos seçilmeli
2. type linux system
3. write
4. quit
5. Bu işlem sonucunda sadece sda1 olur
6. mkfs.ext2 ile disk biçimlendirilir.

.. code-block:: shell

	$ mkfs.ext2 /dev/sda1


Dosya sistemini kopyalama
^^^^^^^^^^^^^^^^^^^^^^^^^
Kurulum medyası **/cdrom** dizinine bağlanır.
Kurulacak sistemin imajını bir dizine bağlayalım.

.. code-block:: shell
		
	$ mkdir -p cdrom
	$ mkdir -p source
	$ mount -t iso9660 -o loop /dev/sr0 /cdrom/
	$ mount -t squashfs -o loop /cdrom/live/filesystem.squashfs /source

Şimdi de disk bölümümüzü bağlayalım.

.. code-block:: shell

	$ mkdir -p target
	$ mount /dev/sda1 /target
	$ mkdir -p /target/boot

Ardından dosyaları kopyalayalım.

.. code-block:: shell

	# -p dosya izinlerini korur
	# -r alt dizinlerle beraber kopyalar
	# -f soru sormayı kapatır
	# -v detaylı çıktıları gösterir
	$ cp -prfv /source/* /target

Daha sonra diski senkronize edelim.

.. code-block:: shell

	$ sync

Bootloader kurulumu
^^^^^^^^^^^^^^^^^^^
grub kurulumu yapmak için grub paketinini kurulu olduğundan emin olun.

.. code-block:: shell

	$ mkdir -p /target/dev
	$ mkdir -p /target/sys
	$ mkdir -p /target/proc 
	$ mkdir -p /target/run
	$ mkdir -p /target/tmp
	$ mount --bind /dev /target/dev
	$ mount --bind /sys /target/sys
	$ mount --bind /proc /target/proc
	$ mount --bind /run /target/run
	$ mount --bind /tmp /target/tmp
	
	# Bunun yerine aşağıdaki gibi de girilebilir.
	for dir in /dev /sys /proc /run /tmp ; do
		mount --bind /$dir /target/$dir
	done
	$ chroot /target


Grub Kuralım
^^^^^^^^^^^^
.. code-block:: shell

	$ grub-install --boot-directory=/boot  /dev/sda


Grub yapılandırması
^^^^^^^^^^^^^^^^^^^
1. /boot bölümünde initrd.img-<çekirdek-sürümü> dosyamızın olduğundan emin olalım.
2. /boot bölümünde vmlinuz-<çekirdek-sürümü>  kernel dosyamızın olduğundan emin olalım.
3. /boot/grub/grub.cfg konumunda dostamızı oluşturalım(vi, touch veya nano ile).
4. dev/sda1 diskimizim uuid değerimizi bulalım.


.. code-block:: shell

	$ blkid | grep /dev/sda1
	/dev/sda1: UUID="..." BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="..."

Şimdi aşağıdaki gibi bir yapılandırma dosyası yazalım ve /boot/grub/grub.cfg dosyasına kaydedelim.
Burada uuid değerini ve çekirdek sürümünü düzenleyin.

.. code-block:: shell

	linux /boot/vmlinuz-<çekirdek-sürümü>	root=UUID=<uuid-değeri> rw quiet
	initrd /boot/initrd.img-<çekirdek-sürümü>
	boot


Ayrıca otomatik yapılandırma da oluşturabiliriz.

.. code-block:: shell
	
	$ grub-mkconfig -o /boot/grub/grub.cfg

**Not:** Disk bölümü konumu yerine **UUID="<uuid-değeri>"** şeklinde yazmanızı öneririm.
Bölüm adları değişebilirken uuid değerleri değişmez.


.. raw:: pdf

   PageBreak

İki Bölüm Kurulum
+++++++++++++++++

Bu bölümde **Ext4** dosya sistemine grub kullanarak kurulum anlatılacaktır.
Anlatım boyunca **/dev/sda** diski üzerinden örnekleme yapılmıştır. Siz kendi diskinize göre düzenleyebilirsiniz.
Diskler üzerinde işlem yapabilmek için evdev veya udevd servisi çalışıyor olmalı.
Disk ve isoya erişim için aşağıdaki modüllerin yüklü olduğundan emin olun.


- loop
- squashfs
- ext4 modulleri **modprobe** komutuyla yüklenmeli.

Disk Hazırlanmalı
^^^^^^^^^^^^^^^^^
Öncelikle **cfdisk** veya **fdisk** komutları ile diski bölümlendirelim. Ben bu anlatımda **cfdisk** kullanacağım.

0. cfdisk komutuyla disk bölümlendirilmeli.
.. code-block:: shell
		
	$ cfdisk /dev/sda

1. gpt seçilmeli
2. 512 MB type vfat alan(sda1)
3. geri kalanı type linux system(sda2)
4. write
5. quit
6. Bu işlem sonucunda sadece sda1 sda2 olur
7. mkfs.vfat ve mkfs.ext4 ile diskler biçimlendirilir.

.. code-block:: shell

	$ mkfs.vfat /dev/sda1
	$ mkfs.ext4 /dev/sda2
		
e2fsprogs Paketi
^^^^^^^^^^^^^^^^
e2fsprogs paket sistemde mkfs.ext4, e2fsck, tune2fs vb sistem araçlarının yüklenmesini sağlar. Eğer sistemde bu sistem uygulamaları yoksa bu paketin yüklenmesi veya derlenmesi gerekmektedir.

Eğer /boot bölümünü ayırmayacaksanız grub yüklenirken **unknown filesystem** hatası almanız durumunda aşağıdaki yöntemi kullanabilirsiniz.

.. code-block:: shell

	$ e2fsck -f /dev/sda2
	$ tune2fs -O ^metadata_csum /dev/sda2

Dosya sistemini kopyalama
^^^^^^^^^^^^^^^^^^^^^^^^^
Kurulum medyası **/cdrom** dizinine bağlanır.
Kurulacak sistemin imajını bir dizine bağlayalım.

.. code-block:: shell
		
	$ mkdir -p cdrom
	$ mkdir -p source
	$ mount -t iso9660 -o loop /dev/sr0 /cdrom/
	$ mount -t squashfs -o loop /cdrom/live/filesystem.squashfs /source

Şimdi de disk bölümümüzü bağlayalım.

.. code-block:: shell

	$ mkdir -p target
	$ mkdir -p /target/boot
	$ mount /dev/sda2 /target
	$ mount -t vfat /dev/sda1 /target/boot

Ardından dosyaları kopyalayalım.

.. code-block:: shell

	# -p dosya izinlerini korur
	# -r alt dizinlerle beraber kopyalar
	# -f soru sormayı kapatır
	# -v detaylı çıktıları gösterir
	$ cp -prfv /source/* /target

Daha sonra diski senkronize edelim.

.. code-block:: shell

	$ sync


Bootloader kurulumu
^^^^^^^^^^^^^^^^^^^
grub kurulumu yapmak için grub paketinin kurulu olduğundan emin olun.

.. code-block:: shell

	$ mkdir -p /target/dev
	$ mkdir -p /target/sys
	$ mkdir -p /target/proc 
	$ mkdir -p /target/run
	$ mkdir -p /target/tmp
	$ mount --bind /dev /target/dev
	$ mount --bind /sys /target/sys
	$ mount --bind /proc /target/proc
	$ mount --bind /run /target/run
	$ mount --bind /tmp /target/tmp

	# Bunun yerine aşağıdaki gibi de girilebilir.
	for dir in /dev /sys /proc /run /tmp ; do
	mount --bind /$dir /target/$dir
	done
	$ chroot /target


Grub Kuralım
^^^^^^^^^^^^

.. code-block:: shell

	# kurulu sistemden bağımsız çalışması için --removable kullanılır.
	$ grub-install --removable --boot-directory=/boot --efi-directory=/boot /dev/sda

Grub yapılandırması
^^^^^^^^^^^^^^^^^^^
1. /boot bölümünde initrd.img-<çekirdek-sürümü> dosyamızın olduğundan emin olalım.
2. /boot bölümünde vmlinuz-<çekirdek-sürümü>  kernel dosyamızın olduğundan emin olalım.
3. /boot/grub/grub.cfg konumunda dostamızı oluşturalım(vi, touch veya nano ile).
4. dev/sda2 diskimizim uuid değerimizi bulalım.

.. code-block:: shell

	$ blkid | grep /dev/sda2
	/dev/sda2: UUID="..." BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="..."

Şimdi aşağıdaki gibi bir yapılandırma dosyası yazalım ve /boot/grub/grub.cfg dosyasına kaydedelim.
Burada uuid değerini ve çekirdek sürümünü düzenleyin.

.. code-block:: shell

	linux /vmlinuz-<çekirdek-sürümü>	root=UUID=<uuid-değeri> rw quiet
	initrd /initrd.img-<çekirdek-sürümü>
	boot


Ayrıca otomatik yapılandırma da oluşturabiliriz.

.. code-block:: shell

	$ grub-mkconfig -o /boot/grub/grub.cfg

**Not:** Disk bölümü konumu yerine **UUID="<uuid-değeri>"** şeklinde yazmanızı öneririm.
Bölüm adları değişebilirken uuid değerleri değişmez.


.. raw:: pdf

   PageBreak


Uefi Sistem Kurulumu
++++++++++++++++++++

Bu bölümde **Ext4** dosya sistemine grub kullanarak kurulum anlatılacaktır.
Anlatım boyunca **/dev/sda** diski üzerinden örnekleme yapılmıştır. Siz kendi diskinize göre düzenleyebilirsiniz.
Diskler üzerinde işlem yapabilmek için evdev veya udevd servisi çalışıyor olmalı.
Disk ve isoya erişim için aşağıdaki modüllerin yüklü olduğundan emin olun.


- loop
- squashfs
- ext4 modulleri **modprobe** komutuyla yüklenmeli.

Uefi - Legacy tespiti
^^^^^^^^^^^^^^^^^^^^^
**/sys/firmware/efi** dizini varsa uefi, yoksa legacy sisteme sahipsinizdir.
Eğer uefi ise ia32 veya x86_64 olup olmadığını anlamak için **/sys/firmware/efi/fw_platform_size** içeriğine bakın.

.. code-block:: shell

	[[ -d /sys/firmware/efi/ ]] && echo UEFI || echo Legacy
	[[ "64" == $(cat/sys/firmware/efi/fw_platform_size) ]] && echo x86_64 || ia32

Disk Hazırlanmalı
^^^^^^^^^^^^^^^^^
Uefi kullananlar ayrı bir disk bölümüne ihtiyaç duyarlar.
Bu bölümü **fat32** olarak bölümlendirmeliler.

Bu anlatımda kurulum için **/boot** dizinini ayırmayı ve efi bölümü olarak aynı diski kullanmayı tercih edeceğiz.
Öncelikle **cfdisk** veya **fdisk** komutları ile diski bölümlendirelim. Ben bu anlatımda **cfdisk** kullanacağım.

0. cfdisk komutuyla disk bölümlendirilmeli.

.. code-block:: shell
		
	$ cfdisk /dev/sda

1. gpt seçilmeli
2. 512 MB type uefi alan(sda1)
3. geri kalanı type linux system(sda2)
4. write
5. quit
6. Bu işlem sonucunda sadece sda1 sda2 olur
7. mkfs.vfat ve mkfs.ext4 ile diskler biçimlendirilir.

.. code-block:: shell

	$ mkfs.vfat /dev/sda1
	$ mkfs.ext4 /dev/sda2
		
e2fsprogs Paketi
^^^^^^^^^^^^^^^^
e2fsprogs paket sistemde mkfs.ext4, e2fsck, tune2fs vb sistem araçlarının yüklenmesini sağlar. Eğer sistemde bu sistem uygulamaları yoksa bu paketin yüklenmesi veya derlenmesi gerekmektedir.

Eğer /boot bölümünü ayırmayacaksanız grub yüklenirken **unknown filesystem** hatası almanız durumunda aşağıdaki yöntemi kullanabilirsiniz.

.. code-block:: shell

	$ e2fsck -f /dev/sda2
	$ tune2fs -O ^metadata_csum /dev/sda2

Dosya sistemini kopyalama
^^^^^^^^^^^^^^^^^^^^^^^^^
Kurulum medyası **/cdrom** dizinine bağlanır.
Kurulacak sistemin imajını bir dizine bağlayalım.

.. code-block:: shell
		
	$ mkdir -p cdrom
	$ mkdir -p source
	$ mount -t iso9660 -o loop /dev/sr0 /cdrom/
	$ mount -t squashfs -o loop /cdrom/live/filesystem.squashfs /source

Şimdi de disk bölümümüzü bağlayalım.

.. code-block:: shell

	$ mkdir -p target || true
	$ mkdir -p /target/boot || true
	$ mkdir -p /target/boot/efi || true
	$ mount /dev/sda2 /target || true
	$ mount /dev/sda1 /target/boot/efi

Ardından dosyaları kopyalayalım.

.. code-block:: shell

	# -p dosya izinlerini korur
	# -r alt dizinlerle beraber kopyalar
	# -f soru sormayı kapatır
	# -v detaylı çıktıları gösterir
	$ cp -prfv /source/* /target

Daha sonra diski senkronize edelim.

.. code-block:: shell

	$ sync


Bootloader kurulumu
^^^^^^^^^^^^^^^^^^^
grub kurulumu yapmak için grub paketinini kurulu olduğundan emin olun.

.. code-block:: shell

	$ mkdir -p /target/dev
	$ mkdir -p /target/sys
	$ mkdir -p /target/proc 
	$ mkdir -p /target/run
	$ mkdir -p /target/tmp
	$ mount --bind /dev /target/dev
	$ mount --bind /sys /target/sys
	$ mount --bind /proc /target/proc
	$ mount --bind /run /target/run
	$ mount --bind /tmp /target/tmp
	#efi alan bağlanıyor. Eğer uefi aktif edilmişse kernel **/sys/firmware/efi** tarafından budizinler ve dosyalar oluşuyor. 
	#sistem uefi değise **/sys/firmware/efi** konumunda dosyalar olmayacaktır.
	$ if [[ -d /sys/firmware/efi ]] ; then
    		mount --bind /sys/firmware/efi/efivars /target/sys/firmware/efi/efivars
	  fi
		
	# Bunun yerine aşağıdaki gibi de girilebilir.
	for dir in /dev /sys /proc /run /tmp ; do
		mount --bind /$dir /target/$dir
	done
	$ chroot /target

Şimdi de uefi kullandığımız için efivar bağlayalım.
.. code-block:: shell

	$ mount -t efivarfs efivarfs /sys/firmware/efi/efivarfs
	
Grub Kuralım
^^^^^^^^^^^^
.. code-block:: shell

	# biz /boot ayırdığımız ve efi bölümü olarak kullanacağız.
	# uefi kullanmayanlar --efi-directory belirtmemeliler.
	# kurulu sistemden bağımsız çalışması için --removable kullanılır.
	$ grub-install --removable --boot-directory=/boot --efi-directory=/boot --target=x86_64-efi /dev/sda

Grub yapılandırması
^^^^^^^^^^^^^^^^^^^
1. /boot bölümünde initrd.img-<çekirdek-sürümü> dosyamızın olduğundan emin olalım.
2. /boot bölümünde vmlinuz-<çekirdek-sürümü>  kernel dosyamızın olduğundan emin olalım.
3. /boot/grub/grub.cfg konumunda dostamızı oluşturalım(vi, touch veya nano ile).
4. dev/sda2 diskimizim uuid değerimizi bulalım.

.. code-block:: shell

	$ blkid | grep /dev/sda2
	/dev/sda2: UUID="..." BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="..."

Şimdi aşağıdaki gibi bir yapılandırma dosyası yazalım ve /boot/grub/grub.cfg dosyasına kaydedelim.
Burada uuid değerini ve çekirdek sürümünü düzenleyin.

.. code-block:: shell

	linux /vmlinuz-<çekirdek-sürümü>	root=UUID=<uuid-değeri> rw quiet
	initrd /initrd.img-<çekirdek-sürümü>
	boot


Ayrıca otomatik yapılandırma da oluşturabiliriz.

.. code-block:: shell

	$ grub-mkconfig -o /boot/grub/grub.cfg

**Not:** Disk bölümü konumu yerine **UUID="<uuid-değeri>"** şeklinde yazmanızı öneririm.
Bölüm adları değişebilirken uuid değerleri değişmez.


.. raw:: pdf

   PageBreak


.. _sistemkurulumu:
Sistem Kurulumu
===============

**X Pencere Nedir?**
++++++++++++++++++++

X Pencere Sistemi, grafik kullanıcı arayüzü (GUI) uygulamalarının çalışmasını sağlayan bir sistemdir. Linux ve Unix tabanlı işletim sistemlerinde yaygın olarak kullanılır.

X Pencere Sistemi, kullanıcıların grafiksel arayüzler aracılığıyla etkileşimde bulunmasını sağlayan bir altyapıdır. 1984 yılında MIT tarafından geliştirilen bu sistem, ağ üzerinden grafiksel uygulamaların çalıştırılmasına olanak tanır. X, istemci-sunucu mimarisi ile çalışır; burada istemciler, grafiksel uygulamalar iken, sunucu ise ekran, klavye ve fare gibi giriş/çıkış aygıtlarını yönetir.

X Pencere Sistemi, çoklu pencere yönetimi, ekran paylaşımı ve uzaktan erişim gibi özellikler sunar. Örneğin, bir X istemcisi, başka bir makinedeki X sunucusunda çalışabilir. Bu, kullanıcıların farklı sistemlerdeki uygulamalara erişimini kolaylaştırır. X11 protokolü, bu sistemin temelini oluşturur ve geniş bir uygulama yelpazesine destek verir.

Aşağıda basit bir X uygulaması örneği verilmiştir:

.. code-block:: shell

	xterm

Bu komut, X Pencere Sistemi altında bir terminal penceresi açar. X Pencere Sistemi, modern Linux dağıtımlarında genellikle GNOME veya KDE gibi masaüstü ortamları ile birlikte kullanılır.


.. raw:: pdf

   PageBreak


**X Pencere Derleme**
++++++++++++++++++++

X Pencere sistemini derlemek için öncelikle gerekli bağımlılıkların kurulu olduğundan emin olmalısınız. Aşağıdaki adımları izleyerek X Pencere'yi derleyebilirsiniz:

    Gerekli Paketleri Yükleyin: Gerekli kütüphaneleri ve araçları yüklemek için terminalde aşağıdaki komutu çalıştırın:

.. code-block:: shell

	sudo apt-get install build-essential xorg-dev

Kaynak Kodunu İndirin: X Pencere kaynak kodunu resmi web sitesinden indirin. Örneğin:

.. code-block:: shell

	wget https://www.x.org/archive/individual/xserver/xorg-server-1.20.13.tar.gz
	tar -xzf xorg-server-1.20.13.tar.gz
	cd xorg-server-1.20.13

Yapılandırma: Yapılandırma dosyasını oluşturmak için ./configure komutunu kullanın:

.. code-block:: shell

	./configure

Derleme: Derleme işlemini başlatmak için:

.. code-block:: shell

	make

Kurulum: Derleme tamamlandıktan sonra, X Pencere'yi kurmak için:

.. code-block:: shell

	sudo make install

Bu adımları takip ederek X Pencere sistemini başarıyla derleyebilir ve kurabilirsiniz. Herhangi bir hata ile karşılaşırsanız, hata mesajlarını dikkatlice inceleyerek gerekli düzeltmeleri yapmalısınız.


.. raw:: pdf

   PageBreak


**Xorg Çalıştırma**
++++++++++++++++++++

Xorg Yapılandırma Dosyası
-------------------------

Xorg, genellikle /etc/X11/xorg.conf dosyasını kullanır. Eğer bu dosya yoksa, Xorg varsayılan ayarlarla çalışacaktır. Ancak, özel ayarlar yapmak istiyorsanız, bu dosyayı oluşturmanız gerekebilir. Aşağıdaki komut ile bir yapılandırma dosyası oluşturabilirsiniz:

.. code-block:: shell
	
	sudo X -configure

Bu komut, xorg.conf.new adında bir dosya oluşturacaktır. Bu dosyayı /etc/X11/xorg.conf olarak kopyalayabilirsiniz:

.. code-block:: shell
	
	sudo cp ~/xorg.conf.new /etc/X11/xorg.conf

Xwrapper.config
...............

.. code-block:: shell
	
	echo needs_root_rights=yes>/etc/X11/Xwrapper.config
	echo allowed_users=anybody>>/etc/X11/Xwrapper.config

Kullanınıcı Ayarı
.................
 
Kullanıcının tty ve wheel grubunda olması lazım ayrıca **/dev/tty*** dosyalarının grub ve izinleri ayarlanmalıdır. 
.. code-block:: shell
	
	chmod 620 /dev/tty*
	chgrp tty /dev/tty*
	usermod -a -G tty by
	addgroup wheel
	usermod -a -G wheel by

Xorg'u Elle Başlatma
--------------------

Xorg'u elle başlatmak için terminalde aşağıdaki komutu kullanabilirsiniz:

.. code-block:: shell
	
	export DISPLAY=:0
	Xorg:0
	
Bu şekilde çalıştırmak yerine;

.. code-block:: shell
	
		startx

Bu komut, varsayılan kullanıcı arayüzünü başlatacaktır. Eğer belirli bir pencere yöneticisi veya masaüstü ortamı ile başlatmak istiyorsanız, ~/.xinitrc dosyasını düzenlemeniz gerekebilir. Örneğin, openbox kullanmak istiyorsanız, dosyanın içeriği şöyle olmalıdır:

.. code-block:: shell

	exec openbox-session

Xorg'u Durdurma
---------------

Xorg'u durdurmak için, terminalde Ctrl + Alt + Backspace tuş kombinasyonunu kullanabilirsiniz. Bu, X sunucusunu kapatacaktır.

.. raw:: pdf

   PageBreak


**Xorg Hata ayıklama**
++++++++++++++++++++++

Hata Ayıklama
-------------

Eğer Xorg başlatılamıyorsa, hata ayıklamak için aşağıdaki komutu kullanarak log dosyalarını kontrol edebilirsiniz:

.. code-block:: shell
	
	cat /var/log/Xorg.0.log

Bu dosya, Xorg'un başlatılması sırasında oluşan hataları ve uyarıları içerecektir. Hataları inceleyerek sorunu çözmeye çalışabilirsiniz.


.. raw:: pdf

   PageBreak


**X Paketleri**
+++++++++++++++

x11 derlemek için maddeler halinde verilen adreslerin içinde bulunanan paketlerin son versiyonları derlenmelidir.
Bu paketler birbirine bağımlı paketlerdir.  Bundan dolayı aşağıda verdiğim sıralamaya göre derlenmelidir.

- https://www.x.org/releases/individual/xcb/
- https://www.x.org/releases/individual/util/
- https://www.x.org/releases/individual/proto/
- https://www.x.org/releases/individual/driver/
- https://www.x.org/releases/individual/lib/
- https://www.x.org/releases/individual/xserver/
- https://www.x.org/releases/individual/font/
- https://www.x.org/releases/individual/app/

Bunların dışında x11 pencere sisteminin en önemli paketleri şunlardır;

1. mesa : https://gitlab.freedesktop.org/mesa/mesa/-/tags
2. llvm	: https://github.com/llvm/llvm-project/tags
3. cairo: https://gitlab.freedesktop.org/cairo/cairo/-/tags

Tüm paketleri derlesek bile **mesa,llvm,cairo** paketleri düzgün ve uyumlu versiyonları olmadığı zaman X penceremiz açılmayacaktır.

Buradaki tüm paketler ve bağımlılıkları derlendikten sonra **Xorg:0** şeklinde elle çalıştırarak hata ayıklama yapılmalıdır. 

.. raw:: pdf

   PageBreak


.. _xderleme:
X Pencere Sistemi
=================

.. _chrootnedir:

Chroot Nedir?
+++++++++++++

chroot komutu çalışan sistem üzerinde belirli bir klasöre root yetkisi verip sadece o klasörü sanki linux sistemi gibi çalıştıran bir komuttur. Sağladığı avantajlar çok fazladır. Bunlar;

    - Sistem tasarlama
    - Sitem üzerinde yeni dağıtımlara müdahale etme ve sorun çözme
    - Kullanıcı kendine özel geliştirme ortamı oluşturabilir.
    - Yazılım bağımlıkları sorunlarına çözüm olabilir.
    - Kullanıcıya sadece kendisine verilen alanda sınırsız yetki verme vb.

.. image:: /_static/images/chroot-1.png
  :width: 400


Yukarıdaki resimde user1 altında wrk dizini altına yeni bir sistem kurulmuş gibi yapılandırmayı gerçekleştirmiş.

**/home/user1/wrk** dizinindeki sistem üzerinde sisteme erişmek için;

.. code-block:: shell

	sudo chroot /home/user1/wrk #sisteme erişim yapıldı.
	
**/home/user1/wrk** dizinindeki sistem üzerinde sistemi silmek için;

.. code-block:: shell

	sudo rm -rf /home/user1/wrk #sistem silindi

.. raw:: pdf

   PageBreak
   
Yeni sistem tasarlamak ve erişmek için temel komutları ve komut yorumlayıcının olması gerekmektedir. Bunun için bize gerekli olan komutları bu yapının içine koymamız gerekmektedir. Örneğin ls komutu için doğrudan çalışıp çalışmadığını ldd komutu ile kontrol edelim.

.. image:: /_static/images/chroot-2.png
  :width: 600

Görüldüğü gibi ls komutunun çalışması için bağımlı olduğu kütüphane dosyaları bulunmaktadır. Bağımlı olduğu dosyaları yeni oluşturduğumuz sistem dizinine aynı dizin yapısında kopyalamamız gerekmektedir. Bu dosyalar eksiksiz olursa ls komutu çalışacaktır. Fakat bu işlemi tek tek yapmamız çok zahmetli bir işlemdir. Bu işi yapacak script dosyası aşağıda verilmiştir.

Bağımlılık Scripti
------------------

lddscript.sh

.. code-block:: shell

	#!/bin/bash

	if [ ${#} != 2 ]
	then
	    echo "usage $0 PATH_TO_BINARY target_folder"
	    exit 1
	fi
	path_to_binary="$1"
	target_folder="$2"

	# if we cannot find the the binary we have to abort
	if [ ! -f "${path_to_binary}" ]
	then
	    echo "The file '${path_to_binary}' was not found. Aborting!"
	    exit 1
	fi

	echo "---> copy binary itself" # copy the binary itself
	cp --parents -v "${path_to_binary}" "${target_folder}"

	echo "---> copy libraries" # copy the library dependencies
	ldd "${path_to_binary}" | awk -F'[> ]' '{print $(NF-1)}' | while read -r lib
	do
	    [ -f "$lib" ] && cp -v --parents "$lib" "${target_folder}"
	done

Basit Sistem Oluşturma
----------------------

Bu örnekte kullanıcının(etapadmin) ev dizinine(/home/etapadmin) test dizini oluşturuldu ve işlemler yapıldı. 
ls, rmdir, mkdir ve bash komutlarından oluşan sistem hazırlama.

Sistem Dizinin Oluştrulması
---------------------------

.. code-block:: shell

	mkdir /home/etapadmin/test/ #ev dizinine test dizini oluşturuldu.
	
/home/etapadmin/ dizinine **Bağımlılık Scripti** kodunu **lddscripts.sh** oluşturalım.

ls Komutu
----------

.. code-block:: shell

	bash lddscripts.sh /bin/ls /home/etapadmin/test/ #komutu ile ls komutunu ve bağımlılığı kopyalandı.

.. image:: /_static/images/chroot-3.png
  :width: 600

Bu işlemi diğer komutlar içinde sırasıyla yapmamız gerekmektedir.

rmdir Komutu
------------

.. code-block:: shell

	bash lddscripts.sh /bin/rmdir /home/etapadmin/test/ #komutu ile rmdir komutunu ve bağımlılığı kopyalandı.

.. image:: /_static/images/chroot-4.png
  :width: 600


.. raw:: pdf

   PageBreak
   
mkdir Komutu
------------

.. code-block:: shell

	bash lddscripts.sh /bin/mkdir /home/etapadmin/test/ #komutu ile mkdir komutunu ve bağımlılığı kopyalandı.

.. image:: /_static/images/chroot-5.png
  :width: 600

bash Komutu
------------

.. code-block:: shell

	bash lddscripts.sh /bin/bash /home/etapadmin/test/ #komutu ile bash komutunu ve bağımlılığı kopyalandı.

.. image:: /_static/images/chroot-6.png
  :width: 600


chroot Sistemde Çalışma
------------------------

.. code-block:: shell

	sudo chroot /home/etapadmin/test komutunu kullanmalıyız.

.. image:: /_static/images/chroot-7.png
  :width: 600

- **abc** dizini oluşturuldu.   
- **abc** dizini silindi.
- **pwd** komutuyla konum öğrenildi. 
- **ldd** komutu sistemimizde olmadığından hata verdi.
- Çıkış için ise ***exit*** komutu kullanılarak sistemden çıkıldı.

Kaynak:
https://stackoverflow.com/questions/64838052/how-to-delete-n-characters-appended-to-ldd-list

.. raw:: pdf

   PageBreak


busybox Nedir?
++++++++++++++

Busybox tek bir dosya halinde bulunan birçok araç seçine sahip olan bir programdır. Bu araçlar initramfs sisteminde ve sistem genelinde sıkça kullanılabilir. Busybox aşağıdaki gibi kullanılır.

.. code-block:: shell

	$ busybox [komut] (seçenekler)

Eğer busyboxu komut adı ile linklersek o komutu doğrudan çalıştırabiliriz. Aşağıda tar uygulamasını busybox dan türettik.

.. code-block:: shell

	$ ln -s /bin/busybox ./tar
	$ ./tar

Busyboxtaki tüm araçları sisteme sembolik bağ atmak için aşağıdaki gibi bir yol izlenebilir. Bu işlem var olan dosyaları sildiği için tehlikeli olabilir. Sistemin tasarımına uygun olarak yapılmalıdır.

.. code-block:: shell

	$ busybox --install -s /bin # -s parametresi sembolik bağ olarak kurmaya yarar.
	
Busybox Derleme
---------------

Busybox **static** olarak derlenmediği sürece bir libc kütüphanesine ihtiyaç duyar. initramfs içerisinde kullanılacaksa içerisine libc dahil edilmelidir. Bir dosyanın static olarak derlenip derlenmediğini öğrenmek için aşağıdaki komut kullanılır. Derleme türleri ve detayları için bu dokümandaki derleme konusuna bakınız.

.. code-block:: shell

	$ ldd /bin/busybox # static derlenmişse hata mesajı verir. Derlenmemişse bağımlılıklarını listeler.

Busybox derlemek için öncelikle **make defconfig** kullanılarak veya önceden oluşturduğumuz yapılandırma dosyasını atarak yapılandırma işlemi yapılır. Ardından eğer static derleme yapacaksak yapılandırma dosyasına müdahale edilir. Son olarak **make** komutu kullanarak derleme işlemi yapılır.

.. code-block:: shell

	$ make defconfig
	$ sed -i "s|.*CONFIG_STATIC_LIBGCC .*|CONFIG_STATIC_LIBGCC=y|" .config
	$ sed -i "s|.*CONFIG_STATIC .*|CONFIG_STATIC=y|" .config
	$ make

Derleme bittiğinde kaynak kodun bulunduğu dizinde busybox dosyamız oluşmuş olur.

Static olarak derlemiş olduğumuz busyboxu kullanarak minimal bir dağıtım hazırlayabiliriz.

.. raw:: pdf

   PageBreak

OpenRC
++++++

Openrc sistem açılışında çalışacak uygulamaları çalışrıran servis yöneticisidir.

Kurulum
-------

Kaynak koddan derlemek için aşağıdaki adımları izlemelisiniz:

.. code-block:: shell

	$ git clone https://github.com/OpenRC/openrc
	$ cd openrc
	$ meson setup build --prefix=/usr
	$ ninja -C build install

Çalıştırılması
--------------

Openrc servis yönetiminin çalışması için boot parametrelerine yazılması gerekmektedir. 
**/boot/grub.cfg** içindeki **linux /vmlinuz init=/usr/sbin/openrc-init root=/dev/sdax** olan satırda **init=/usr/sbin/openrc-init** yazılması gerekmektedir. Artık sistem openrc servis yöneticisi tarafından uygulamalar çalıştırılacak ve sistem hazır hale getirilecek.

Basit kullanım
--------------

Servis etkinleştirip devre dışı hale getirmek için **rc-update** komutu kullanılır. Aşağıda **udhcpc** internet servisi örnek olarak gösterilmiştir. **/etc/init.d/** konumunda **udhcpc** dosyamızın olması gerekmektedir.

.. code-block:: shell

	# servis etkinleştirmek için
	$ rc-update add udhcpc boot
	# servisi devre dışı yapmak için
	$ rc-update del udhcpc boot
	# Burada udhcpc servis adı boot ise runlevel adıdır.

Servisleri başlatıp durdurmak için ise **rc-service** komutu kullanılır.

.. code-block:: shell

	$ rc-service udhcpc start
	# veya şu şekilde de çalıştırılabilir.
	$ /etc/init.d/udhcpc start

Servislerin durmunu öğrenmek için **rc-status** komutu kullanılır. Ayrıca
sistemdeki servislerin sonraki açılışta hangisinin başlatılacağını öğrenmek için
ise parametresiz olarak **rc-update** kullanabilirsiniz.

.. code-block:: shell

	# şu an hangi servislerin çalıştığını gösterir
	$ rc-status
	# sonraki açılışta hangi servislerin çalışacağını gösterir
	$ rc-update

Sistemi kapatmak veya yeniden başlatmak için **openrc-shutdown** komutunu kullanabilirsiniz.

.. code-block:: shell

	# kapatmak için
	$ openrc-shutdown -p 0
	# yeniden başlatmak için
	$ openrc-shutdown -r 0


Servis dosyası
--------------

Openrc servis dosyaları basit birer **bash** betiğidir. Bu betikler **openrc-run** komutu ile çalıştırılır ve çeşitli fonksiyonlardan oluşabilir. Servis dosyaları **/etc/init.d** içerisinde bulunur. Servisleri ayarlamak için ise **/etc/conf.d** içerisine aynı isimle ayar dosyası oluşturabiliriz.

Çalıştırılacak komut komut parametreleri ve **pidfile** dosyamızı aşağıdaki gibi belirtebiliriz.

.. code-block:: shell

	description="Ornek servis"
	command=/usr/bin/ornek-servis
	command_args=--parametre
	pidfile=/run/ornek-servis.pid

Bununla birlikte **start**, **stop**, **status**, **reload**, **start_pre**, **stop_pre** gibi fonksiyonlar da yazabiliriz.

.. code-block:: shell

	...
	start(){
	    ebegin "Starting ${RC_SVCNAME}"
	    start-stop-daemon --start --pidfile "/run/servis.pid" --exec /usr/bin/ornek-servis --parametre
	}
	...

Servis bağımlılıklarını belirtmek için ise **depend** fonksiyonu kullanılır.

.. code-block:: shell

	...
	depend() {
	  need localmount
	  after dbus
	}
	...

OpenRc Disk İşlemi
------------------

Kullandığımız servis yöneticisi openrc ise **/etc/fstab** komunundaki dosyaya bakarak diske erişim sağlamaktadır. Bundan dolayı **fstab** dosyamızı aşağıdaki gibi yapılandırmalıyız.

Fstab dosyası
-------------

Bu dosyayı doldurarak açılışta hangi disklerin bağlanacağını ayarlamalıyız. /etc/fstab dosyasını aşağıdakine uygun olarak doldurun.


.. code-block:: shell

	# <fs>                  <mountpoint>    <type>          <opts>          <dump/pass>
	/dev/sda1       /boot   vfat    defaults,rw     0       1
	/dev/sda2       /       ext4    defaults,rw     0       1



.. raw:: pdf

   PageBreak



Qemu Kullanımı
++++++++++++++

.. image:: /_static/images/0-qemu.png
  	:width: 100

Qemu Nedir?
-----------

Açık kaynaklı sanallaştırma aracıdır. 

Kaynak dosyalarından kurulum için;

.. code-block:: shell

	git clone https://gitlab.com/qemu-project/qemu.git
	cd qemu
	./configure
	make
	sudo make install
	
	
Sisteme Kurulum
---------------

.. code-block:: shell

	sudo apt update
	sudo apt install qemu-system-x86  qemu-utils

* 30GB bir disk oluşturup etahta.iso dosyamızı 2GB ramdan oluşan bir makina çalıştıralım.
	
.. code-block:: shell

	qemu-img create disk.img 30G #30GB disk oluşturuldu.
	qemu-system-x86_64 --enable-kvm -hda disk.img -m 2G -cdrom etahta.iso 

* Oluşturulan sanal disk ve 2GB ram ile açma.
	
.. code-block:: shell

	qemu-system-x86_64 --enable-kvm -hda disk.img -m 2G #sadece disk ile çalıştırılıyor

* Sistemi etahta.iso dosyamızı 2GB ramdan oluşan bir makina olarak çalıştıralım.
	
.. code-block:: shell
	
	qemu-system-x86_64 -m 2G -cdrom etahta.iso          #sadece iso doayası ile çalıştırma

Sistem Hızlandırılması
----------------------

**--enable-kvm** eğer sistem disk ile çalıştırıldığında bu parametre eklenmezse yavaş çalışacaktır.

Boot Menu Açma
--------------

Sistemin diskten mi imajdan mı başlayacağını başlangıçta belilemek için boot menu gelmesini istersek aşağıdaki gibi komut satırına seçenek eklemeliyiz.
	
.. code-block:: shell
	
	qemu-system-x86_64 --enable-kvm -cdrom distro.iso -hda disk.img -m 4G -boot menu=on  

Uefi kurulum için:
------------------

sudo apt-get install ovmf

qemu-system-x86_64 --enable-kvm -bios /usr/share/ovmf/OVMF.fd -cdrom distro.iso -hda disk.img -m 4G -boot menu=on   

qemu Host Erişimi:
------------------

kendi ipsi:10.0.2.15 

ana bilgisayar 10.0.0.2 olarak ayarlıyor.

vmlinuz ve initrd
-----------------
Daha sonra da qemu kullanarak test edelim.

.. code-block:: shell

	qemu-system-x86_64 --enable-kvm -kernel /boot/vmlinuz-5.17 -initrd /home/deneme/initrd.img -append "quiet" -m 512m

qemu Terminal Yönlendirmesi
----------------------------

.. code-block:: shell
	
	qemu-system-x86_64 --enable-kvm -kernel vmlinuz -initrd initrd.img -m 3G -serial stdio -append "console=ttyS0"

Diskteki Sistemin Açılışını Terminale Yönlendirme
-------------------------------------------------

.. code-block:: shell
	
	qemu-system-x86_64 -nographic -kernel boot/vmlinuz -hda disk.img -append console=ttyS0

Kaynak:
| https://www.ubuntubuzz.com/2021/04/how-to-boot-uefi-on-qemu.html  

.. raw:: pdf

   PageBreak

Live Sistem Oluşturma
+++++++++++++++++++++

Canlı sistem oluşturma veya ram üzerinden çalışan sistem hazırlamak için SquashFS dosya sisteminde dağıtım sıkıştırılmalıdır. Bu bağlamda SquashFS dosya sistemi ve sıkıştıma nasıl yapılır bu dokümanda anlatılmaktadır.

SquashFS Nedir?
---------------

SquashFS, Linux işletim sistemlerinde sıkıştırılmış bir dosya sistemidir. Bu dosya sistemi, sıkıştırma algoritması kullanarak dosyaları sıkıştırır ve ardından salt okunur bir dosya sistemine dönüştürür. SquashFS, özellikle gömülü sistemlerde ve Linux dağıtımlarında kullanılan bir dosya sistemidir.

SquashFS Oluşturma
------------------

.. code-block:: shell

	#mksquashfs input_source output/filesystem.squashfs -comp xz -wildcards 
	mksquashfs initrd $HOME/distro/filesystem.squashfs -comp xz -wildcards


Cdrom Erişimi
-------------

/dev/sr0, Linux işletim sistemlerinde bir CD veya DVD sürücüsünü temsil eden bir aygıt dosyasıdır. Bu dosya, CD veya DVD sürücüsünün fiziksel cihazını temsil eder ve kullanıcıların bu sürücüye erişmesini sağlar.

/dev/sr0 dosyası, Linux'un aygıt dosyası sistemi olan /dev dizininde bulunur. Bu dosya, Linux çekirdeği tarafından otomatik olarak oluşturulur ve sürücüye bağlı olarak farklı bir isim alabilir. Örneğin, ikinci bir CD veya DVD sürücüsü /dev/sr1 olarak adlandırılabilir.

Bu aygıt dosyası, kullanıcıların CD veya DVD'leri okumasına veya yazmasına olanak tanır. Örneğin, bir CD'yi okumak için aşağıdaki gibi bir komut kullanabilirsiniz:

.. code-block:: shell

	$ cat /dev/sr0

Cdrom Bağlama
-------------

.. code-block:: shell

	mkdir cdrom
	mount /dev/sr0 /cdrom

Bu işlem sonucunda cdrom bağlanmış olacaktır. iso dosyamızın içerisine erişebiliriz.

squashfs Dosyasını Bulma
--------------------------

Genellikle isoların içine squashfs dosyası oluşturlur. Bu sayede live yükleme yapılabilir. 
Örneğin /live/filesystem.squashfs benim imajlarımda böyle konumlandırıyorum.

squashfs Bağlama
----------------

squashfs dosyasını bağlamadan önce loop modülünün yüklü olması gerekmektedir. eğer yüklemediyseniz

.. code-block:: shell

	modprobe loop #loop modülü yüklenir.
	mkdir canli
	mount -t squashfs -o loop cdrom/live/filesystem.squashfs /canli

squashfs Sistemine Geçiş
------------------------

Yukarıdaki adımlarda squashfs doayamızı /canli adında dizine bağlamış olduk. Bu aşamadan sonra sistemimizin bir kopyası olan squashfs canlıdan erişebilir veya sistemi buradan başlatabiliriz.

squashfs dosya sistemimize bağlanmak için;

.. code-block:: shell

	chroot canli /bin/bash

Bu işlemin yerine exec komutuyla bağlanırsak sistemimiz id "1" değeriyle çalıştıracaktır. 
Eğer sistemin bu dosya sistemiyle açılmasını istiyorsak exec ile çalıştırıp id=1 olmasına dikkat etmeliyiz.

.. raw:: pdf

   PageBreak

kmod Nedir?
+++++++++++

Linux çekirdeği ile donanım arasındaki haberleşmeyi sağlayan kod parçalarıdır. Bu kod parçalarını kernele eklediğimizde kerneli tekrardan derlememiz gerekmektedir. Her eklenen koddan sonra kernel derleme, kod çıkarttığımzda kernel derlemek ciddi bir iş yükü ve karmaşa yaratacaktır.

Bu sorunların çözümü için modul vardır. moduller kernele istediğimiz kod parpalarını ekleme ya da çıkartma yapabiliyoruz. Bu işlemleri yaparken kenel derleme işlemi yapmamıza gerek yok.

Kernele modul yükleme kaldırma için kmod aracı kullanılmaktadır. kmaod aracı;

	.. code-block:: shell

		ln -s kmod /bin/depmod
		ln -s kmod /bin/insmod
		ln -s kmod /initrd/bin/lsmod
		ln -s kmod /bin/modinfo
		ln -s kmod /bin/modprobe
		ln -s kmod /bin/rmmod

şeklinde sembolik bağlarla yeni araçlar oluşturulmuştur.

**lsmod :** yüklü modulleri listeler

**insmod:** tek bir modul yükler

**rmmod:** tek bir modul siler

**modinfo:** modul hakkında bilgi alınır 

**modprobe:** insmod komutunun aynısı fakat daha işlevseldir. module ait bağımlı olduğu modülleride yüklemektedir. modprobe  modülü /lib/modules/ dizini altında aramaktadır.

**depmod:** /lib/modules dizinindeki modüllerin listesini günceller. Fakat başka bir dizinde ise basedir=konum şeklinde belirtmek gerekir. konum dizininde /lib/modules/** şeklinde kalsörler olmalıdır.


Modul Yazma
-----------

hello.c dosyamız
................

	.. code-block:: shell

		#include <linux/module.h>
		#include <linux/kernel.h>
		#include <linux/init.h>
		MODULE_DESCRIPTION("Hello World examples");
		MODULE_LICENSE("GPL");
		MODULE_AUTHOR("Bayram");
		static int __init hello_init(void)
		{
		printk(KERN_INFO "Hello world!\n");
		return 0;
		}
		static void __exit hello_cleanup(void)
		{
		printk(KERN_INFO "remove module.\n");
		}
		module_init(hello_init);
		module_exit(hello_cleanup);


Makefile dosyamız
-----------------

	.. code-block:: shell

		obj-m+=my_module.o
		all:
		    make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
		clean:
		    make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

modülün derlenmesi ve eklenip kaldırılması
------------------------------------------

	.. code-block:: shell

		make

		insmod my_modul.ko // modül kernele eklendi.

		lsmod | grep my_modul //modül yüklendi mi kontrol ediliyor.

		rmmod my_modul // modül kernelden çıkartılıyor.

Not:
----
dmesg ile log kısmında eklendiğinde Hello Word yazısını ve  kaldırıldığında modul ismini görebiliriz.

.. raw:: pdf

   PageBreak


sfdisk Nedir
++++++++++++

sfdisk, Linux işletim sistemlerinde disk bölümlerini yönetmek için kullanılan bir komuttur. Disk bölümlerini oluşturmak, düzenlemek, silmek veya görüntülemek için sfdisk'i kullanabilirsiniz.



**Disk Bölümlerini Görüntüleme:**
---------------------------------

Diskinizdeki mevcut bölümleri görüntülemek için sfdisk komutunu kullanabilirsiniz. Aşağıdaki komutu kullanarak mevcut bölümleri listeleyebilirsiniz:
	
.. code-block:: shell
	
	sfdisk -l /dev/sda

**Disk Bölümleri Oluşturma:**
-----------------------------

Yeni bir disk bölümü oluşturmak için sfdisk komutunu kullanabilirsiniz. Örneğin, /dev/sda üzerinde yeni bir bölüm oluşturmak için aşağıdaki komutu kullanabilirsiniz:
	
.. code-block:: shell
	
	echo ",,L" | sfdisk /dev/sda

Bu komut, kullanılabilir tüm alanı kullanarak bir bölüm oluşturacaktır.

**Disk Bölümlerini Silme:**
---------------------------

Bir disk bölümünü silmek için sfdisk komutunu kullanabilirsiniz. Örneğin, /dev/sda üzerindeki bir bölümü silmek için aşağıdaki komutu kullanabilirsiniz:
	
.. code-block:: shell
	
	echo ",,L" | sfdisk --delete /dev/sda

Bu komut, belirtilen bölümü silecektir.

sfdisk komutunun daha fazla seçeneği ve kullanımı vardır. Daha fazla bilgi için sfdisk komutunun man sayfasını inceleyebilirsiniz:

**Disk Etiketi Belirleme**
--------------------------
	
.. code-block:: shell
	
	echo 'label: dos' | sfdisk /dev/vda #dos label
	echo 'label: gpt' | sfdisk /dev/vda #gpt label


**Bazı Örnekler**
-----------------

**Örnek1:**
-----------

.. code-block:: shell
	
	sfdisk /dev/sdf <<EOF
	 0,512
	 ,512
	 ;
	 EOF

	/dev/sdf1 0+ 511 512- 4112639+ 83 Linux
	/dev/sdf2 512 1023 512 4112640 83 Linux
	/dev/sdf3 1024 1043 20 160650 83 Linux

 
**Örnek2:**
-----------
	
.. code-block:: shell
	
	sfdisk /dev/vda << EOF
	label: dos
	label-id: 0xaaaaaaaa
	# comment:
	start=, size= 50M,  type= 7 , bootable
	start=, size= 650M, type= 27
	start=, size= 45G , type= 7
	EOF

**Örnek3:**
-----------

Bu örnekte ilk bölüm 1GB ve ikinci bölüm ise diskin geri kalan kısmıdır.
	
.. code-block:: shell
	
	echo -e "label: gpt\n,1GiB\n," | sudo sfdisk /dev/vda
	veya
	sfdisk /dev/vda << EOF
	label: gpt
	,1GiB
	,
	EOF


**Örnek4:**
-----------

	
.. code-block:: shell
	
	my.layout
	# partition table of /dev/sda
	unit: sectors

	/dev/sda1 : start=     2048, size=   497664, Id=83, bootable
	/dev/sda2 : start=   501758, size=1953021954, Id= 5
	/dev/sda3 : start=        0, size=        0, Id= 0
	/dev/sda4 : start=        0, size=        0, Id= 0
	/dev/sda5 : start=   501760, size=1953021952, Id=8e

Aynı disk bölümlemesini ve düzenini başka bir aygıta uygulamak için:

	
.. code-block:: shell
	
	sfdisk /dev/sdb < my.layout 

.. raw:: pdf

   PageBreak

strip
++++++

strip komutu, derlenmiş bir programın veya paylaşılan bir kütüphanenin dosya boyutunu küçültmek için kullanılır. Bu komut, derleme sürecinde oluşturulan fazladan semboller ve hata ayıklama bilgilerini kaldırır. Bu sayede, dosyanın boyutu azalır ve gereksiz veri miktarı azalır.

strip komutunu kullanmak için, terminalde aşağıdaki şekilde bir komut satırı kullanabilirsiniz:

.. code-block:: shell

	strip dosya_adı

Burada "dosya_adı" yerine, boyutunu küçültmek istediğiniz dosyanın adını belirtmelisiniz. Örneğin, "strip program" komutunu kullanarak "program" adlı bir dosyanın boyutunu küçültebilirsiniz.

strip komutu, genellikle Linux ve Unix tabanlı işletim sistemlerinde kullanılır. Bu komut, programların dağıtımı veya paylaşımı sırasında dosya boyutunu azaltmak için yaygın olarak kullanılır.

Bu komutun kullanımı, programların performansını artırabilir ve disk alanından tasarruf sağlayabilir. Ancak, hata ayıklama veya sembol bilgilerine ihtiyaç duyduğunuz durumlarda strip komutunu kullanmaktan kaçınmanız önemlidir.

Sonuç olarak, strip komutu, derlenmiş programların veya paylaşılan kütüphanelerin boyutunu küçültmek için kullanılan bir Linux komutudur.

.. raw:: pdf

   PageBreak


Sistem Dili Değiştirme
++++++++++++++++++++++
Dil ayarlama

Sistem dilini ayarlamak için öncelikle /etc/locale.gen dosyamızı aşağıdaki gibi düzenleyelim.

    Dil kodlarına /usr/share/i18n/locales içerisinden ulaşabilirsiniz.

    Karakter kodlamalara /usr/share/i18n/charmaps içinden ulaşabilirsiniz.

tr_TR.UTF-8 UTF-8

Not: En altta boş bir satır bulunmalıdır.

Ardından /lib64/locale dizini yoksa oluşturalım.

mkdir -p /lib64/locale/

Şimdi de çevresel değişkenlerimizi ayarlamak için /etc/profile.d/locale.sh dosyamızı düzenleyelim.

#!/bin/sh
# Language settings
export LANG="tr_TR.UTF-8"
export LC_ALL="tr_TR.UTF-8"

Not: Türkçe büyük küçük harf dönüşümü (i -> İ ve ı -> I) ascii standartına uyumsuz olduğu için LC_ALL kısmını türkçe ayarlamayı önermiyoruz. Bunun yerine C.UTF-8 veya en_US.UTF-8 olarak ayarlayabilirsiniz.

Son olarak locale-gen komutunu çalıştıralım.

locale-gen

Eğer /lib64/locale/ dizine okuma iznimiz yoksa verelim.

chmod 755 -R /lib64/locale/



**1. Yöntem**
-------------

/etc/default/locale dosyasını root olarak bir metin editörü ile açın.

- **Türkçe için :** LANG=tr_TR.UTF-8
- **İngilizce için :** LANG=en_US.UTF-8

Sistemi yeniden başlattığınızda seçtiğiniz dil aktif olacaktır.


**2. Yöntem**
-------------

/etc/profile.d/locale.sh dosyanı oluşturun içeriğini aşağıdaki gibi ayarlayın.

.. code-block:: shell

	# Language settings
	export LANG="tr_TR.UTF-8"
	export LC_ALL="tr_TR.UTF-8"

**/etc/profile.d/**  dizin erişim iznini 755 yapın.

**profile**
-----------

**/etc/profile** dosya içeriğini  aşağıdaki gibi bir betik bulunmalıdır.
 /etc/profile dosyanının içerisinde aşağıdaki betik olmalıdır. Bu betik **/etc/profile.d** içerisinde betikler varsa tüm kullanıcalr için çalıştırılmasını sağlar.

.. code-block:: shell

	if [ -d /etc/profile.d ]; then
	  for i in /etc/profile.d/*.sh; do
		if [ -r $i ]; then
		  . $i
		fi
	  done
	  unset i
	fi


**3.Yöntem**
------------

ayarlarını değiştirmek istediğimiz kullanıcı dizinideki **~/.profile** dosyasının içeriğine aşağıdaki kod satırını eklemeliyiz.

.. code-block:: shell
	
	export LANG="tr_TR.UTF-8"
	export LC_ALL="tr_TR.UTF-8"


.. raw:: pdf

   PageBreak


Kullanıcı Sistem Ayarları
+++++++++++++++++++++++++

Profile Dosyası
---------------

/etc/profile dosyası, Linux sistemlerinde kullanıcıların oturum açtıklarında çalıştırılan bir betik dosyasıdır. Bu dosya, tüm kullanıcılar için ortak kabuk ayarlarını ve ortam değişkenlerini tanımlar. Kullanıcı oturumu başlatıldığında, /etc/profile dosyası sistem genelindeki ayarları yükler ve kullanıcı oturumuna uygular. Bu dosya, kullanıcıların kabuk ortamlarını yapılandırmak ve özelleştirmek için kullanılır. Örneğin, PATH değişkenini tanımlamak veya diğer kabuk ayarlarını yapılandırmak için /etc/profile dosyası düzenlenebilir. Bu dosya, sistem genelinde tutarlı bir kabuk ortamı sağlamak için önemlidir.

.. code-block:: shell

		/etc/profile
		/etc/profile.d/*
		/etc/environment
		~/.profile, veya ~/.bash_profile veya ~/.login veya ~/.zprofile giriş kabuğunuza bağlı olarak
		~/.pam_environment
		(yalnızca terminalde çalışan kabuklar için) /etc/bash.bashrc, /etc/zshrc, ~/.bashrc, ~/.zshrc, vesaire.


 **Not:**   /etc/profile.d/ dizinine root dışında kullanıcılar erişim sağlaması için 755 yapmalısınız.
 
** profile**
------------

 /etc/profile dosyanının içerisinde aşağıdaki betik olmalıdır. Bu betik **/etc/profile.d** içerisinde betikler varsa tüm kullanıcılar için çalıştırılmasını sağlar.

.. code-block:: shell

	if [ -d /etc/profile.d ]; then
	  for i in /etc/profile.d/*.sh; do
		if [ -r $i ]; then
		  . $i
		fi
	  done
	  unset i
	fi


.. raw:: pdf

   PageBreak


Add User
++++++++

adduser ve useradd komutları, Linux işletim sisteminde kullanıcı hesapları oluşturmak için kullanılan iki farklı komuttur. Bu iki komut arasındaki temel farklar şunlardır:

1. Kullanım Kolaylığı:

    adduser, interaktif bir arayüz sağlar ve kullanıcı oluşturma işlemi sırasında bir dizi soru sorarak kullanıcı dostu bir yaklaşım sunar.
    useradd ise daha düşük seviyeli bir komuttur ve tüm parametreleri elle belirtmenizi gerektirir. Bu nedenle, kullanımı daha teknik ve karmaşıktır.

Örnek kullanım:

.. code-block:: shell

	# adduser komutuyla kullanıcı oluşturma
	sudo adduser yeni_kullanici
	# useradd komutuyla kullanıcı oluşturma
	sudo useradd -m -s /bin/bash yeni_kullanici

2. Varsayılan Davranışlar:

    adduser, varsayılan olarak kullanıcı için ev dizini oluşturur ve gerekli ayarları yapar.
    useradd ise temel bir kullanıcı hesabı oluşturur ancak ek parametreler belirtilmediği sürece ek işlemleri gerçekleştirmez.

3. Güvenlik ve Uyumluluk:

    adduser, kullanıcı oluştururken bazı güvenlik kontrolleri yapar ve sistem uyumluluğunu sağlamak için ek adımlar atar.
    useradd ise daha esnek bir yapıya sahiptir ve kullanıcı oluşturma işlemini daha özelleştirilmiş bir şekilde gerçekleştirmenize olanak tanır.

Sonuç olarak, genel olarak adduser komutu, kullanıcı dostu bir arayüz sunar ve standart kullanıcı oluşturma işlemleri için tercih edilirken, useradd komutu daha teknik detaylara hakim olan kullanıcılar tarafından tercih edilebilir. Her iki komut da kullanıcı yönetimi için önemli araçlardır ve ihtiyaca göre tercih edilmelidir.


.. raw:: pdf

   PageBreak

github
++++++

GitHub üzerinde yeni bir depo açmak oldukça basit bir işlemdir. Aşağıdaki adımları takip ederek hızlıca kendi deponuzu oluşturabilirsiniz:

- **GitHub Hesabınıza Giriş Yapın:** GitHub ana sayfasına gidin ve hesabınıza giriş yapın. Eğer bir hesabınız yoksa, öncelikle bir hesap oluşturmalısınız.

- **Yeni Depo Oluşturma:** Sağ üst köşede bulunan "+" simgesine tıklayın ve "New repository" seçeneğini seçin.

- **Depo Bilgilerini Girin:** Açılan sayfada, depo adını (repository name) ve isteğe bağlı olarak bir açıklama (description) girin. Depo özel (private) veya herkese açık (public) olarak ayarlanabilir.

- **İlk Dosyayı Oluşturma:** "Initialize this repository with a README" seçeneğini işaretleyerek, depo oluşturulduğunda otomatik olarak bir README dosyası oluşturabilirsiniz.

- **Depoyu Oluşturma:** "Create repository" butonuna tıklayarak deponuzu oluşturun.

Artık GitHub üzerinde yeni bir deponuz var! Bu depoyu yerel bilgisayarınıza klonlayarak projelerinizi yönetmeye başlayabilirsiniz. Örneğin, terminalde şu komutu kullanarak deponuzu klonlayabilirsiniz:


.. code-block:: shell

	git clone https://github.com/kullaniciadi/depoadi.git

Bu adımları takip ederek GitHub üzerinde kolayca depo açabilirsiniz.

.. raw:: pdf

   PageBreak

Terminal Yönlendirmesi
++++++++++++++++++++++

Linux ortamında masaütündeyken sudo ile script çalıştırıldığında masaütünü açtığımız kullanıcının tespiti aşağıdaki kodla yapılabilir.

.. code-block:: shell

	#!/bin/bash

	#Detect the name of the display in use
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"

	#Detect the user using such display
	user=$(who | grep '('$display')' | awk '{print $1}')

	#Detect the id of the user
	uid=$(id -u $user)

	echo $user $uid
	
	
.. raw:: pdf

   PageBreak

cgroup
++++++

Cgroup, Linux çekirdeği tarafından sağlanan bir özellik olup, sistem kaynaklarını gruplar halinde yönetmemize olanak tanır. Bu, özellikle sunucu ortamlarında ve konteyner teknolojilerinde oldukça faydalıdır. Cgroup sayesinde, belirli bir grup süreç için kaynakları sınırlayabilir, izleyebilir ve yönetebilirsiniz.

Cgroup'un Temel Özellikleri
---------------------------

- **Kaynak Sınırlama:** Cgroup, belirli bir grup süreç için CPU, bellek, disk ve ağ gibi kaynakları sınırlamanıza olanak tanır. Örneğin, bir uygulamanın bellek kullanımını 512 MB ile sınırlamak istiyorsanız, cgroup kullanarak bunu kolayca yapabilirsiniz.

- **Kaynak İzleme:** Cgroup, süreçlerin kaynak kullanımını izlemek için de kullanılabilir. Bu, sistem yöneticilerinin hangi süreçlerin ne kadar kaynak kullandığını görmesine yardımcı olur.

- **Hiyerarşi:** Cgroup, hiyerarşik bir yapıya sahiptir. Yani, bir cgroup içinde başka cgroup'lar oluşturabilirsiniz. Bu, daha karmaşık kaynak yönetimi senaryoları için faydalıdır.

Cgroup Kullanımı
----------------

Cgroup kullanmaya başlamak için öncelikle sisteminizde cgroup'un etkin olduğundan emin olmalısınız. Genellikle modern Linux dağıtımlarında cgroup varsayılan olarak aktiftir. Cgroup ile çalışmak için aşağıdaki adımları izleyebilirsiniz:
1. Cgroup Oluşturma

Öncelikle, bir cgroup oluşturmalısınız. Bunun için terminalde aşağıdaki komutu kullanabilirsiniz:


.. code-block:: shell

	sudo mkdir /sys/fs/cgroup/memory/my_cgroup

Bu komut, "my_cgroup" adında bir bellek cgroup'u oluşturur.

2. Kaynak Sınırlama

Oluşturduğunuz cgroup'a bellek sınırı eklemek için şu komutu kullanabilirsiniz:


.. code-block:: shell

	echo 512M | sudo tee /sys/fs/cgroup/memory/my_cgroup/memory.limit_in_bytes

Bu komut, "my_cgroup" için bellek sınırını 512 MB olarak ayarlar.

3. Süreç Ekleme

Artık bir cgroup oluşturduğunuza göre, bu cgroup'a süreç ekleyebilirsiniz. Bunun için, eklemek istediğiniz sürecin PID'sini öğrenin ve aşağıdaki komutu kullanın:


.. code-block:: shell

	echo <PID> | sudo tee /sys/fs/cgroup/memory/my_cgroup/cgroup.procs

Burada <PID> kısmını eklemek istediğiniz sürecin PID'si ile değiştirin.

4. İzleme

Cgroup'un kaynak kullanımını izlemek için aşağıdaki komutu kullanabilirsiniz:


.. code-block:: shell

	cat /sys/fs/cgroup/memory/my_cgroup/memory.usage_in_bytes

Bu komut, "my_cgroup" içindeki süreçlerin toplam bellek kullanımını gösterir.

Cgroup'un Avantajları
---------------------

- **Kaynak Yönetimi:** Sunucu kaynaklarını daha verimli bir şekilde yönetmenizi sağlar.
- **Performans İyileştirmesi:** Süreçlerin kaynak kullanımını sınırlayarak sistemin genel performansını artırabilir.
- **Güvenlik:** Belirli süreçlerin diğer süreçlerin kaynaklarına erişimini kısıtlayarak güvenliği artırır.

Sonuç
-----

Cgroup, Linux sistemlerinde kaynak yönetimi için güçlü bir araçtır. Özellikle sunucu ve konteyner ortamlarında, kaynakları etkili bir şekilde yönetmek ve izlemek için vazgeçilmezdir. Yukarıda bahsedilen adımları takip ederek, cgroup ile kaynak yönetimi yapmaya başlayabilirsiniz. Unutmayın, her zaman sistem kaynaklarınızı izlemek ve gerektiğinde ayarlamalar yapmak önemlidir.
	
	
.. raw:: pdf

   PageBreak

user-dirs
+++++++++

user-dirs, Linux işletim sistemlerinde kullanıcıların özel klasörlerini içeren bir sistemdir. Bu klasörler genellikle "Masaüstü", "Belgeler", "İndirilenler" gibi isimlerle tanımlanır ve kullanıcıların dosyalarını düzenlemelerini kolaylaştırır.

user-dirs klasörünü kaldırmak için aşağıdaki adımları izleyebilirsiniz:

    Terminali açın ve aşağıdaki komutu girin:

.. code-block:: shell

	nano ~/.config/user-dirs.dirs

    Bu komut, user-dirs.dirs dosyasını açacaktır. Bu dosya, kullanıcı klasörlerinin yolunu ve adını içerir.

    Dosyayı düzenlemek için, kaldırmak istediğiniz klasörün satırını bulun ve "#" işaretiyle başlayan bir yorum satırı yapın. Örneğin, "Masaüstü" klasörünü kaldırmak istiyorsanız, satırı aşağıdaki gibi düzenleyin:

.. code-block:: shell

	#XDG_DESKTOP_DIR="$HOME/Masaüstü"

    Dosyayı kaydetmek ve kapatmak için "Ctrl + X" tuşlarına basın, ardından "Y" tuşuna basın ve Enter tuşuna basın.

    Değişikliklerin etkili olması için oturumu kapatıp tekrar açın veya aşağıdaki komutu girin:

.. code-block:: shell

	xdg-user-dirs-update

Bu adımları takip ederek user-dirs klasörünü Linux sisteminizden kaldırabilirsiniz. Ancak, dikkatli olun ve yanlışlıkla önemli dosyaları silmemeye özen gösterin.

Yeni oluşturulacak kullanıcılarda oluşturulmamasını istiyorsak **/etc/skel/.config/user-dirs.dirs** dosyasını silmeliyiz.


.. raw:: pdf

   PageBreak

ld(linker)
++++++++++

ld (linker) komutu, Linux sistemlerinde derlenmiş nesne dosyalarını birleştirmek ve yürütülebilir dosyalar veya paylaşılan kütüphaneler oluşturmak için kullanılan bir araçtır. Bu komut, derleyicinin çıktısı olan nesne dosyalarını alır ve bunları birleştirerek çalıştırılabilir bir dosya oluşturur.

ld komutu, bir programın bağımlılıklarını çözmek ve gerekli kütüphaneleri eklemek için kullanılır. Bu sayede program, çalıştırıldığında gereken tüm kütüphanelere erişebilir ve doğru şekilde çalışabilir.

Aşağıda basit bir örnek verilmiştir:

.. code-block:: shell

	gcc -c main.c -o main.o
	gcc -c helper.c -o helper.o
	ld main.o helper.o -o program

Bu örnekte, gcc komutuyla main.c ve helper.c dosyaları derlenir ve nesne dosyaları (main.o ve helper.o) oluşturulur. Ardından, ld komutuyla bu nesne dosyaları birleştirilerek program adında bir çalıştırılabilir dosya oluşturulur.

ld komutu, Linux sistemlerinde programların derlenmesi ve çalıştırılması sürecinde önemli bir rol oynar ve programların doğru şekilde çalışmasını sağlar.

Linker Türleri
--------------

Linker, bir programın derlenmiş obje dosyalarını birleştirerek çalıştırılabilir bir dosya oluşturan bir yazılımdır. Linker, programın farklı bölümlerini bir araya getirir, sembol tablolarını oluşturur ve bağımlılıkları çözer.

Linux'ta kullanılan yaygın linker çeşitleri şunlardır:

    GNU Linker (ld): GNU Projesi'nin bir parçası olan GNU Linker, Linux sistemlerinde en yaygın olarak kullanılan linker'dır. ld, derlenmiş obje dosyalarını birleştirir ve çalıştırılabilir bir dosya oluşturur. Ayrıca, dinamik bağlantı için gerekli olan dinamik kütüphaneleri de yönetir.

    Gold Linker: Gold Linker, GNU Linker'a alternatif olarak geliştirilmiş bir linker'dır. Gold Linker, daha hızlı bağlama süreleri sunar ve büyük projelerde performans avantajı sağlar.

    LLD (LLVM Linker): LLD, LLVM projesinin bir parçası olan modern bir linker'dır. LLD, hızlı bağlama süreleri ve düşük bellek tüketimi ile bilinir. Ayrıca, birden fazla platformda çalışabilme özelliğine sahiptir.

Bu linker çeşitleri, Linux sistemlerinde programların birleştirilmesi ve çalıştırılabilir dosyaların oluşturulması için kullanılır. Her bir linker'ın kendine özgü avantajları ve kullanım senaryoları vardır. Projenizin gereksinimlerine ve tercihlerinize bağlı olarak uygun olanı seçebilirsiniz.


.. code-block:: shell

	# GNU Linker (ld) kullanım örneği
	ld -o program program.o

	# Gold Linker kullanım örneği
	gold -o program program.o

	# LLD (LLVM Linker) kullanım örneği
	lld -o program program.o

.. raw:: pdf

   PageBreak

.. _yardimcikonular:
Yardımcı Konular
================

Hakkımda
========
.. toctree::
	:glob:

.. image:: /_static/images/about.svg
	:width: 200
  		
Açık kaynaklı sistemleri tanıma ve geliştirme yapma projesi.


.. raw:: pdf

   PageBreak

İletişim
========
.. toctree::
	:glob:


Linux, açık kaynaklı bir işletim sistemi olarak birçok avantaj sunmaktadır. Öncelikle, güvenlik açısından oldukça sağlam bir yapıya sahiptir. Virüs ve kötü amaçlı yazılımlara karşı daha az hassas olması, özellikle sunucu ve kritik sistemlerde tercih edilmesini sağlar. Ayrıca, Linux'un özelleştirilebilir yapısı sayesinde kullanıcılar, ihtiyaçlarına uygun bir sistem oluşturabilirler.

Performans açısından da Linux, hafif dağıtımları ile eski donanımlarda bile yüksek verimlilik sunar. Geliştiriciler için sunduğu güçlü komut satırı araçları ve paket yöneticileri, yazılım geliştirme süreçlerini hızlandırır.

Linux topluluğu oldukça aktiftir ve kullanıcılar, forumlar ve belgeler aracılığıyla destek alabilirler. Tüm bu nedenlerle, Linux kullanmak, hem bireysel hem de kurumsal düzeyde birçok avantaj sağlamaktadır.


.. image:: /_static/images/contact.svg
	:width: 150
  		
https://github.com/kendiliuxunuyap
E-Posta : kendiliuxunuyap@gmail.com


.. raw:: pdf

   PageBreak

.. toctree::
	:glob:


Kendi Linux'unu Yap
===================

Bu dokumanda dağıtım hazırlamak için temel işlemler anlatılmaktadır.

Bu kitap, açık kaynak ve özgür yazılıma gönül vermiş kişilerin, Türkçe kaynak bulamama sıkıntısına bir çözüm olarak hayata geçirilmiş bir projedir. Açık kaynak dünyasında kendi dağıtımlarını yapmak isteyen kişilere bir rehber olacak şekilde hazırlanmıştır. Bu dokümanda anlatılan sıralamaya göre işlemleri uyguladığınızda kendi sisteminiz derleyip iso halinde son kullanıcını kullanabileceği gibi bir sistem ortaya çıkartabilirsiniz. 


Kaynak ve dokümanlarımız yansılarımız:

* Bu sitedeki bilgilerin pdf kitap hali için `tıklayınız. <https://kendilinuxunuyap.github.io/kitap/>`_



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

**glibc** kütüphanemizi derlerken yukarıda yapılan işlem adımlarını ve hata çözümlemesini bir script dosyasında yapabiliriz. Bu dokümanda altta paylaşılan script dosyası yöntemi tercih edildi. 

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="2.38"
	name="glibc"
	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz
	wget https://ftp.gnu.org/gnu/libc/${name}-${version}.tar.gz
	tar -xvf ${name}-${version}.tar.gz
	cd ${name}-${version} # Kaynak kodun içine giriliyor
	configure --prefix=/ --disable-werror
	
	# derleme
	make 
	
	# derlenen paketin yüklenmesi ve ayarlamaların yapılması
	make install DESTDIR=$HOME/distro/rootfs
	cd $HOME/distro/rootfs/
	ln -s lib lib64

Diğer paketlerimizde de **glibc** için paylaşılan script dosyası gibi dosyalar hazırlayıp derlenecektir.

.. raw:: pdf

   PageBreak




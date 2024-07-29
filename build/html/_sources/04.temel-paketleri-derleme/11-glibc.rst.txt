glibc Nedir?
++++++++++++

glibc (GNU C Kütüphane) Linux sistemlerinde kullanılan bir C kütüphanesidir. Bu kütüphane, C programlama dilinin temel işlevlerini sağlar ve Linux çekirdeğiyle etkileşimde bulunur.

glibc, birçok standart C işlevini içerir ve bu işlevler, bellek yönetimi, dosya işlemleri, dize işlemleri, ağ işlemleri ve daha fazlası gibi çeşitli görevleri yerine getirmek için kullanılabilir. Bu kütüphane, Linux sistemlerinde yazılım geliştirme sürecini kolaylaştırır ve programcılara güçlü bir araç seti sunar.

glibc, Linux sistemlerinde C programlama dilini kullanarak yazılım geliştirmek için önemli bir araçtır. Bu kütüphane, Linux'ta çalışan birçok programın temelini oluşturur ve geliştiricilere güçlü bir platform sunar.

glibc Derleme
-------------

.. code-block:: shell

	cd $HOME/ # Ev dizinine geçiyorum.
	wget https://ftp.gnu.org/gnu/libc/glibc-2.38.tar.gz # glibc kaynak kodunu indiriyoruz.
	tar -xvf glibc-2.38.tar.gz # glibc kaynak kodunu açıyoruz.
	mkdir build-glibc && cd build-glibc # glibc derlemek için bir derleme dizini oluşturuyoruz.
	../glibc-2.38/configure --prefix=/ --disable-werror # Derleme ayarları yapılıyor
	make # glibc derleyelim.

glibc Yükleme
-------------

**$HOME/rootfs** kalsörünü oluştrudan aşağıdaki gibi yükleme yapmalıyız.

.. code-block:: shell

	make install DESTDIR=$HOME/rootfs # Ev Dizinindeki rootfs dizinine glibc yükleyelim.

glibc Test Etme
---------------

glibc kütüphanemizi **$HOME/rootfs** komununa yükledik. Şimdi bu kütüphanenin çalışıp çalışmadığını test edelim.

Aşağıdaki c kodumuzu derleyelim ve **$HOME/rootfs** konumuna kopyalayalım.


.. code-block:: shell

	#include<stdio.h>
	void main()
	{
	puts("Merhaba Dünya");
	}

Program Derleme
................

.. code-block:: shell
	
	gcc -o merhaba merhaba.c 

Program Yükleme
...............

Derlenen çalışabilir merhaba dosyamızı **glibc** kütüphanemizin olduğu dizine yükleyelim. 

.. code-block:: shell
	
	cp merhaba $HOME/rootfs/merhaba # derlenen merhaba ikili dosyası $HOME/rootfs/ konumuna kopyalandı.

Programı Test Etme
..................

**glibc** kütüphanemizin olduğu dizin dağıtımızın ana dizini oluyor.  **$HOME/rootfs/** konumuna **chroot** ile erişelim.

Aşağıdaki gibi çalıştırdığımızda bir hata alacağız.

.. code-block:: shell

	sudo chroot $HOME/rootfs/ /merhaba
	chroot: failed to run command ‘/merhaba’: No such file or directory
	
Hata Çözümü
...........

.. code-block:: shell
	
	# üstteki hatanın çözümü sembolik bağ oluşturmak.
	cd $HOME/rootfs/
	ln -s lib lib64

#merhaba dosyamızı tekrar chroot ile çalıştıralım. Aşağıda görüldüğü gibi hatasız çalışacaktır.

.. code-block:: shell
	
	sudo chroot rootfs /merhaba
	Merhaba Dünya

**Merhaba Dünya** mesajını gördüğümüzde glibc kütüphanemizin  ve merhaba çalışabilir dosyamızın çalıştığını anlıyoruz. 
Bu aşamadan sonra **Temel Paketler** listemizde bulunan paketleri kodlarından derleyerek **$HOME/rootfs/** dağıtım dizinimize yüklemeliyiz.
Derlemede **glibc** kütüphanesinin derlemesine benzer bir yol izlenecektir. **glibc** temel kütüphane olması ve ilk derlediğimiz paket olduğu için detaylıca anlatılmıştır.

**glibc** kütüphanemizi derlerken yukarıda yapılan işlem adımlarını ve hata çözümlemesini bir script dosyasında yapabiliriz. Bu dokümanda altta paylaşılan script dosyası yöntemi tercih edildi. 

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="2.38"
	name="glibc"
	mkdir -p $HOME/distro
	cd $HOME/distro
	rm -rf ${name}-${version}
	rm -rf build-${name}-${version}
	wget https://ftp.gnu.org/gnu/libc/${name}-${version}.tar.gz
	tar -xvf ${name}-${version}.tar.gz
	mkdir build-${name}-${version}
	cd build-${name}-${version}
	../${name}-${version}/configure --prefix=/ --disable-werror
	
	# derleme
	make 
	
	# derlenen paketin yüklenmesi ve ayarlamaların yapılması
	make install DESTDIR=$HOME/rootfs
	cd $HOME/rootfs/
	ln -s lib lib64

Diğer paketlerimizde de **glibc** için paylaşılan script dosyası gibi dosyalar hazırlayıp derlenecektir.

.. raw:: pdf

   PageBreak




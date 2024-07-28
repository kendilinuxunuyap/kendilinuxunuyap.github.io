.. _temelpakaetler:

Temel Paketler
++++++++++++++

Dağıtım temel seviyede kullanıcıya tyy ortamı sunan bir yapıdan oluşacak. Ayrıca kendini kurup grubu yükleyecek bir yapıda olmasını planlamaktayız. Bu yapıda bir dağıtım için aşağıdaki paketlere ihtiyacımız olacak. Bunlar;

1. glibc
	- readline
		* bash
	- ncurses
		* bash
	- zlib
		* kmod
	- xz-utils
		* kmod
	- util-linux
	- eudev
	- busybox
	- e2fsprogs
	- grub
	- initramfs-tools
	- libarchive
	- curl 

Paket listemizde **glibc** tüm paketlerin ihtiyaç duyacağı kütüphaneleri sağlayan pakettir.

Örneğin listede **bash** uygulamasının çalışabilmesi için **readline** ve **ncurses** kütüphaneleri gerekli. **readline** ve **ncurses** kütüphanelerinin çalışabilmesi içinde **glibc** kütüphanesi gerekli. 
Bash paketinin bağımlı olduğu kütüphaneler geriye doğru takip ederek listelenir. 

Sonuç olarak bash paketini derlerken paketin;

- name="bash"
- version="x.x.x"
- depends="glibc,readline,ncurses" şeklinde temel bilgilerini belirterek paketler yapacağız.


Bu sayede paketimizin çalışabilmesi için temel bilgileri belirlemiş oluyoruz.  Bu bilgileri paketi derlerken belirteceğiz. Bu temel bilgiler paketin dağıtıma kurulması, kaldırılması, bağımlılık ve bağımlılık çakışmalarının tespitinde kullanılacak.  

Listede bulunan tüm paketlerin hepsinde  burada anlatılan bağımlılık tespiti hatasız yapılmalıdır. Burada tüm paketlerin derlenmesinde izlenmesi gereken işlem adımlarını ve bağımlılık sadece **bash** ve **kmod** paketleri özelinde anlatılmaya çalışıldı. Diğer paketler içinde bağımlı olduğu paketler olacaktır. 

**glibc** dağıtımda sistemdeki bütün uygulamaların çalışmasını sağlayan en temel C kütüphanesidir. GNU C Library(glibc)'den farklı diğer C standart kütüphaneler şunlardır: Bionic libc, dietlibc, EGLIBC, klibc, musl, Newlib ve uClibc. **glibc** yerine alternatif olarak çeşitli avantajlarından dolayı kullanılabilir. **glibc** en çok tercih edilen ve uygulama (özgür olmayan) uyumluluğu bulunduğu için bu dokümanda glibc üzerinden anlatım yapılacaktıdr. Listede bulunan paketler sırasıyla nasıl derleneceği ayrı başlıklar altında anlatılacaktır.

.. raw:: pdf

   PageBreak


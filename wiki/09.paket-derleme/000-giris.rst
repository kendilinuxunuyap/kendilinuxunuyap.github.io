Bir önceki bölümde, temel bir sistem hazırlamayı adım adım öğrenmiştik. O çalışmada, temel işlevselliğe sahip, kendi kendine açılabilen, küçük ama işlevsel bir Linux ortamı kurduk. Şimdi ise bu yolculuğu bir adım daha ileri taşıyoruz!

Artık daha güçlü, daha esnek ve daha geniş özelliklere sahip bir sistem inşa etmenin zamanı geldi. Bu bölümde, **GNU araçlarıyla** nasıl bir dağıtım hazırlayabileceğimizi detaylı şekilde anlatacağız. Peki neden busybox'la yetinmeyip GNU araçlarına geçiyoruz? İşte tam da burada kararımızın nedenlerini birlikte keşfedelim.

BusyBox:
--------

**BusyBox**, bize temel sistem oluşturmada büyük kolaylık sağladı. Tek bir binary ile onlarca temel komutu çalıştırabildik, disk alanından tasarruf ettik ve bağımlılıklarla uğraşmadık. Busybox özellikle gömülü sistemlerde ve kurtarma ortamlarında adeta bir hayat kurtarıcı. **BusyBox** kurulumu ve kullanımıyla ilgili detayları **Yardımcı Konular** bölümünde bulabilirsiniz.

Avantajlar
..........

- **Küçük boyut**, **Taşınabilirlik** : Tek binary ile onlarca komut.
- **Düşük bağımlılık**: Ekstra kütüphane gerektirmez.
- **Kolay kurulum**: Derlemesi ve kurulumu oldukça basit.
- **Çok amaçlı kullanım**: Tek dosyada tüm temel araçlar.

Dezavantajlar
.............

- **Sınırlı özellikler**: Gelişmiş parametre seçenekleri yok.
- **Standart dışı davranışlar**, **Script uyumsuzluğu**: GNU araçlarıyla tam uyumlu değil. Karmaşık bash scriptleri çalışmayabilir.
- **Performans sınırlamaları**: Büyük veri işlemlerinde yetersiz.
- **Hata ayıklama zorlukları**: Detaylı debug için yetersiz.

İşte bu nedenle, artık GNU araçlarıyla donatılmış daha güçlü bir sistem hazırlama zamanı geldi.

Yeni Hedef: Tam Teşekküllü Bir Linux Dağıtımı
----------------------------------------------

Bu yolculukta, aşağıdaki yeteneklere sahip bir sistem kurmayı hedefliyoruz:

- Temel **Linux komutlarını** eksiksiz şekilde çalıştırabilmek
- **Bash kabuğu** ile tam işlevli bir TTY ortamı sunmak
- Farklı **sıkıştırma formatlarıyla** dosya işlemleri yapmak
- **Kernel modüllerini** yönetebilmek
- **Initrd** (Initial RAM Disk) oluşturabilmek
- **GRUB** ile sistem önyüklemesi yapabilmek
- Sistemi hem **kurulabilir** hem de **live (canlı)** modda çalıştırabilmek
- **İnternete bağlanabilir** olmak
- **SSH** ile uzaktan yönetim imkanı sağlamak
- Metin düzenlemek için bir **editör (nano)** sunmak

.. raw:: pdf

   PageBreak
   
**Kurulum Dizini: Dağıtımın Oluşacağı Yer**
-------------------------------------------

Dağıtım sürecinde tüm çalışma dosyalarımızı saklayacağımız bir hedef dizin belirlemeliyiz.

Bu doküman boyunca varsayılan çalışma dizini olarak şunu kullanacağız:

``$HOME/distro/rootfs``

Burada **$HOME** ne demek?  
Bu, Linux ortamında aktif olan kullanıcının ev dizinini ifade eden standart bir değişkendir. Örneğin, sistemde giriş yapan kullanıcı adınız **uzman** ise; **$HOME = /home/uzman** konumunu belirtir.Bu sayede doküman boyunca paylaşılan tüm komutlarda **$HOME** ifadesi sizin kendi kullanıcı dizininize göre otomatik olarak uyarlanacak.

Artık ortam hazır!

Ortamın hazırlanmasından sonra bazı konuları bilmemiz gerekmektedir. Bunlar; 

1. Derleme(Dinamik/Static)
2. BusyBox 
3. chroot Kullanımı
4. Kernel/Modül Derleme
5. İso Oluşturma
6. Canlı Sistem Oluşturma Kullanma
7. qemu Kullanmı
8. cfdisk Kullanımı
9. Canlı Sistemden Kurulum Yapma


Burada liste halinde verilen konu başlıkları bu dokümanın **Yardımcı Konular** bölümünde anlatılmaktadır. 

Bundan sonraki adımlarda kendi dağıtımımızı şekillendirmeye başlayacağız!

.. raw:: pdf

   PageBreak


İşte Tüm Bu Yapı İçin İhtiyacımız Olan Paketler
-----------------------------------------------

.. list-table::
   :widths: 25 25 50

   * - 0- :ref:`base-file`
     - 25- :ref:`elfutils`
     - 50- :ref:`popt`
   * - 1- :ref:`glibc`
     - 26- :ref:`libselinux`
     - 51- :ref:`icu`
   * - 2- :ref:`readline`
     - 27- :ref:`tar`
     - 52- :ref:`iproute2`
   * - 3- :ref:`ncurses`
     - 28- :ref:`zlib`
     - 53- :ref:`net-tools`
   * - 4- :ref:`bash`
     - 29- :ref:`brotli`
     - 54- :ref:`dhcp`
   * - 5- :ref:`openssl`
     - 30- :ref:`curl`
     - 55- :ref:`openrc`
   * - 6- :ref:`acl`
     - 31- :ref:`shadow`
     - 56- :ref:`rsync`
   * - 7- :ref:`attr`
     - 32- :ref:`file`
     - 57- :ref:`kbd`
   * - 8- :ref:`libcap`
     - 33- :ref:`eudev`
     - 58- :ref:`kernel`
   * - 9-  :ref:`libpcre2`
     - 34- :ref:`cpio`
     - 59- :ref:`dialog`
   * - 10- :ref:`gmp`
     - 35- :ref:`libsepol`
     - 60- :ref:`live-boot`
   * - 11- :ref:`coreutils`
     - 36- :ref:`kmod`
     - 61- :ref:`live-config`
   * - 12- :ref:`util-linux`
     - 37- :ref:`audit`
     - 62- :ref:`parted`
   * - 13- :ref:`grep`
     - 38- :ref:`libxcrypt`
     - 63- :ref:`busybox`
   * - 14- :ref:`sed`
     - 39- :ref:`libnsl`
     - 64- :ref:`nano`
   * - 15- :ref:`mpfr`
     - 40- :ref:`libbsd`
     - 65- :ref:`grub`
   * - 16- :ref:`gawk`
     - 41- :ref:`libtirpc`
     - 66- :ref:`efibootmgr`
   * - 17- :ref:`findutils`
     - 42- :ref:`e2fsprogs`
     - 67- :ref:`efivar`
   * - 18- :ref:`gcc`
     - 43- :ref:`dosfstools`
     - 68- :ref:`libssh`
   * - 19- :ref:`libcap-ng`
     - 44- :ref:`initramfs-tools`
     - 69- :ref:`openssh`
   * - 20- :ref:`sqlite`
     - 45- :ref:`libxml2`
     - 70- :ref:`pam`
   * - 21- :ref:`gzip`
     - 46- :ref:`expat`
     - 71- 
   * - 22- :ref:`xz-utils`
     - 47- :ref:`libmd`
     - 72- 
   * - 23- :ref:`zstd`
     - 48- :ref:`libaio`
     - 73-    
   * - 24- :ref:`bzip2`
     - 49- :ref:`lvm2`
     - 74-


Bağımlılıklar Zinciri: Doğru Sıralama Şart!
-------------------------------------------

Linux paketinin sorunsuz çalışabilmesi için **bağımlı olduğu tüm paketlerin önceden derlenmiş olması gerekir**. Örneğin; **bash** paketini çalıştırmak için: **readline** ve **ncurses** paketleri gereklidir. **readline** ve **ncurses** için ise **glibc** paketi gereklidir. Bu sayfadaki liste bağımlılıklarına göre sıralandı. Liste sırasına göre ilerlemek oldukça önemlidir. Her paketin derleme aşaması, ayrı başlıklar altında detaylı bir şekilde anlatılacaktır.

Hazırlık: Gerekli Derleme Araçlarını Kurun!
-------------------------------------------

Paket derleme işlemine başlamadan önce, aşağıdaki temel araçları sisteminize kurmalısınız.

.. code-block:: bash

	sudo apt update
	sudo apt-get install debootstrap xorriso mtools make squashfs-tools gcc wget unzip xz-utils tar zstd fakeroot \ 
	autoconf automake autotools-dev make meson cmake ninja-build pkgconf patch libtool grub-pc grub-pc-bin 
	
.. raw:: pdf

   PageBreak


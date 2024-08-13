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

.. list-table:: Lise
   :widths: 25 25 50

   * - 1- base-file
     - 26- 
     - 51- 
   * - 2- glibc
     - 27-
     - 52- 
   * - 3- readline
     - 28- 
     - 53- 
   * - 4- ncurses
     - 29- 
     - 54- 
   * - 5- bash
     - 30- 
     - 55- 
   * - 6- kmod
     - 31- 
     - 56- 
   * - 7- acl
     - 32- 
     - 57- 
   * - 8- attr
     - 33- 
     - 58- 
   * - 9- eudev
     - 34- 
     - 59- 
   * - 10- util-linux
     - 35- 
     - 60- 
   * - 11- core-utils
     - 36- 
     - 61- 
   * - 12- brotli
     - 37- 
     - 62- 
   * - 13- dosfstools
     - 38- 
     - 63- 
   * - 14- e2fsprogs
     - 39- 
     - 64- 
   * - 15- efibootmgr
     - 40- 
     - 65- 
   * - 16- expat
     - 41- 
     - 66- 
   * - 17- file
     - 42- 
     - 67- 
   * - 18- findutils
     - 43- 
     - 68- 
   * - 19- gawk
     - 44- 
     - 69- 
   * - 20- grep
     - 45- 
     - 70- 
   * - 21- grub
     - 46- 
     - 71- 
   * - 22- gmp
     - 47- 
     - 72- 
   * - 23- gzip
     - 48- 
     - 73- 
   * - 24- 
     - 49- 
     - 74-    
   * - 25- 
     - 50- 
     - 75-   
     
- glibc
- readline
- ncurses
- bash
- kmod
- busybox
- acl
- attr
- eudev
- coreutils
- util-linux
- audit
- base-file
- brotli
- dosfstools
- e2fsprogs
- efibootmgr
- efivar
- expat
- file
- findutils
- gawk
- gmp
- grep
- grub
- gzip
- initramfs-tools
- libc6-dev
- libcap
- libmd
- libpcre2
- libstdc++-dev
- libxml2
- linux-headers
- linux-image
- linux-libc-dev
- live-boot
- live-config
- openrc
- openssl
- p7zip
- pam
- parted
- sed
- xz-utils-debian
- zlib
- zstd


Listede **bash** uygulamasının çalışabilmesi için **readline** ve **ncurses** kütüphaneleri gerekli. **readline** ve **ncurses** kütüphanelerinin çalışabilmesi içinde **glibc** kütüphanesi gerekli. Listede bulunan tüm paketlerin bağımlılıkları eksiksizdir.
Listede bulunan paketler sırasıyla nasıl derleneceği ayrı başlıklar altında anlatılacaktır.

.. raw:: pdf

   PageBreak


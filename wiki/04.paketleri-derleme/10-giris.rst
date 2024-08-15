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

   * - 0- base-file
     - 25- libsepol
     - 50- iproute2
   * - 1- glibc
     - 26- tar
     - 51- net-tools
   * - 2- readline
     - 27- zlib
     - 52- dhcp
   * - 3- ncurses
     - 28- brotli
     - 53- shadow
   * - 4- bash
     - 29- curl
     - 54- openrc
   * - 5- openssl
     - 30- libxml2
     - 55- rsync
   * - 6- acl
     - 31- eudev
     - 56- kbd
   * - 7- attr
     - 32- libnsl
     - 57- busybox
   * - 8- libcap
     - 33- pam
     - 58- kernel
   * - 9- libcap-ng
     - 34- expat
     - 59- kernel-headers
   * - 10- gmp
     - 35- libmd
     - 60- live-boot
   * - 11- grep
     - 36- audit
     - 61- live-config
   * - 12- sed
     - 37- libgcc
     - 62- parted
   * - 13- mpfr
     - 38- libxcrypt
     - 63- kmod
   * - 14- gawk
     - 39- sqlite
     - 64- nano
   * - 15- findutils
     - 40- libtirpc
     - 65- grub
   * - 16- libpcre2
     - 41- file
     - 66- efibootmgr
   * - 17- coreutils
     - 42- e2fsprogs
     - 67- efivar
   * - 18- util-linux
     - 43- dostools
     - 68- dialog
   * - 19- gzip
     - 44- initramfs-tools
     - 69- libssh
   * - 20- xz-utils
     - 45- cpio
     - 70- openssh
   * - 21- zstd
     - 46- libio
     - 71- 
   * - 22- bzip2
     - 47- lvm2
     - 72- 
   * - 23- elfutils
     - 48- popt
     - 73-    
   * - 24- libselinux
     - 49- icu
     - 74-   


Listede bulunan  **bash** paketinin sorunsuz çalışabilmesi için **readline** ve **ncurses** kütüphaneleri gerekli. **readline** ve **ncurses** kütüphanelerinin çalışabilmesi içinde **glibc** kütüphanesi gerekli. Listede bulunan tüm paketlerin bağımlılıkları eksiksizdir.
Listede bulunan paketler sırasıyla nasıl derleneceği ayrı başlıklar altında anlatılacaktır.

.. raw:: pdf

   PageBreak


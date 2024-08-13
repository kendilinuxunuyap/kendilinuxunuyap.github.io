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

Bu yapıda bir dağıtım için aşağıdaki paketlere ihtiyacımız olacak. Bunlar;

.. list-table:: Paket Listesi
   :widths: 25 25 50
   :header-rows: 1

   * - 1- glibc
     - 2- readline
     - 3- ncurses
     - 4- bash
     - 5- kmod
     - 6- busybox
     - 7- acl
     8. attr
     9. eudev
     10. coreutils
     11. util-linux
     12. audit
     13. base-file
     14. brotli
     15 dosfstools
     16. e2fsprogs
     17. efibootmgr
     18. efivar
     19. expat
     20. file
     21. findutils
     22. gawk
     23. gmp
     24. grep
     25. grub
     
   * - 26- gzip
     - 27- initramfs-tools
     - 28- libc6-dev
     - 29- libcap
     - 30- libmd
     - 31- libpcre2
     - 32- libstdc++-dev
     33- libxml2
     34. linux-headers
     35. linux-image
     36. linux-libc-dev
     37. live-boot
     38. live-config
     39. openrc
     40. openssl
     41. p7zip
     43. pam
     44. parted
     45. sed
     46. xz-utils-debian
     47. zlib
     48. zstd
   * - 51- libssh
     - 48- openssh
     
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


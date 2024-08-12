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
- İnternete bağlanılabilecek
- ssh bağlantısı ile uzaktan yönetilebilecek

Bu yapıda bir dağıtım için aşağıdaki paketlere ihtiyacımız olacak. Bunlar;

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


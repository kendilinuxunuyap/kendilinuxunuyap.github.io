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

   * - 0- `base-file <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 25- `libsepol <https://kendilinuxunuyap.github.io/25-libsepol.html>`_
     - 50- `iproute2 <https://kendilinuxunuyap.github.io/50-iproute2.html>`_
   * - 1- `glibc <https://kendilinuxunuyap.github.io/01-glibc.html>`_
     - 26- `tar <https://kendilinuxunuyap.github.io/26-tar.html>`_
     - 51- `net-tools <https://kendilinuxunuyap.github.io/51-net-tools.html>`_
   * - 2- `readline <https://kendilinuxunuyap.github.io/02-readline.html>`_
     - 27- `zlib <https://kendilinuxunuyap.github.io/27-zlib.html>`_
     - 52- `dhcp <https://kendilinuxunuyap.github.io/52-dhcp.html>`_
   * - 3- `ncurses <https://kendilinuxunuyap.github.io/03-ncurses.html>`_
     - 28- `brotli <https://kendilinuxunuyap.github.io/28-brotli.html>`_
     - 53- `shadow <https://kendilinuxunuyap.github.io/53-shadow.html>`_
   * - 4- `bash <https://kendilinuxunuyap.github.io/04-bash.html>`_
     - 29- `curl <https://kendilinuxunuyap.github.io/29-curl.html>`_
     - 54- `openrc <https://kendilinuxunuyap.github.io/54-openrc.html>`_
   * - 5- `openssl <https://kendilinuxunuyap.github.io/05-openssl.html>`_
     - 30- `libxml2 <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 55- `rsync <https://kendilinuxunuyap.github.io/00-base-file.html>`_
   * - 6- `acl <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 31- `eudev <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 56- `kbd <https://kendilinuxunuyap.github.io/00-base-file.html>`_
   * - 7- `attr <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 32- `libnsl <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 57- `busybox <https://kendilinuxunuyap.github.io/00-base-file.html>`_
   * - 8- `libcap <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 33- `pam <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 58- `kernel <https://kendilinuxunuyap.github.io/00-base-file.html>`_
   * - 9- `libcap-ng <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 34- `expat <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 59- `kernel-headers <https://kendilinuxunuyap.github.io/00-base-file.html>`_
   * - 10- `gmp <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 35- `libmd <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 60- `live-boot <https://kendilinuxunuyap.github.io/00-base-file.html>`_
   * - 11- `grep <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 36- `audit <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 61- `live-config <https://kendilinuxunuyap.github.io/00-base-file.html>`_
   * - 12- `sed <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 37- `libgcc <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 62- `parted <https://kendilinuxunuyap.github.io/00-base-file.html>`_
   * - 13- `mpfr <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 38- `libxcrypt <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 63- `kmod <https://kendilinuxunuyap.github.io/00-base-file.html>`_
   * - 14- `gawk <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 39- `sqlite <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 64- `nano <https://kendilinuxunuyap.github.io/00-base-file.html>`_
   * - 15- `findutils <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 40- `libtirpc <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 65- `grub <https://kendilinuxunuyap.github.io/00-base-file.html>`_
   * - 16- `libpcre2 <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 41- `file <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 66- `efibootmgr <https://kendilinuxunuyap.github.io/00-base-file.html>`_
   * - 17- `coreutils <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 42- `e2fsprogs <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 67- `efivar <https://kendilinuxunuyap.github.io/00-base-file.html>`_
   * - 18- `util-linux <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 43- `dostools <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 68- `dialog <https://kendilinuxunuyap.github.io/00-base-file.html>`_
   * - 19- `gzip <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 44- `initramfs-tools <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 69- `libssh <https://kendilinuxunuyap.github.io/00-base-file.html>`_
   * - 20- `xz-utils <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 45- `cpio <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 70- `openssh <https://kendilinuxunuyap.github.io/00-base-file.html>`_
   * - 21- `zstd <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 46- `libio <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 71- 
   * - 22- `bzip2 <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 47- `lvm2 <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 72- 
   * - 23- `elfutils <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 48- `popt <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 73-    
   * - 24- `libselinux <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 49- `icu <https://kendilinuxunuyap.github.io/00-base-file.html>`_
     - 74-   


Listede bulunan  **bash** paketinin sorunsuz çalışabilmesi için **readline** ve **ncurses** kütüphaneleri gerekli. **readline** ve **ncurses** kütüphanelerinin çalışabilmesi içinde **glibc** kütüphanesi gerekli. Listede bulunan tüm paketlerin bağımlılıkları eksiksizdir.
Listede bulunan paketler sırasıyla nasıl derleneceği ayrı başlıklar altında anlatılacaktır.

.. raw:: pdf

   PageBreak


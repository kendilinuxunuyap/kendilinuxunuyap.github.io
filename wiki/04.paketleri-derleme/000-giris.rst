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

   * - 0- `base-file <https://kendilinuxunuyap.github.io/04.paketleri-derleme/00-base-file.html>`_
     - 25- `libsepol <https://kendilinuxunuyap.github.io/04.paketleri-derleme/25-libsepol.html>`_
     - 50- `iproute2 <https://kendilinuxunuyap.github.io/04.paketleri-derleme/50-iproute2.html>`_
   * - 1- `glibc <./01-glibc.html>`_
     - 26- `tar <https://kendilinuxunuyap.github.io/04.paketleri-derleme/26-tar.html>`_
     - 51- `net-tools <https://kendilinuxunuyap.github.io/04.paketleri-derleme/51-net-tools.html>`_
   * - 2- `readline <https://kendilinuxunuyap.github.io/04.paketleri-derleme/02-readline.html>`_
     - 27- `zlib <https://kendilinuxunuyap.github.io/04.paketleri-derleme/27-zlib.html>`_
     - 52- `dhcp <https://kendilinuxunuyap.github.io/04.paketleri-derleme/52-dhcp.html>`_
   * - 3- `ncurses <https://kendilinuxunuyap.github.io/04.paketleri-derleme/03-ncurses.html>`_
     - 28- `brotli <https://kendilinuxunuyap.github.io/04.paketleri-derleme/28-brotli.html>`_
     - 53- `shadow <https://kendilinuxunuyap.github.io/04.paketleri-derleme/53-shadow.html>`_
   * - 4- `bash <https://kendilinuxunuyap.github.io/04.paketleri-derleme/04-bash.html>`_
     - 29- `curl <https://kendilinuxunuyap.github.io/04.paketleri-derleme/29-curl.html>`_
     - 54- `openrc <https://kendilinuxunuyap.github.io/04.paketleri-derleme/54-openrc.html>`_
   * - 5- `openssl <https://kendilinuxunuyap.github.io/04.paketleri-derleme/05-openssl.html>`_
     - 30- `libxml2 <https://kendilinuxunuyap.github.io/04.paketleri-derleme/30-libxml2.html>`_
     - 55- `rsync <https://kendilinuxunuyap.github.io/04.paketleri-derleme/55-rsync.html>`_
   * - 6- `acl <https://kendilinuxunuyap.github.io/04.paketleri-derleme/06-acl.html>`_
     - 31- `eudev <https://kendilinuxunuyap.github.io/04.paketleri-derleme/31-eudev.html>`_
     - 56- `kbd <https://kendilinuxunuyap.github.io/04.paketleri-derleme/56-kbd.html>`_
   * - 7- `attr <https://kendilinuxunuyap.github.io/04.paketleri-derleme/07-attr.html>`_
     - 32- `libnsl <https://kendilinuxunuyap.github.io/04.paketleri-derleme/32-libnsl.html>`_
     - 57- `busybox <https://kendilinuxunuyap.github.io/04.paketleri-derleme/57-busybox.html>`_
   * - 8- `libcap <https://kendilinuxunuyap.github.io/04.paketleri-derleme/08-libcap.html>`_
     - 33- `pam <https://kendilinuxunuyap.github.io/04.paketleri-derleme/33-pam.html>`_
     - 58- `kernel <https://kendilinuxunuyap.github.io/04.paketleri-derleme/58-kernel.html>`_
   * - 9- `libcap-ng <https://kendilinuxunuyap.github.io/04.paketleri-derleme/09-libcap-ng.html>`_
     - 34- `expat <https://kendilinuxunuyap.github.io/04.paketleri-derleme34-expat.html>`_
     - 59- `kernel-headers <https://kendilinuxunuyap.github.io/04.paketleri-derleme/59-kernel-headers.html>`_
   * - 10- `gmp <https://kendilinuxunuyap.github.io/04.paketleri-derleme/10-gmp.html>`_
     - 35- `libmd <https://kendilinuxunuyap.github.io/04.paketleri-derleme/35-libmd.html>`_
     - 60- `live-boot <https://kendilinuxunuyap.github.io/04.paketleri-derleme/60-live-boot.html>`_
   * - 11- `grep <https://kendilinuxunuyap.github.io/04.paketleri-derleme/11-grep.html>`_
     - 36- `audit <https://kendilinuxunuyap.github.io/04.paketleri-derleme/36-audit.html>`_
     - 61- `live-config <https://kendilinuxunuyap.github.io/04.paketleri-derleme/61-live-config.html>`_
   * - 12- `sed <https://kendilinuxunuyap.github.io/04.paketleri-derleme/12-sed.html>`_
     - 37- `libgcc <https://kendilinuxunuyap.github.io/04.paketleri-derleme/37-libgcc.html>`_
     - 62- `parted <https://kendilinuxunuyap.github.io/04.paketleri-derleme/62-parted.html>`_
   * - 13- `mpfr <https://kendilinuxunuyap.github.io/04.paketleri-derleme/13-mpfr.html>`_
     - 38- `libxcrypt <https://kendilinuxunuyap.github.io/04.paketleri-derleme/libxcrypt.html>`_
     - 63- `kmod <https://kendilinuxunuyap.github.io/04.paketleri-derleme/63-kmod.html>`_
   * - 14- `gawk <https://kendilinuxunuyap.github.io/04.paketleri-derleme/14-gawk.html>`_
     - 39- `sqlite <https://kendilinuxunuyap.github.io/04.paketleri-derleme/39-sqlite.html>`_
     - 64- `nano <https://kendilinuxunuyap.github.io/04.paketleri-derleme/64-nano.html>`_
   * - 15- `findutils <https://kendilinuxunuyap.github.io/04.paketleri-derleme/15-findutils.html>`_
     - 40- `libtirpc <https://kendilinuxunuyap.github.io/04.paketleri-derleme/40-libtirpc.html>`_
     - 65- `grub <https://kendilinuxunuyap.github.io/04.paketleri-derleme/65-grub.html>`_
   * - 16- `libpcre2 <https://kendilinuxunuyap.github.io/04.paketleri-derleme/16-libpcre2.html>`_
     - 41- `file <https://kendilinuxunuyap.github.io/04.paketleri-derleme/41-file.html>`_
     - 66- `efibootmgr <https://kendilinuxunuyap.github.io/04.paketleri-derleme/66-efibootmgr.html>`_
   * - 17- `coreutils <https://kendilinuxunuyap.github.io/04.paketleri-derleme/17-coreutils.html>`_
     - 42- `e2fsprogs <https://kendilinuxunuyap.github.io/04.paketleri-derleme/42-e2fsprogs.html>`_
     - 67- `efivar <https://kendilinuxunuyap.github.io/04.paketleri-derleme/67-efivar.html>`_
   * - 18- `util-linux <https://kendilinuxunuyap.github.io/04.paketleri-derleme/18-util-linux.html>`_
     - 43- `dostools <https://kendilinuxunuyap.github.io/04.paketleri-derleme/43-dostools.html>`_
     - 68- `dialog <https://kendilinuxunuyap.github.io/04.paketleri-derleme/68-dialog.html>`_
   * - 19- `gzip <https://kendilinuxunuyap.github.io/04.paketleri-derleme/19-gzip.html>`_
     - 44- `initramfs-tools <https://kendilinuxunuyap.github.io/04.paketleri-derleme/44-initramfs.html>`_
     - 69- `libssh <https://kendilinuxunuyap.github.io/04.paketleri-derleme/69-libssh.html>`_
   * - 20- `xz-utils <https://kendilinuxunuyap.github.io/04.paketleri-derleme/20-xz-utils.html>`_
     - 45- `cpio <https://kendilinuxunuyap.github.io//04.paketleri-derleme/45-cpio.html>`_
     - 70- `openssh <https://kendilinuxunuyap.github.io/04.paketleri-derleme/70-openssh.html>`_
   * - 21- `zstd <https://kendilinuxunuyap.github.io/04.paketleri-derleme/21-zstd.html>`_
     - 46- `libio <https://kendilinuxunuyap.github.io/04.paketleri-derleme/46-libio.html>`_
     - 71- 
   * - 22- `bzip2 <https://kendilinuxunuyap.github.io/04.paketleri-derleme/22-bzip2.html>`_
     - 47- `lvm2 <https://kendilinuxunuyap.github.io/04.paketleri-derleme/47-lvm2.html>`_
     - 72- 
   * - 23- `elfutils <https://kendilinuxunuyap.github.io/04.paketleri-derleme/23-elfutils.html>`_
     - 48- `popt <https://kendilinuxunuyap.github.io/04.paketleri-derleme/48-popt.html>`_
     - 73-    
   * - 24- `libselinux <https://kendilinuxunuyap.github.io/04.paketleri-derleme/24-libselinux.html>`_
     - 49- `icu <https://kendilinuxunuyap.github.io/04.paketleri-derleme/49-icu.html>`_
     - 74-   


Listede bulunan  **bash** paketinin sorunsuz çalışabilmesi için **readline** ve **ncurses** kütüphaneleri gerekli. **readline** ve **ncurses** kütüphanelerinin çalışabilmesi içinde **glibc** kütüphanesi gerekli. Listede bulunan tüm paketlerin bağımlılıkları eksiksizdir.
Listede bulunan paketler sırasıyla nasıl derleneceği ayrı başlıklar altında anlatılacaktır.

.. raw:: pdf

   PageBreak


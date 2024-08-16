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

   * - 0- `base-file <./001-base-file.html>`_
     - 25- `libsepol <./25-libsepol.html>`_
     - 50- `iproute2 <./50-iproute2.html>`_
   * - 1- `glibc <./01-glibc.html>`_
     - 26- `tar <./26-tar.html>`_
     - 51- `net-tools <./51-net-tools.html>`_
   * - 2- `readline <./02-readline.html>`_
     - 27- `zlib <./27-zlib.html>`_
     - 52- `dhcp <./52-dhcp.html>`_
   * - 3- `ncurses <./03-ncurses.html>`_
     - 28- `brotli <./28-brotli.html>`_
     - 53- `shadow <./53-shadow.html>`_
   * - 4- `bash <./04-bash.html>`_
     - 29- `curl <./29-curl.html>`_
     - 54- `openrc <./54-openrc.html>`_
   * - 5- `openssl <./05-openssl.html>`_
     - 30- `libxml2 <./30-libxml2.html>`_
     - 55- `rsync <./55-rsync.html>`_
   * - 6- `acl <./06-acl.html>`_
     - 31- `eudev <./31-eudev.html>`_
     - 56- `kbd <./56-kbd.html>`_
   * - 7- `attr <./07-attr.html>`_
     - 32- `libnsl <./32-libnsl.html>`_
     - 57- `busybox <./57-busybox.html>`_
   * - 8- `libcap <./08-libcap.html>`_
     - 33- `pam <./33-pam.html>`_
     - 58- `kernel <./58-kernel.html>`_
   * - 9- `libcap-ng <./09-libcap-ng.html>`_
     - 34- `expat <./34-expat.html>`_
     - 59- `kernel-headers <./59-kernel-headers.html>`_
   * - 10- `gmp <./10-gmp.html>`_
     - 35- `libmd <./35-libmd.html>`_
     - 60- `live-boot <./60-live-boot.html>`_
   * - 11- `grep <./11-grep.html>`_
     - 36- `audit <./36-audit.html>`_
     - 61- `live-config <./61-live-config.html>`_
   * - 12- `sed <./12-sed.html>`_
     - 37- `libgcc <./37-libgcc.html>`_
     - 62- `parted <./62-parted.html>`_
   * - 13- `mpfr <./13-mpfr.html>`_
     - 38- `libxcrypt <./libxcrypt.html>`_
     - 63- `kmod <./63-kmod.html>`_
   * - 14- `gawk <./14-gawk.html>`_
     - 39- `sqlite <./39-sqlite.html>`_
     - 64- `nano <./64-nano.html>`_
   * - 15- `findutils <./15-findutils.html>`_
     - 40- `libtirpc <./40-libtirpc.html>`_
     - 65- `grub <./65-grub.html>`_
   * - 16- `libpcre2 <./16-libpcre2.html>`_
     - 41- `file <./41-file.html>`_
     - 66- `efibootmgr <./66-efibootmgr.html>`_
   * - 17- `coreutils <./17-coreutils.html>`_
     - 42- `e2fsprogs <./42-e2fsprogs.html>`_
     - 67- `efivar <./67-efivar.html>`_
   * - 18- `util-linux <./18-util-linux.html>`_
     - 43- `dostools <./43-dostools.html>`_
     - 68- `dialog <./68-dialog.html>`_
   * - 19- `gzip <./19-gzip.html>`_
     - 44- `initramfs-tools <./44-initramfs.html>`_
     - 69- `libssh <./69-libssh.html>`_
   * - 20- `xz-utils <./20-xz-utils.html>`_
     - 45- `cpio <./45-cpio.html>`_
     - 70- `openssh <./70-openssh.html>`_
   * - 21- `zstd <./21-zstd.html>`_
     - 46- `libio <./46-libio.html>`_
     - 71- 
   * - 22- `bzip2 <./22-bzip2.html>`_
     - 47- `lvm2 <./47-lvm2.html>`_
     - 72- 
   * - 23- `elfutils <./23-elfutils.html>`_
     - 48- `popt <./48-popt.html>`_
     - 73-    
   * - 24- `libselinux <./24-libselinux.html>`_
     - 49- `icu <./49-icu.html>`_
     - 74-   


Listede bulunan  **bash** paketinin sorunsuz çalışabilmesi için **readline** ve **ncurses** kütüphaneleri gerekli. **readline** ve **ncurses** kütüphanelerinin çalışabilmesi içinde **glibc** kütüphanesi gerekli. Listede bulunan tüm paketlerin bağımlılıkları eksiksizdir.
Listede bulunan paketler sırasıyla nasıl derleneceği ayrı başlıklar altında anlatılacaktır.

.. raw:: pdf

   PageBreak


.. _temelpakaetler:

Temel Paketler
++++++++++++++

Dağıtım temel seviyede kullanıcıya tyy ortamı sunan bir yapıdan oluşacak. Ayrıca kendini kurup initrd.img oluşturabilen ve grubu yükleyecek bir yapıda olmasını planlamaktayız. Bu yapıda bir dağıtım için aşağıdaki paketlere ihtiyacımız olacak. Bunlar;

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


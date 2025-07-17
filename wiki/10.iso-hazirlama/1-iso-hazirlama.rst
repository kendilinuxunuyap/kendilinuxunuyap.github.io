Önceki bölümlerde, gerekli paketlerin derlenmesi tamamlandı. Bu paketler, oturum açtığınız kullanıcının ev dizininde **$HOME/distro/rootfs** konumunda yer alacaktır. Burada **$HOME**, o anki kullanıcıya göre değişiklik gösterecektir. Örneğin, kullanıcı adımız **bd** ise, **$HOME** dizini **/home/bd/** olacaktır. Bu durumda, **$HOME/distro/rootfs** aslında **/home/bd/distro/rootfs** dizinini temsil eder.

ISO hazırlama süreci, yazının başında anlattığımız **Temel Linux Sistemi Oluşturma** ISO yapımına benzer bir şekilde ilerleyecektir. Oluşturulacak **iso** dosyasının temel yapısı aşağıdaki gibi olacaktır. Bu yapıyı oluşturan dört temel dosyanın her biri için hazırlık adımları tek tek açıklanacak ve en sonunda hepsini bir araya getiren bir ISO oluşturma scripti verilecektir.

.. code-block:: shell

   $HOME/distro/iso/boot/grub/grub.cfg
   $HOME/distro/iso/boot/initrd.img
   $HOME/distro/iso/boot/vmlinuz
   $HOME/distro/iso/live/filesystem.squashfs

**1-grub.cfg Hazırlama**
------------------------

Sistemin açılmasını sağlayan temel dosyalardan biri **grub.cfg** dosyasıdır. Genel olarak basit bir **grub.cfg** şu şekildedir:

.. code-block:: shell

   linux /boot/vmlinuz
   initrd /boot/initrd.img
   boot

Bu örnekteki sistem için **grub.cfg** dosyası aşağıdaki gibi düzenlenmiştir. Burada dikkat edilmesi gereken noktalar:

- Menü seçeneklerinde **live** ifadesinin kullanılması.
- Sistemin **openrc** ile başlatılmasını sağlamak için gerekli kernel parametrelerinin eklenmesi.
- Kurulum için özel bir **init=/bin/kur** satırı kullanılması.

İşte örnek **grub.cfg** oluşturma komutları:

.. code-block:: shell

   cat << EOF > "$HOME/distro/iso/boot/grub/grub.cfg"
   set timeout=3	# Timeout for menu
   set default=1	# Default boot entry
   set menu_color_normal=white/black	# Menu Colours
   set menu_color_highlight=white/blue	# Menu Colours
   insmod all_video; terminal_output console; terminal_input console
   
   menuentry "Canli(live) GNU/Linux(kly)" --class liveiso {
    linux /boot/vmlinuz boot=live init=/sbin/openrc-init net.ifnames=0 \
        biosdevname=0
    initrd /boot/initrd.img
   }
   menuentry "Kur GNU/Linux(kly)" --class liveiso {
      linux /boot/vmlinuz boot=live init=/bin/kur quiet
      initrd /boot/initrd.img 
      }
   EOF


.. raw:: pdf

   PageBreak
   
**2-initrd.img Oluşturma/Güncelleme**
-------------------------------------

**initrd.img** dosyasının güncellenmesi veya oluşturulması için aşağıdaki adımlar izlenebilir.

Varsayılan sistemde çalışıyorsanız doğrudan aşağıdaki komut yeterlidir:

.. code-block:: shell

   # initrd günceller
   /usr/sbin/update-initramfs -u -k $(uname -r)

Ancak bir **chroot** ortamında çalışıyorsanız (yani rootfs içine girip işlem yapacaksanız), önce **dev**, **sys**, **proc**, **run**, **tmp** dizinlerinin bağlanması gerekir. Bu işlemler root yetkisi ile yapılmalıdır.

Aşağıda örnek bir **initrd.img oluşturma scripti** yer almaktadır:

.. code-block:: shell

   #--------------------------------------------------------------------------
   rootfs="$HOME/distro/rootfs"
   distro="$HOME/distro"

   ## Gerekli dizinler oluşturuluyor bağlanıyor
   for dir in dev sys proc run tmp; do
    mkdir -p "$rootfs/$dir"
    mount --bind /$dir $rootfs/$dir
   done
    
   ## Kernel versiyonu tespiti
   fname=$(basename $rootfs/boot/config*)
   kversion=${fname:7}
   mv $rootfs/boot/config* $rootfs/boot/config-$kversion
   cp $rootfs/boot/config-$kversion $rootfs/etc/kernel-config

   ## initramfs oluşturuluyor
   chroot $rootfs update-initramfs -u -k $kversion

   ## Dizin bağlantıları kaldırılıyor
   for dir in dev sys proc run tmp; do
   	umount -lf -R $rootfs/$dir 2>/dev/null
   done
   
   ## initrd.img dosyası kopyalanıyor
   cp -pf $rootfs/boot/initrd.img-* $distro/iso/boot/initrd.img


.. raw:: pdf

   PageBreak
   
**3-vmlinuz Hazırlama**
-----------------------

Kernel dosyamız olan **vmlinuz**, ISO dizinine aşağıdaki komutla kopyalanır:

.. code-block:: shell

   #--------------------------------------------------------------------------
   rootfs="$HOME/distro/rootfs"
   distro="$HOME/distro"

   # Kernel dosyasını kopyala
   cp -pf $rootfs/boot/vmlinuz-* $distro/iso/boot/vmlinuz

   # Sistemde rootfs dışında boot bölümü olduğu için boot dizini silinebilir
   #rm -rf $rootfs/boot

**4-filesystem.squashfs Hazırlama**
-----------------------------------

Sistemin **live** olarak çalıştırılabilmesi ve kurulum için kaynak oluşturacak **filesystem.squashfs** dosyası oluşturulur:

.. code-block:: shell

   #--------------------------------------------------------------------------
   cd $HOME/distro/
   mksquashfs $HOME/distro/rootfs $HOME/distro/filesystem.squashfs -comp xz -wildcards
   mv $HOME/distro/filesystem.squashfs $HOME/distro/iso/live/filesystem.squashfs

**5-ISO Dosyasının Oluşturulması**
----------------------------------

Tüm dosyalar konumlarına uygun hazırlandıktan sonra, **grub-mkrescue** aracı ile ISO dosyamızı oluşturabiliriz:

.. code-block:: shell

   #--------------------------------------------------------------------------
   cd $HOME/distro
   grub-mkrescue iso/ -o kly.iso

**6-ISO'nun Test Edilmesi**
---------------------------

Oluşturduğumuz ISO dosyasını **qemu** veya **VirtualBox** ile test edebiliriz. Linux üzerinde terminalden **qemu** kullanarak aşağıdaki şekilde test gerçekleştirebilirsiniz.

.. code-block:: shell

   # qemu ile ISO'nun test edilmesi
   qemu-system-x86_64 -cdrom $HOME/distro/kly.iso -m 1G

.. raw:: pdf

   PageBreak

**ISO Oluşturma Scripti**
-------------------------

Bu dokümanda anlatılan paketleri kurulduğu **/home/$user/distro/rootfs** dizini kullanarak, **/home/$user/distro/iso/** konumuna **kly.iso** dosyasını üretir. Bu bölümde anlatılan tüm aşamalar tek script halinde aşağıda verilmiştir. Bu scripti **sudo** yetkisiyle çalıştırınız.

.. code-block:: shell

	#!/bin/bash
	tepmPath="${PATH}"
	export PATH=$PATH:/sbin/
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"
	user=$(who | grep '('$display')' | awk '{print $1}') # Kullanıcı&ekran bul
	distro="/home/$user/distro"; rootfs="$distro/rootfs"; rm -rf "$distro/iso"

	echo "[+] $rootfs dizininin izinleri düzenleniyor..."
	chown -R root:root ${rootfs}/bin ${rootfs}/sbin ${rootfs}/usr/bin ${rootfs}/usr/sbin 	#sahibi root:root olsun
	chown -R root:root ${rootfs}/var ${rootfs}/run ${rootfs}/root 	#sahibi root:root olsun
	find ${rootfs} -type d -exec chmod 755 {} \;	# Tüm dizinlere 755 ver
	chmod 600 ${rootfs}/etc/shadow etc/gshadow 2>/dev/null # Hassas dosyaları ayarla
	chmod 1777 ${rootfs}/tmp # /tmp için sticky bit
	echo "[+] $rootfs dizininden iso oluşturuluyor..."


	# chroot ortamı için gerekli bind işlemleri
	for dir in dev dev/pts proc sys; do mount -o bind /$dir $rootfs/$dir; done
	# Root parolası ve live kullanıcı eklenmesi
	chroot $rootfs echo -e "1\n1\n"|chroot $rootfs passwd root
	chroot $rootfs userdel -r live
	chroot $rootfs useradd live -m -s /bin/sh -d /home/live
	chroot $rootfs echo -e "live\nlive\n"|chroot $rootfs passwd live
	# /root ve /home/live için sahiplik ve izinleri ayarlanıyor
	chown live:live ${rootfs}/home/live
	chmod 700 ${rootfs}/home/live
	chown root:root ${rootfs}/root
	chmod 700 ${rootfs}/root

	for grp in users tty wheel cdrom audio dip video plugdev netdev; do
	chroot $rootfs usermod -aG $grp live || true
	done

	# agetty ayarları
	sed -i "/agetty_options/d" $rootfs/etc/conf.d/agetty
	echo -e "\nagetty_options=\"-l /usr/bin/login\"" >> $rootfs/etc/conf.d/agetty
	# initrd güncellemesi
	fname=$(basename $rootfs/boot/config*)
	kversion=${fname:7}
	mv $rootfs/boot/config* $rootfs/boot/config-$kversion
	cp $rootfs/boot/config-$kversion $rootfs/etc/kernel-config
	chroot $rootfs update-initramfs -u -k $kversion

	# chroot bind dizinlerini ayır
	for dir in dev dev/pts proc sys ; do
	while umount -lf -R $rootfs/$dir 2>/dev/null ; do true; done
	done

	# ISO dizin yapısını oluştur
	mkdir -p "$distro/iso/boot/grub" "$distro/iso/live"
	cp -pf $rootfs/boot/initrd.img-* $distro/iso/boot/initrd.img # initrd.img
	cp -pf $rootfs/boot/vmlinuz-* $distro/iso/boot/vmlinuz # vmlinuz kopyala

	mksquashfs $rootfs $distro/filesystem.squashfs -comp xz -wildcards # squashfs
	mv $distro/filesystem.squashfs $distro/iso/live/filesystem.squashfs
	# grub.cfg dosyasını yaz
	cat << EOF > "$distro/iso/boot/grub/grub.cfg"
	set timeout=6; set default=1; terminal_input console;
	menuentry "Canli(live) GNU/Linux 64-bit" --class liveiso {
	linux /boot/vmlinuz boot=live init=/sbin/openrc-init net.ifnames=0 \
	biosdevname=0
	initrd /boot/initrd.img
	}
	menuentry "Kur GNU/Linux 64-bit" --class liveiso {
	linux /boot/vmlinuz boot=live init=/bin/kur quiet
	initrd /boot/initrd.img
	}
	EOF
	grub-mkrescue $distro/iso/ -o $distro/kly.iso
	#iso oluşturuluyor
	export PATH="${tempPath}"
	
Kaynaklar::

	- https://www.subrat.info/build-kernel-and-userspace/ - 08/07/2025
	- https://medium.com/@chienhaotan/compiling-and-running-a-minimal-kernel-with-busybox-bfc45a991017 - 08/07/2025
	- https://wiki.archlinux.org/title/GRUB_(T%C3%BCrk%C3%A7e)  - 08/07/2025
	- https://chatgpt.com/share/6875084c-6050-8012-9229-a37b47351aa2 - 14/07/2025

.. raw:: pdf

   PageBreak


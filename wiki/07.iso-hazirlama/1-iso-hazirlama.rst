İso Hazırlama
+++++++++++++


**initrd** hazırlama aşamaları **initrd** konu başlığında detaylıca anlatıldı.  Sistem hazırlanırken küçük farklılıklar olsada **initrd** hazırlamaya benzer aşamalar yapılacaktır. Sistemimin yani oluşacak **iso** dosyasının yapısı aşağıdaki gibi olacaktır. Aşağıda sadece **filesystem.squashfs** dosyasının hazırlanması kaldı.

.. code-block:: shell
	
	$HOME/distro/iso/boot/grub/grub.cfg
	$HOME/distro/iso/boot/initrd.img
	$HOME/distro/iso/boot/vmlinuz
	$HOME/distro/iso/live/filesystem.squashfs
	
**filesystem.squashfs Hazırlama**
---------------------------------

**filesystem.squashfs** dosyası **/initrd.img** dosyasına benzer yapıda hazırlanacak.
En büyük faklılık **init** çalışabilir dosya içeriğinde yapılmalı. Yapı **/initrd.img** dizin yapısı gibi hazırlandıktan sonra **filesystem.squashfs** oluşturulmalı ve **$HOME/distro/iso/live/filesystem.squashfs** konuma kopyalanmalıdır. Aşağıdaki komutlarla **filesystem.squashfs** hazırlanıyor ve  **$HOME/distro/iso/live/** konumuna taşınıyor.

.. code-block:: shell

	cd $HOME/distro/
	mksquashfs $HOME/distro/rootfs $HOME/distro/filesystem.squashfs -comp xz -wildcards
	mv $HOME/distro/filesystem.squashfs $HOME/distro/iso/live/filesystem.squashfs

İso Dosyasının Oluşturulması
----------------------------

.. code-block:: shell

	grub-mkrescue iso/ -o distro.iso #iso doyamız oluşturulur.

Artık sistemi açabilen ve tty açıp bize sunan bir yapı oluşturduk. Çalıştırmak için qemu kullanılabililir.


**qemu-system-x86_64 -cdrom distro.iso -m 1G** komutuyla çalıştırıp test edebiliriz. 

 Tamamını kapsayan scriptimiz aşağıdadır.

.. code-block:: shell
	
	#!/bin/bash

	#Detect the name of the display in use
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"

	#Detect the user using such display
	user=$(who | grep '('$display')' | awk '{print $1}')

	distro="/home/$user/distro"
	rootfs="/home/$user/distro/rootfs"
	rm -rf "$distro/iso"
	### system chroot  bind/mount
	for dir in dev dev/pts proc sys; do mount -o bind /$dir $rootfs/$dir; done
	
	chroot $rootfs useradd live -m -s /bin/sh  -d /home/live
	chroot $rootfs echo -e "live\nlive\n"|chroot $rootfs passwd live

	for grp in users tty wheel cdrom audio dip video plugdev netdev; do
		chroot $rootfs usermod -aG $grp live || true
	done

	sed -i "/agetty_options/d" $rootfs/etc/conf.d/agetty
	echo -e "\nagetty_options=\"-l /usr/bin/login\"" >> $rootfs/etc/conf.d/agetty


	### update-initrd
	fname=$(basename $rootfs/boot/config*)
	kversion=${fname:7}
	mv $rootfs/boot/config* $rootfs/boot/config-$kversion
	cp $rootfs/boot/config-$kversion $rootfs/etc/kernel-config

	chroot $rootfs update-initramfs -u -k $kversion

	#### system chroot umount
	for dir in dev dev/pts proc sys ; do    while umount -lf -R $rootfs/$dir 2>/dev/null ; do true; done done

	#************************iso *********************************
	mkdir -p $distro/iso
	mkdir -p $distro/iso/boot
	mkdir -p $distro/iso/boot/grub
	mkdir -p $distro/iso/live || true

	#### Copy kernel and initramfs
	cp -pf $rootfs/boot/initrd.img-* $distro/iso/boot/initrd.img
	cp -pf $rootfs/boot/vmlinuz-* $distro/iso/boot/vmlinuz
	#rm -rf $rootfs/boot

	#### Create squashfs
	mksquashfs $rootfs $distro/filesystem.squashfs -comp xz -wildcards
	mv $distro/filesystem.squashfs $distro/iso/live/filesystem.squashfs

	#### Write grub.cfg
	# Timeout for menu
	echo -e "set timeout=3\n"> $distro/iso/boot/grub/grub.cfg


	# Default boot entry
	echo -e "set default=1\n">> $distro/iso/boot/grub/grub.cfg

	# Menu Colours
	echo -e "set menu_color_normal=white/black\n">> $distro/iso/boot/grub/grub.cfg
	echo -e "set menu_color_highlight=white\/blue\n">> $distro/iso/boot/grub/grub.cfg
	echo -e "insmod all_video">> $distro/iso/boot/grub/grub.cfg
	echo -e "terminal_output console">> $distro/iso/boot/grub/grub.cfg
	echo -e "terminal_input console">> $distro/iso/boot/grub/grub.cfg

	echo 'menuentry "Canli(live) GNU/Linux 64-bit" --class liveiso  {' >> $distro/iso/boot/grub/grub.cfg
	echo '    linux /boot/vmlinuz boot=live init=/sbin/openrc-init net.ifnames=0 biosdevname=0' >> $distro/iso/boot/grub/grub.cfg
	echo '    initrd /boot/initrd.img' >> $distro/iso/boot/grub/grub.cfg
	echo '}' >> $distro/iso/boot/grub/grub.cfg

	echo 'menuentry "Kur GNU/Linux 64-bit" --class liveiso  {' >> $distro/iso/boot/grub/grub.cfg
	echo '    linux /boot/vmlinuz boot=live init=/bin/kur quiet' >> $distro/iso/boot/grub/grub.cfg
	echo '    initrd /boot/initrd.img' >> $distro/iso/boot/grub/grub.cfg
	echo '}' >> $distro/iso/boot/grub/grub.cfg

	grub-mkrescue $distro/iso/ -o $distro/distro.iso

.. raw:: pdf

   PageBreak


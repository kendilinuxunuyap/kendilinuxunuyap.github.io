base-file
+++++++++

Bir sistem tasarımı için temel ayarlamalar, dosya ve dizin yapıları olması gerekmektedir.
Bu yapılandırmalar yapıldıktan sonra sistemi bunun üzerine işlemlere devam edilmelidir. Bundan dolayı temel işlemlerin tanımlandığı bir dizi işleri kapsayacaktır.

Yapının Oluşturulması
---------------------


.. code-block:: shell
	
	version="0"
	name="base-files"
	mkdir -p $HOME/distro/build
	cd $HOME/distro
	#rm -rf ${name}-${version}

	mkdir -p ${name}-${version}

	cd ${name}-${version}

	mkdir -p run
	mkdir -p run/udev
	mkdir -p etc
	cp /etc/group ./etc/

	cat > ./etc/resolv.conf << EOF
	nameserver 8.8.8.8
	nameserver 8.8.4.4
	EOF
	cat > ./etc/ld.so.conf << EOF
	/usr/local/lib64
	/usr/local/lib
	include /etc/ld.so.conf.d/*.conf
	/usr/lib64
	/usr/lib
	/lib64
	/lib
	EOF

	#******************************ip alma*************************************
	cat > ./newipeth0 << EOF
	ip link set eth0 up
	udhcpc -i eth0 -s /usr/share/udhcpc/udhcpc.sh
	EOF
	chmod 755 ./newipeth0


	#******************************udhcpc.sh*************************************
	mkdir -p usr
	mkdir -p usr/share
	mkdir -p usr/share/udhcpc

	cat >  ./usr/share/udhcpc/udhcpc.sh << EOF
	#!/bin/sh
	ip addr add \$ip/\$mask dev \$interface
	if [ "\$router" ] ; then
	  ip route add default via \$router dev \$interface
	fi
	EOF
	chmod 755 ./usr/share/udhcpc/udhcpc.sh

	#******************************runudev*************************************
	cat >  ./udv << EOF
	#!/bin/sh

	udevd --daemon --resolve-names=never #modprobe yerine kullanılıyor
	udevadm trigger --type=subsystems --action=add
	udevadm trigger --type=devices --action=add
	udevadm settle || true
	EOF
	chmod 755 ./udv

	cat >  ./kur-boot-root << EOF
	#!/bin/sh
	DISK=sda
	modprobe loop
	modprobe ext4

	mkfs.ext4 /dev/sda2
	mkfs.vfat /dev/sda1
	mkdir -p hedef
	mkdir -p kaynak
	mkdir -p cdrom
	mkdir -p boot 
	mkdir -p /boot/grub

	e2fsck -f /dev/sda2
	tune2fs -O ^metadata_csum /dev/sda2
	mount -t iso9660 -o loop /dev/sr0 cdrom
	mount -t squashfs -o loop /cdrom/live/filesystem.squashfs /kaynak
	mount /dev/sda2 /hedef
	mount /dev/sda1 /boot

	cp -prfv /kaynak/* /hedef/
	cp /cdrom/boot/initrd.img /boot/
	cp /cdrom/boot/vmlinuz /boot/

	mkdir -p /hedef/dev
	mkdir -p /hedef/sys
	mkdir -p /hedef/proc
	mkdir -p /hedef/run
	mkdir -p /hedef/tmp

	mount --bind /dev /hedef/dev
	mount --bind /sys /hedef/sys
	mount --bind /proc /hedef/proc
	mount --bind /run /hedef/run
	mount --bind /tmp /hedef/tmp

	chroot /hedef grub-install --removable --boot-directory=/boot /dev/sda --target=i386-pc

	bid=$(blkid|cut -d' ' -f2|cut -c 7-42)
	touch /boot/grub/grub.cfg
	echo "linux /vmlinuz	root=UUID=${bid} rw quiet">>/boot/grub/grub.cfg
	echo "initrd /initrd.img">>/boot/grub/grub.cfg
	echo "boot">>/boot/grub/grub.cfg
		
	umount -f -R /hedef/dev
	umount -f -R /hedef/sys
	umount -f -R /hedef/proc
	umount -f -R /hedef/run
	umount -f -R /hedef/tmp

	sync 
	EOF
	chmod 755 ./kur-boot-root

	#******************************copy*************************************
	cp $HOME/distro/${name}-${version}/* -rf $HOME/rootfs


.. raw:: pdf

   PageBreak


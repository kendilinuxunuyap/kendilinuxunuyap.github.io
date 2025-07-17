.. _sistemkurma:

Sistem Kurma
============

Hazırlanan ISO ile birlikte, farklı kurulum araçları da gelebilir. Bu araçlar, çeşitli kurulum yöntemlerini destekleyebilir. En sık kullanılan kurulum yöntemleri şunlardır:

1. Tek bölüme sistem kurulumu
2. UEFI sistem kurulumu (boot + sistem)

Bu bölümde, tek bölüm kurulum ve boot + sistem şeklinde iki farklı kurulum yöntemi sırayla anlatılacaktır. Anlatılan yöntemler, farklı kullanıcı senaryolarına cevap verebilecek şekilde tasarlanmıştır.

Ancak dikkat edilmesi gereken önemli bir nokta şudur: Her yöntemi ayrı ayrı son kullanıcıya seçenek olarak sunmak, özellikle tecrübesiz kullanıcılar için kafa karıştırıcı olabilir. Örneğin:

- Kullanıcı, kurulum sırasında **EFI** seçeneğini işaretlediğinde fakat sistem aslında **Legacy BIOS** ise, ya da tam tersi durumda, yanlış seçim yapabilir.
- Ayrıca, **sda** ve **nvme** diskler arasında farklı kurulum senaryoları gerekebilir.

Bu nedenle hazırlanan kurulum sistemi, aşağıdaki tüm olası senaryolara otomatik cevap verecek şekilde tasarlanmıştır:

- **Legacy BIOS → sd*** disk tipi
- **Legacy BIOS → nvme*** disk tipi (**desteklenmemektedir**)
- **UEFI → sd*** disk tipi
- **UEFI → nvme*** disk tipi

**Hazırlıklar:**

- Disk işlemleri için `evdev` veya `udevd` servislerinin aktif olması gerekir.
- Gerekli çekirdek modüllerini yükleyin:

  .. code-block:: shell

     modprobe loop
     modprobe squashfs
     modprobe ext4
     
.. note::

   Bu senaryolara göre hazırlanan kurulum scripti, **dialog** aracı kullanılarak oluşturulmuştur. İlgili kurulum scriptleri, **base-file** paketinin içindeki **files.rar** arşivinde yer almaktadır. 
   
   Bu bölümde, sadece **Legacy BIOS** ve **UEFI** sistem kurulumunun genel adımları anlatılacaktır. Bu yöntemleri kendi ihtiyaçlarınıza göre düzenleyerek kullanabilirsiniz.

.. raw:: pdf

   PageBreak
   
**1-Tek Bölüm Kurulumu**
========================

**Disk Bölümlendirme:**

.. code-block:: shell

    cfdisk /dev/sda

1. `dos` seçilmeli  
2. `type linux system` seçilmeli  
3. `write` yazılmalı  
4. `quit` yapılmalı  
5. Bu işlem sonucunda sadece **/dev/sda1** bölümü olacaktır  

**Disk biçimlendirme**::

    $ mkfs.ext2 /dev/sda1

**Dosya Sistemi Oluşturma:**

.. code-block:: shell

    mkfs.ext4 /dev/sda1

**Kurulum Medyasını Bağlama ve Dosya Kopyalama:**

.. code-block:: shell

    mkdir -p /cdrom /kaynak
    mount -t iso9660 -o loop /dev/sr0 /cdrom
    mount -t squashfs -o loop /cdrom/live/filesystem.squashfs /kaynak
    mkdir -p /hedef
    mount /dev/sda1 /hedef
    cp -prfv /kaynak/* /hedef
    sync

**Chroot Ortamına Geçiş ve GRUB Kurulumu:**

.. code-block:: shell

    for dir in /dev /sys /proc /run /tmp; do
    	mkdir -p /hedef/$dir
        mount --bind /$dir /hedef/$dir
    done

    chroot /hedef
    grub-install --boot-directory=/boot /dev/sda
    grub-mkconfig -o /boot/grub/grub.cfg


.. raw:: pdf

   PageBreak

**2-UEFI Sistem Kurulumu**
==========================

**Disk Bölümlendirme:**

.. code-block:: shell

    cfdisk /dev/sda

1. `gpt` seçin  
2. 512MB `uefi` alanı oluşturun (sda1)  
3. Geri kalan alanı `Linux system` olarak ayarlayın (sda2)  
4. `Write` ve ardından `Quit`
5. Bu işlem sonucunda sadece **/dev/sda1 ve dev/sda2** bölümü oluşmalı.   

**Bölümleri biçimlendirme**::

    mkfs.vfat /dev/sda1
    mkfs.ext4 /dev/sda2
    
**Kurulum Medyasını Bağlama ve Dosya Kopyalama:**

.. code-block:: shell

    mkdir -p /cdrom /kaynak
    mount -t iso9660 -o loop /dev/sr0 /cdrom
    mount -t squashfs -o loop /cdrom/live/filesystem.squashfs /kaynak
    mkdir -p /hedef 
    mkdir -p /hedef/boot/efi
    mount /dev/sda2 /hedef
    mount /dev/sda1 /hedef/boot/efi
    cp -prfv /kaynak/* /hedef
    sync

**Chroot Ortamına Geçiş ve GRUB Kurulumu:**

.. code-block:: shell

    for dir in /dev /sys /proc /run /tmp; do
    	mkdir -p /hedef/$dir
        mount --bind /$dir /hedef/$dir
    done

    chroot /hedef
    
    mount -t efivarfs efivarfs /sys/firmware/efi/efivars
    grub-install --removable --boot-directory=/boot --efi-directory=/boot --target=x86_64-efi /dev/sda
    grub-mkconfig -o /boot/grub/grub.cfg

Kaynak::

	- https://wiki.archlinux.org/title/GRUB_(T%C3%BCrk%C3%A7e)#UEFI_sistemler - 08/07/2025
	- https://tldp.org/HOWTO/html_single/SquashFS-HOWTO/ - 09/07/2025
	- https://askubuntu.com/questions/437880/extract-a-squashfs-to-an-existing-directory - 11/07/2025
	- https://grok.com/share/c2hhcmQtMw%3D%3D_2ad2ac6b-d067-40b0-9b55-46db0c2c98dc - 10/07/2025

	
.. raw:: pdf

   PageBreak

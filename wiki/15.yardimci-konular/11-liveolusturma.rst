**Live Sistem Oluşturma   ve Sistem Kurulumu**
++++++++++++++++++++++++++++++++++++++++++++++

Canlı sistem oluşturma veya RAM üzerinden çalışan sistem hazırlamak için SquashFS dosya sisteminde dağıtım sıkıştırılmalıdır.  
SquashFS, Linux işletim sistemlerinde sıkıştırılmış bir dosya sistemidir. Sistemimizi sıkıştırır ve ardından salt okunur bir dosya sistemine dönüştürür.

SquashFS Oluşturma
------------------

.. code-block:: shell

    # mksquashfs input_source output/filesystem.squashfs -comp xz -wildcards 
    mksquashfs initrd $HOME/distro/filesystem.squashfs -comp xz -wildcards


Cdrom Erişimi
-------------

Cd veya Dvd aygıtı Linux sistemlerinde /dev/sr0 aygıt dosyası olarak erişilir.  
Cd içeriği üzerinde okuma yapmak için aşağıdaki komutu kullanabiliriz.

.. code-block:: shell

    cat /dev/sr0

Cdrom Bağlama
-------------

.. code-block:: shell

    mkdir cdrom
    mount /dev/sr0 /cdrom

Bu işlem sonucunda cdrom bağlanmış olacaktır. ISO dosyamızın içerisine erişebiliriz.

Squashfs Dosyasını Bulma
------------------------

Genellikle isoların içine squashfs dosyası oluşturulur. Bu sayede live yükleme yapılabilir.  
Örneğin, /live/filesystem.squashfs imaj dosyalarında konumudur.

Squashfs Bağlama
----------------

Squashfs dosyasını bağlamadan önce loop modülünün yüklü olması gerekmektedir. Eğer yüklemediyseniz;

.. code-block:: shell

    # loop modülü yüklenir.
    modprobe loop 
    mkdir kaynak
    mount -t squashfs -o loop cdrom/live/filesystem.squashfs /kaynak

Squashfs Sistemine Geçiş
------------------------

Yukarıdaki adımlarda squashfs dosyamızı **/kaynak** adında dizine bağlamış olduk.  
Bu aşamadan sonra sistemimizin bir kopyası olan squashfs canlıdan erişilebilir veya sistemi buradan başlatabiliriz.

Squashfs dosya sistemimize bağlanmak için;

.. code-block:: shell

    chroot canli /bin/bash

Bu işlemin yerine exec komutuyla bağlanırsak sistemimiz id "1" değeriyle çalıştıracaktır.  
Eğer sistemin bu dosya sistemiyle açılmasını istiyorsak exec ile çalıştırıp id=1 olmasına dikkat etmeliyiz.

.. raw:: pdf

   PageBreak

Bu bölümde **/kaynak** bağlanan sistemin disk üzerine kopyalanması ve sisk üzerinden sistemi açacak şekilde hazırlanmasını iki senaryo için anlatılmıştır.

**1-Tek Bölüm Kurulumu**
========================

**Hazırlıklar:**

- Disk işlemleri için `evdev` veya `udevd` servislerinin aktif olması gerekir.
- Gerekli çekirdek modüllerini yükleyin:

  .. code-block:: shell

     modprobe loop
     modprobe squashfs
     modprobe ext4


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

**Hazırlıklar:**

- Disk işlemleri için `evdev` veya `udevd` servislerinin aktif olması gerekir.
- Gerekli çekirdek modüllerini yükleyin:

  .. code-block:: shell

     modprobe loop
     modprobe squashfs
     modprobe ext4


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

    #--------------------------------------------------------------------------------------------------------------------
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

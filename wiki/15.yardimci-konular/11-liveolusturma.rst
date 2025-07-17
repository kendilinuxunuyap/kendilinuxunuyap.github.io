**Live Sistem Oluşturma**
+++++++++++++++++++++++++

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
    mkdir canli
    mount -t squashfs -o loop cdrom/live/filesystem.squashfs /canli

Squashfs Sistemine Geçiş
------------------------

Yukarıdaki adımlarda squashfs dosyamızı /canli adında dizine bağlamış olduk.  
Bu aşamadan sonra sistemimizin bir kopyası olan squashfs canlıdan erişilebilir veya sistemi buradan başlatabiliriz.

Squashfs dosya sistemimize bağlanmak için;

.. code-block:: shell

    chroot canli /bin/bash

Bu işlemin yerine exec komutuyla bağlanırsak sistemimiz id "1" değeriyle çalıştıracaktır.  
Eğer sistemin bu dosya sistemiyle açılmasını istiyorsak exec ile çalıştırıp id=1 olmasına dikkat etmeliyiz.

.. raw:: pdf

   PageBreak


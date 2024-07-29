e2fsprogs Paketi
^^^^^^^^^^^^^^^^
e2fsprogs paket sistemde mkfs.ext4, e2fsck, tune2fs vb sistem araçlarının yüklenmesini sağlar. Eğer sistemde bu sistem uygulamaları yoksa bu paketin yüklenmesi veya derlenmesi gerekmektedir.

Eğer /boot bölümünü ayırmayacaksanız grub yüklenirken **unknown filesystem** hatası almanız durumunda aşağıdaki yöntemi kullanabilirsiniz.

.. code-block:: shell

	$ e2fsck -f /dev/sda2
	$ tune2fs -O ^metadata_csum /dev/sda2
	
	
.. raw:: pdf

   PageBreak


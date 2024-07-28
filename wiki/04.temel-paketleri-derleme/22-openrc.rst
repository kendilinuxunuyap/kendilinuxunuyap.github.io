OpenRC
++++++

Openrc sistem açılışında çalışacak uygulamaları çalıştıran servis yöneticisidir.

Derleme
-------

Kaynak koddan derlemek için aşağıdaki adımları izlemelisiniz:

.. code-block:: shell

	 git clone https://github.com/OpenRC/openrc
	 cd openrc
	  meson setup build \
        --sysconfdir=/etc \
        --libdir=/lib \
        --prefix=/ \
        -Ddefault_library=both \
        -Dzsh-completions=true \
        -Dbash-completions=true \
        -Dpkgconfig=true

	 meson setup build --prefix=/usr
	 export DESTDIR=${DESTDIR}//
	 ninja -C build install
	

Çalıştırılması
--------------

Openrc servis yönetiminin çalışması için boot parametrelerine yazılması gerekmektedir. 
**/boot/grub.cfg** içindeki **linux /vmlinuz init=/usr/sbin/openrc-init root=/dev/sdax** olan satırda **init=/usr/sbin/openrc-init** yazılması gerekmektedir. Artık sistem openrc servis yöneticisi tarafından uygulamalar çalıştırılacak ve sistem hazır hale getirilecek.

Basit kullanım
--------------

Servis etkinleştirip devre dışı hale getirmek için **rc-update** komutu kullanılır. Aşağıda **udhcpc** internet servisi örnek olarak gösterilmiştir. **/etc/init.d/** konumunda **udhcpc** dosyamızın olması gerekmektedir.

.. code-block:: shell

	# servis etkinleştirmek için
	$ rc-update add udhcpc boot
	# servisi devre dışı yapmak için
	$ rc-update del udhcpc boot
	# Burada udhcpc servis adı boot ise runlevel adıdır.
	
.. raw:: pdf

   PageBreak

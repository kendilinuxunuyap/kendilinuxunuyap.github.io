Dynamic derleme
^^^^^^^^^^^^^^^
Dynamic olarak derlenen bir dosya düşük boyutludur ve bağımlılıkları bulunur. Derleme yapılırken ek parametre kullanılmaz.

.. code-block:: shell

	$ gcc -o main main.c

Dynamic derlenmiş bir dosyanın bağımlılıklarını **ldd** komutu kullanarak öğrenebiliriz. Eğer ldd komutu hata mesajı ile geri dönüş veriyorsa static olarak derlenmiş demektir.

.. code-block:: shell

	$ ldd /bin/bash
	    linux-vdso.so.1 (0x00007ffc8f136000)
	    libtinfo.so.6 => /lib/x86_64-linux-gnu/libtinfo.so.6 (0x00007ff10adcd000)
	    libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007ff10adc7000)
	    libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007ff10ac02000)
	    /lib64/ld-linux-x86-64.so.2 (0x00007ff10af6c000)

Burada **libc.so.6** ve **ld-linux-x86_64.so.2** dosyaları tamamında ortaktır ve **glibc** tarafından sağlanır. 
Dynamic derlenmiş bir dosyanın derlenmesi veya çalıştırılabilmesi için tüm bağımlılıklarının sistemde bulunması gereklidir.

**libc ve interpreter kavramı**
-------------------------------

Dynamic olarak derlenmiş bütün dosyalar temelde libc.so.6 ve ld-linux-x86-64.so.2 bağımlılıklarına ihtiyaç duyar. Bu dosyalardan libc.so.6 temel C kütüphanesidir. Bu kütüphane sayesinde program temel işlevlerini yerine getirebilir hale gelir. ld-linux-x86-64.so.2 ise interpreter olup dosyanın ne şekilde çalıştırılacağını belirler. Bir dosyanın hangi interpreter ile çalıştığını bulmak için file komutundan yararlanabiliriz. linux-vdso.so.1 ise kernel tarafından sağlanır ve herhangi bir dosya şeklinde bulunmaz.

.. code-block:: shell

	file /bin/bash
	/bin/bash: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked,
	interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, stripped

**LD_LIBRARY_PATH kavramı**
---------------------------

Bir çalıştırılabilir dosyanın bağımlılığı genellikle sistemde kurulu bulunmalıdır. Fakat bazı durumlarda sistem dizinlerinden farklı bir yerde bulunması gerekebilir. Bu gibi durumlarda LD_LIBRARY_PATH çevresel değişkeni tanımlanarak kütüphanenin aranacağı ek dizinin konumu belirtilir.

.. code-block:: shell

	ldd test.bin
	linux-vdso.so.1 (0x00007ffc1c5c5000)
	libtest.so => not found
	libc.so.6 => /lib64/libc.so.6 (0x00007feaab862000)
	/lib64/ld-linux-x86-64.so.2 (0x00007feaaba76000)

Yukarıdaki örnekte libtest.so dosyası sistemde bulunamadığı için ldd çıktımızda uyarı ile karşılaştık. Şimdi de çevresel değişkenimizi tanımlayarak aynı işlemi tekrar deneyelim.

.. code-block:: shell

	export LD_LIBRARY_PATH=/home/user/test/libs/
	ldd test.bin
	linux-vdso.so.1 (0x00007ffe22bbc000)
	libtest.so => /home/user/test/libs/libtest.so (0x00007f4c97790000)
	libc.so.6 => /lib64/libc.so.6 (0x00007f4c97583000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f4c9779c000)

Gördüğünüz gibi kütüphaneyi tanımladığımız dizinde buldu.

**ldconfig**
------------

Sistemde kurulu olan uygulamaların sistem kütüphanelerini nereden alacağını bilmesi gerekmektedir. Bunun için **/etc/ld.so.conf** dosyasına aşağıda içerik eklenmeli.
Bu eklenen yerlerdeki kütüphaneleri sistemde herehangi bir uygulama ihtiyaç duymasında kullanacaktır. 

.. code-block:: shell

	/usr/local/lib64
	/usr/local/lib
	include /etc/ld.so.conf.d/*.conf
	/usr/lib64
	/usr/lib
	/lib64
	/lib


Eğer aşağıdaki dosyada ve elle kütüphane girdisi yapılmışsa anında yansımasını istersek aşağıdaki komutu çalıştırmalıyız.

.. code-block:: shell

	ldconfig 


.. raw:: pdf

   PageBreak


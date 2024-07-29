libreadline 
+++++++++++

libreadline, Linux işletim sistemi için geliştirilmiş bir kütüphanedir. Bu kütüphane, kullanıcıların komut satırında girdi almasını ve düzenlemesini sağlar. Bir programcı olarak, libreadline'i kullanarak kullanıcı girdilerini okuyabilir, düzenleyebilir ve işleyebilirsiniz.

libreadline Derleme
-------------------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="8.1"
	name="readline"
	cd /tmp
	rm -rf ${name}-${version}
	rm -rf build-${name}-${version}
	wget https://ftp.gnu.org/pub/gnu/readline/${name}-${version}.tar.gz
	tar -xvf ${name}-${version}.tar.gz
	../${name}-${version}/configure --prefix=/ --enable-shared --enable-multibyte
	
	# derleme
	make 
	
	# derlenen paketin yüklenmesi ve ayarlamaların yapılması
	make install DESTDIR=$HOME/distro/rootfs

Kodları Yazma
-------------

Altta görülen **readline**  kütüphanesini kullanarak terminalde kullanıcıdan mesaj alan ve mesajı ekrana yazan programı hazırladık.
$HOME(ev dizinimiz) dizinine merhaba.c dosyası oluşturup aşağıdaki kodları ekleyelim.

.. code-block:: shell

	# merhaba.c doayası
	#include<stdio.h>
	#include<readline/readline.h>
	void main()
	{
	char* msg=readline("Adını Yaz:");
	puts(msg);
	}

Program Derleme
---------------

.. code-block:: shell
	cd $HOME
	gcc -o merhaba merhaba.c -lreadline
	cp merhaba $HOME/distro/rootfs/merhaba

Program Test Etme
-----------------

.. code-block:: shell

	sudo chroot $HOME/distro/rootfs /merhaba

Program hatasız çalışıyorsa **readline** kütüphanemiz hatasız derlenmiş olacaktır.

.. raw:: pdf

   PageBreak


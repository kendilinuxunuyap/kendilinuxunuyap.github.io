**BusyBox**
+++++++++++

**BusyBox**, https://busybox.net/about.html adresteki bilgilere göre birçok temel Unix aracını tek bir ikili dosya içinde sunan, küçük ve esnek bir programdır. Çoğunlukla **initramfs** sistemlerinde ve gömülü Linux dağıtımlarında tercih edilir. BusyBox ile komutlar şu şekilde çalıştırılabilir:

.. code-block:: shell

   busybox [komut]

Bir komutu doğrudan çalıştırabilmek için BusyBox’u o komut adıyla sembolik bağlamak mümkündür. Örneğin, **tar** komutunu BusyBox üzerinden çalıştırmak için:

.. code-block:: shell

   ln -s /bin/busybox ./tar
   ./tar

Burada busybox içindeki gömülü olan tar kullanmayı gördük. Aslında aklımaza gelen her komutun busybox içinde gömülü hali vardır. Ama bu tüm komutlar için ve tüm parametreleri için geçerli değildir. Busybox içindeki tüm komutların kısayolunu(sembolik bağı) eklemek için aşağıdaki komut kullanılır.

.. code-block:: shell

   busybox --install -s /bin

Derleme
-------

Gömülü sistem tasarımı veya **initramfs** içinde kullanılacak busybox **paylaşımsız(static)** derlenir. Bu şekilde derlendiğinde glibc kütüphanelerine ihtiyaç duymadan çalışacaktır. 

Şimdi busybox derlemek için https://busybox.net/ adresinden **stable** başlığı altındaki kaynak kodlarını indiriniz.

.. code-block:: shell
	
   # kaynak kod indirilir
   wget https://busybox.net/downloads/busybox-1.36.1.tar.bz2
   
   # indirilen dosya açılır
   tar -xvjf busybox-1.36.1.tar.bz2
   
   # açılan kaynak dosyalarının bulunduğu dizine geçilir
   cd busybox-1.36.1/

Şimdi kodlarımızı indirdik. derlemek için aşağıdaki komutları çalıştıralım.

.. code-block:: shell

   # varsayılan yapılandırmayı uygula
   make defconfig
   
   # static derleme yapacaksak  sed ile .config dosyasını düzenliyoruz.
   sed -i "s|.*CONFIG_STATIC_LIBGCC .*|CONFIG_STATIC_LIBGCC=y|" .config
   sed -i "s|.*CONFIG_STATIC .*|CONFIG_STATIC=y|" .config
   
   # derliyoruz
   make
   
   # Static derleme sonucu aşağıdaki gibi görünür.
   ldd /bin/busybox 
   özdevimli bir çalıştırılabilir değil

Derleme tamamlandığında, oluşturulan **busybox** ikili dosyası kaynak dizininde bulunur.

.. raw:: pdf

   PageBreak



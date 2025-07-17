**Kaynak Kod Derleme**
++++++++++++++++++++++

Bir uygulamanın kodları genellikle çalışmaz(python benzeri kodlar istisna). Bu kodlardan sistemlerin çalışması için çalışabilir dosyalar üretilir(linuxta ikili dosya, elf, windowsta exe, com vb.). Bu çalışabilir dosyaları koddan oluştururken iki faklı şekilde oluşturabiliriz.

1- **Paylaşımlı Derleme(dynamic):** Kendine lazım olan kütüphaneleri sistem üzerindeki başka uygulamalarla ortak kullanır. 
2- **Paylaşımsız, gömülü(static):** Kendisine lazım olan kütütphaneleri kendi içinde barındırır(porable uygulama gibi).

Şimdi aşağıdaki kaynak kodumuzu iki farklı yöntemle derleyelim.

.. code-block:: C

	//main.c dosyamız
	#include <stdio.h>
	void main(){
	    printf("Merhaba\n");
	}


**2-Paylaşımlı Derleme(dynamic):** 
--------------------------------

Derlenen uygulama  sistemde bulunan kütüphaneleri kullanacak şeklide derlenmesidir. Uygulama boyutu küçüktür, taşınabirliği sınırlanabilir.
Aşağıdaki gibi derlenir.

.. code-block:: shell

	gcc -o main main.c

main.c kodumuzu **main** adında ikili çalışabilir dosyaya dönüşütürdük. **ldd** komutuyla **main** dosyasının kullandığı kütüphaneler öğrenilir.

.. code-block:: shell

	unset LD_PRELOAD
	ldd ./main 
		linux-vdso.so.1 (0x00007ffdb3bb9000)
		libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f2c53fe0000)
		/lib64/ld-linux-x86-64.so.2 (0x00007f2c541e7000)


Burada **libc.so.6** ve **ld-linux-x86_64.so.2** dosyaları **glibc** tarafından sağlanır. 
Derlenmiş dosyanın çalışması için tüm bağımlılıklarının sistemde bulunması gereklidir.Sadece gerekli olan kütüphaneleri görmek için   **readelf -d** komutu kullanılabilir. Aşağıda gerekli olan kütüphaneler listeleniyor.
 
.. code-block:: shell

	readelf -d ./main | grep -i needed 
		0x0000000000000001 (NEEDED)             Paylaşımlı kitaplık: [libc.so.6]
		


**ldconfig**
------------

Sistemdeki kütüpkhanelerin konumlarını **/etc/ld.so.conf** dosyasına bakarak belirler. 

.. code-block:: shell
	
	#/etc/ld.so.conf dosyası
	/usr/lib64
	/usr/lib
	/lib64
	/lib

Kütüphanelerde değişiklik yapılmışsa ve hemen bu değişikliği sistemin görmesini istersek **ldconfig** komutu kullanılmalıdır.

.. raw:: pdf

   PageBreak

**2-Paylaşımsız, gömülü(static):**
--------------------------------

Derlenen uygulama sistemde  bulunan ve çalışması için gerekli olan kütüphaneleri uygulama içine dahil eden bir derleme yöntemidir. Uygulamamızı static derlemek için  **-static** parametresi ekleyerek derlenir.

.. code-block:: shell

	gcc -o main main.c -static

Paylaşımlı(dynamic) derleme işleminde bağımlı olduğu dosyaları **ldd** komutunu kullanarak öğrenmiştik. Şimdi paylaşımsız derlediğimiz **main** dosyasında bağımğımlı olduğu kütüphaneleri kontrol ediyoruz.

.. code-block:: shell

	ldd main
	    not a dynamic executable

Bağımlı kütüphaneler yerine **not a dynamic executable** mesajı gördük. Bunun anlamı çalışması için hiçbir kütüphaneye ihtiyaç duymaz. Bu bir avantaj ve taşınabirliği artırır. Devevantajı ise boyutu büyük olur. İhtiyaca göre paylaşımlı veya paylaşımsız derleme tercih edilir.


.. raw:: pdf

   PageBreak




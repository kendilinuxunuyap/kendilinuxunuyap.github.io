Dağıtım Ortamın Hazırlanması
++++++++++++++++++++++++++++

Dağıtım hazırlarken sistemin derlenmesi ve gerekli ayarlamaların yapılabilmesi için bir linux dağıtımı gerekmektedir. Tecrübeli olduğunuz bir dağıtımı seçmenizi tavsiye ederim. Fakat seçilecek dağıtım Gentoo olması daha hızlı ve sorunsuz sürece devam etmenizi sağlayacaktır.
Bu dağıtımı hazırlaken Debian dağıtımı kullanıldı. Bazı paketler için, özellikle bağımlılık sorunları yaşanan paketler için ise Gentoo kullanıldı.

Bir dağıtım hazırlamak için çeşitli paketler lazımdır. Bu paketler;

- **debootstrap	:** Dağıtım hazırlarken kullanılacak **chroot** uygulaması bu paket ile gelmektedir. chroot ayrı bir konu başlığıyla anlatılacaktır.
- **make	:** Paket derlemek için uygulama
- **squashfs-tools:** Hazırladığımız sistemi sıkıştırılmış dosya halinde sistem görüntüsü oluşturmamızı sağlayan paket.
- **gcc		:** c kodlarımızı derleyeceğimiz derleme aracı.
- **wget	:** tarball vb. dosyaları indirmek için kullanılacak uygulama.
- **unzip	:** Sıkıştırmış zip dosyalarını açmak için uygulama
- **xz-utils	:** Yüksek sıkıştırma yapan sıkıştırma uygulaması
- **tar		:** tar uzantılı dosya sıkıştırma ve açma için kullanılan uygulama.
- **zstd	:** Yüksek sıkıştırma yapan sıkıştırma uygulaması 
- **grub-mkrescue :** Hazırladığımız ve paketleri kurduğumuz dizini, iso dosyası yapmak için kullanılan uygulama
- **qemu-system-x86:** iso dosyalarını test etmek ve kullanmak için sanal makina emülatörü uygulaması.


.. code-block:: shell

	sudo apt update
	sudo apt install debootstrap xorriso mtools make squashfs-tools gcc wget unzip xz-utils tar zstd -y


Paket kurulumu yapıldıktan sonra dağıtımı hazırlayacağımız yeri(hedefi) belirlemeliyiz. Bu dokümanda sistem için kurulum dizini $HOME/distro/rootfs olarak kullanacağız.

**$HOME:** Bu ifade linux ortamında açık olan kullanıncının ev dizinini ifade eder. Örneğin sisteme giriş yapan kullanıcı  **ogrenci** adinda bir kullanıcı olsun. **$HOME** ifadesi **/home/ogrenci** konumunu ifade eder.


Ortamın hazırlanmasından sonra bazı konuları bilmemiz gerelmektedir. Bunlar; 

1. Derleme(Dinamik/Static) 
2. chroot Kullanımı: :ref:`_chrootnedir` 
3. Kernel/Modül Derleme
4. initrd Tasarlama
5. İso Oluşturma
6. Canlı Sistem Oluşturma Kullanma
7. qemu Kullanmı
8. sfdisk Kullanımı
9. Canlı Sistemden Kurulum Yapma

Burada liste halinde verilen konu başlıkları bu dokümanın son bölümünde anlatılmaktadır. Bu konularla ilgili bir dağıtım hazırlanırken gerekli bilgiler verilmiştir.




.. raw:: pdf

   PageBreak


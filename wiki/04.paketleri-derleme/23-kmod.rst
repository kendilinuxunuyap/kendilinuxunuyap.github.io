kmod
++++

Linux çekirdeği ile donanım arasındaki haberleşmeyi sağlayan kod parçalarıdır. Bu kod parçalarını kernele eklediğimizde kerneli tekrardan derlememiz gerekmektedir. Her kod ekleme ve her kod çıkartma işleminden sonra kernel derlemek ciddi bir iş yükü ve karmaşa oluşturacaktır.

Bu sorunların çözümü için modul vardır. Moduller kernele istediğimiz kod parçalarını ekleme ya da çıkartma yapabilmemizi sağlar. Bu işlemleri yaparken kernel derleme işlemi yapmamıza gerek yoktur.

kmod Komutları
--------------

- **lsmod :** yüklü modulleri listeler
- **insmod:** tek bir modul yükler
- **rmmod:** tek bir modul siler
- **modinfo:** modul hakkında bilgi alınır 
- **modprobe:** insmod komutunun aynısı fakat daha işlevseldir. module ait bağımlı olduğu modülleride yüklemektedir. modprobe  modülü /lib/modules/ dizini altında aramaktadır.
- **depmod:** /lib/modules dizinindeki modüllerin listesini günceller. Fakat başka bir dizinde ise basedir=konum şeklinde belirtmek gerekir. konum dizininde /lib/modules/** şeklinde kalsörler olmalıdır.

Derleme
-------

.. code-block:: shell
	
	# kaynak kod indirme ve derleme için hazırlama
	version="31"
	name="kmod"
	mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
	rm -rf $HOME/distro/build/* #içeriği temizleniyor
	cd $HOME/distro/build #dizinine geçiyoruz

	wget https://mirrors.edge.kernel.org/pub/linux/utils/kernel/kmod/${name}-${version}.tar.xz
	tar -xvf ${name}-${version}.tar.xz
	cd ${name}-${version} # Kaynak kodun içine giriliyor
	
	configure --prefix=/ \
		--libdir=/lib/ \
		--bindir=/sbin
	# remove xsltproc dependency
	   rm -f man/Makefile
	   echo -e "all:\ninstall:" > man/Makefile
	   
	# derleme
	make 
		
	# derlenen paketin yüklenmesi ve ayarlamaların yapılması
	make install DESTDIR=$HOME/distro/rootfs
	cd $HOME/distro/rootfs/sbin
	for target in depmod insmod modinfo modprobe rmmod; do
	  ln -sfv kmod $target
	done
	cd $HOME/distro/rootfs/bin
	ln -sfv ../sbin/kmod lsmod


Test Edilmesi
-------------

Bir modül eklendiğinde veya çıkartıldığında modülle ilgili mesajları dmesg logları ile görebiliriz.

.. raw:: pdf

   PageBreak


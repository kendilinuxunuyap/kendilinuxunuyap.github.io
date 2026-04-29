**Paket Kaldırma**
++++++++++++++++++

Sistemde kurulu paketleri kaldırmak için işlem adımları şunlardır.

1. Paketin kullandığı bağımlılıkları başka paketler kullanıyor mu kontrol edilir. Eğer kullanılmıyorsa kaldırılır.
2. Paketin **/var/lib/kly/paket-verison.lst** dosyası içerisindeki dosyalar, dizinler kaldırılır.
3. Kaldırılan dosyalardan sonra **/var/lib/kly/paket-verison.lst** dosyası silinir.
4. sistemde kurulu paketleri tutan  **/var/lib/kly/index.lst** dosyasından ilgili paket satırı kaldırılmalıdır.

**Not:** Paket kaldırma işlemlerini yapan **klykaldir** scriptinde 1. adımdaki bağımlılık kontrolü yapma ve kaldırma işlemi yapılmamaktadır. Fakat iyi bir paket sisteminde mutlaka yapılmalıdır. Çünkü sistemde ihtiyaç olmayan paketler kalacaktır.

**klykaldir** scripti
---------------------

.. code-block:: shell
	
	#-------------------------------------------------------------------------------------------------------------
	#!/bin/sh
	name="name=\"${1}\""
	target=$2
	mkdir -p $target
	paket=$(echo $(cat $target/etc/kly/index.lst|grep $name)|cut -d"\"" -f2)
	version=$(echo $(cat $target/etc/kly/index.lst|grep $name)|cut -d"\"" -f4)
	depends=$(echo $(cat $target/etc/kly/index.lst|grep $name)|cut -d"\"" -f6)
	# index dosyamızda paket aranıyor
	if [ ! -n "${paket}" ]; then
		echo "***********Paket Bulunamadı**********"; exit
	fi
	# Bağımlılıkları başka paketler kullanıyor mu kontrol edilir
	# Başka paketler kullanılıyorsa silinmemeli. Bu işlemin kodları yazılmadı.
	echo "${paket}-${version} bağımlılık kontrolü yapılacak"
	
	# 2. adım Paketin paket-version.lst dosyası içerisindeki dosyalar kaldırılır.
	if [ -f "$target/var/lib/kly/${paket}-${version}.lst" ]; then
		cat $target/var/lib/kly/${paket}-${version}.lst | while read dosya ;
		do
			if [[ -f "$target/$dosya" ]] ; then rm -f "$target/$dosya"; fi
		done
	fi
	# 3. adım /var/lib/kly/paket-version.lst dosyası silinir.
	rm -f $target/var/lib/kly/${paket}-${version}.lst

	# 4. adım /var/lib/kly/index.lst dosyasından ilgili paket satırı kaldırılır.
	sed -i "/name=\"${paket}\"/d" $target/var/lib/kly/index.lst

	echo "********** ${paket}-${version}  Paketi Kaldırıldı **********"
		


**klykaldir** Kullanma
----------------------

.. code-block:: shell
	
	./klykaldir readline /home/user1/testiso
	# /home/user1/testiso konumu hazırladığımız dağıtım konumudur.
	# kendi siteminize uygun konum belirleyiniz. 
.. raw:: pdf

   PageBreak


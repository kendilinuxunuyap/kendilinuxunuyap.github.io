
index Güncelleme
++++++++++++++++

İndex güncelleme uzak(internet) depodaki paketlerin index listesinin yerelde tutulan index dosyasıyla eşitlemek işlemidir.
Depoda olan paketlerin listesi yerelde tutulan index.lst dosyasındada olması gerekmetedir. Bu işlemi yapan klyupdate dosya içeriği aşağıdadır.

**klyupdate** 
-------------

Debian sisteminde /etc/apt/source.list gibi bir yapı bulunmaktadır. Bu dosya içindeki depo adreslerine göre index oluşturmaktadır. Hazırladığımız paket sitemindede /etc/kly/source.list dosyası kullanılmaktadır. Birden fazla index dosyasını birleştiren ve güncelleyen scriptimiz aşağıdadır.
 
.. code-block:: shell
	
	#!/bin/sh
	target=""
	if [ -n "${1}" ];then target="$1"; else target="/";fi
	mkdir -p $target/etc/kly -p $target/tmp
	touch $target/etc/kly/sources.list
	rm -rf $target/etc/kly/index.lst
	rm -rf $target/tmp/temp.lst

	curl -Lo $target/tmp/index.lst \
	https://github.com/kendilinuxunuyap/kly-binary-packages/releases/download/current/index.lst

	while IFS= read -r adres
	do
	rm -rf $target/tmp/temp.lst 1>$target/dev/null 2>$target/dev/null
	github_adres=$(echo $adres|cut -d"/" -f1)
	binary_package_adres=$(echo $adres|cut -d"/" -f2)
	#echo $github_adres
	#echo $binary_package_adres
	curl -Lo $target/tmp/temp.lst \
	"https://github.com/${github_adres}/${binary_package_adres}/releases/download/current/index.lst"
	if [ ! -f "$target/tmp/temp.lst" ];
	then
	echo "Paket adresleri hatalı $target/etc/kly/sources.list dosya içeriğini kontrol ediniz!";
	continue;
	fi
	while IFS= read -r liste
	do
	echo "${liste}|https://github.com/${adres}/raw/master/">>$target/etc/kly/index.lst
	done < $target/tmp/temp.lst
	done < $target/etc/kly/sources.list
	 
**klyupdate** Kullanma
----------------------

Script bir parametre almaktadır. Parametremiz --update veya -u olmalıdır. Bu scripti kullanarak /etc/kly/index.lst dosyasını github depomuzdaki paket listesiyle güncelleyecektir. 

.. code-block:: shell
	
	./klyupdate /home/user1/testiso
	# /home/user1/testiso konumu hazırladığımız dağıtım konumudur.
	# kendi siteminize uygun konum belirleyiniz. 


.. raw:: pdf

   PageBreak



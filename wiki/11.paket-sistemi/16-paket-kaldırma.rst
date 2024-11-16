
Paket Kaldırma
++++++++++++++

Sistemde kurulu paketleri kaldırmak için işlem adımları şunlardır.

1. Paketin kullandığı bağımlılıkları başka paketler kullanıyor mu kontrol edilir. Eğer kullanılmıyorsa kaldırılır.
2. Paketin paket.LIST dosyası içerisindeki dosyalar, dizinler kaldırılır.
3. Kaldırılan dosyalardan sonra /paket/veri/yolu/paket.LIST dosyasından paket bilgisi kaldırılır.
4. sistemde kurulu paketler index dosyasından ilgili paket satırı kaldırılmalıdır.


Paketi kaldırmak için ise aşağıdaki örnek kullanılabilir.

.. code-block:: shell

	cat /paket/veri/yolu/paket.LIST | while read dosya ; do
	    if [[ -f "$dosya" ]] ; then
	        rm -f "$dosya"
	    fi
	done
	cat /paket/veri/yolu/paket.LIST | while read dizin ; do
	    if [[ -d "$dizin" ]] ; then
	        rmdir "$dizin" || true
	    fi
	done
	rm -f /paket/veri/yolu/paket.LIST

Bu örnekte paket listesini satır satır okuduk. Önce dosya olanları sildik.
Daha sonra tekrar okuyup boş kalan dizinleri sildik.
Son olarak palet listesi dosyamızı sildik.
Bu işlem sonunda paket silinmiş oldu.


.. raw:: pdf

   PageBreak
   

**kly Paket Kaldırma Scripti Tasarlama**
----------------------------------------

Dokumanda örnek olarak verilen kly paket sistemi için yukarıdaki paket kaldırma bilgilerini kullanarak tasarlanmıştır.

**klykaldir** scripti
---------------------

.. code-block:: shell
	
	#!/bin/sh
	#set -e
	paket=$1
	paketname="name=\"${paket}\""
	target=$2
	if [ -n "${2}" ];then target="$2"; else target="/";fi
	mkdir -p $target

	indexpaket=$(cat $target/var/lib/kly/index.lst|grep $paketname)
	name=""
	version=""
	depends=""
	if [ -n "${indexpaket}" ]; then
	namex=$(echo $indexpaket|cut -d":" -f1)
	versionx=$(echo $indexpaket|cut -d":" -f2)
	dependsx=$(echo $indexpaket|cut -d":" -f3)
	name=${namex:6:-1}
	version=${versionx:9:-1}
	depends=${dependsx:9:-1}
	else
	echo "***********Paket Bulunamadı**********"; exit
	fi
	# Bağımlılıkları başka paketler kullanıyor mu kontrol edilir
	echo "${paket}-${version} bağımlılık kontrolü yapılacak"
	# Paketin file.lst dosyası içerisindeki dosyalar, dizinler kaldırılır.
	cat $target/var/lib/kly/${paket}-${version}.lst | while read dosya ;
	do
	if [[ -f "$target/$dosya" ]] ; then rm -f "$target/$dosya"; fi
	done
	cat $target/var/lib/kly/${paket}-${version}.lst | while read dizin ;
	do
	if [[ -d "$target/$dizin" ]] ; then rmdir "$target/$dizin" || true; fi
	done
	# /var/lib/kly/paket-version.lst dosyasından paket bilgisi kaldırılır.
	rm -f $target/var/lib/kly/${paket}-${version}.lst
	# /var/lib/kly/index.lst dosyasından ilgili paket satırı kaldırılır.
	sed -i "/name=\"${paket}\"/d" $target/var/lib/kly/index.lst
	# sistem guncelleniyor
	$target/sbin/ldconfig
	echo "********** ${paket}-${version}  Paketi Kaldırıldı **********"
		
Bu örnekte paket listesini satır satır okuduk. Önce dosya olanları sildik. Daha sonra tekrar okuyup boş kalan dizinleri sildik.
Son olarak paket listesi dosyamızı sildik. Bu işlem sonunda paket silinmiş oldu.

**klykaldir** Kullanma
----------------------

.. code-block:: shell
	
	./klykaldir readline /home/user1/testiso
	# /home/user1/testiso konumu hazırladığımız dağıtım konumudur.
	# kendi siteminize uygun konum belirleyiniz. 
.. raw:: pdf

   PageBreak


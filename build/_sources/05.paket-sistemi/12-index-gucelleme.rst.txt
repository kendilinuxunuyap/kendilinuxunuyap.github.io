Depo indexleme
++++++++++++++
Depo, paket yönetim sistemlerinde kurulacak olan paketleri içeren bir veri topluluğudur.
Kaynak depo ve ikili depo olarak ikiye ayrılır.
Depo içerisinde hiyerarşik olarak paketler yer alır.
Index ise depoda yer alan paketlerin isimleri sürüm numaraları gibi bilgiler ile adreslerini tutan kayıttır.
Paket yönetim sistemi index içerisinden gelen veriye göre gerekli paketi indirir ve kurar. Depo indexi aşağıdaki gibi olabilir:

.. code-block:: yaml

	Package: hello
	Version: 1.0
	Dependencies: test, foo, bar
	Path: h/hello/hello_1.0_x86_64.zip
	
	Package: test
	Version: 1.1
	Path: t/test/test_1.1_aarch64.zip
	
	...

Yukarıdaki örnekte paket adı bilgisi sürüm bilgisi ve bağımılılıklar gibi bilgiler ile paketin sunucu içerisindeki konumu yer almaktadır.
Depo indexi paketlerin içinde yer alan paket bilgileri okunarak otomatik olarak oluşturulur.

Örneğin paketlerimiz zip dosyası olsun ve paket bilgisini **.INFO** dosyası taşısın. Aşağıdaki gibi depo indexi alabiliriz.

.. code-block:: shell

	function index {
	    > index.txt
	    for i in $@ ; do
	        unzip -p $i .INFO >> index.txt
	        echo "Path: $i" >> index.txt
	    done
	}
	index t/test/test_1.0_x86_64.zip h/hello/hello_1.1_aarch64.zip ...

Bu örnekte paketlerin içindeki paket bilgisi içeren dosyaları uç uca ekledik.
Buna ek olarak paketin nerede olduğunu anlamak içn paket konumunu da ekledik.


**bps Paket Liste İndexi Güncelleme**
-------------------------------------

Dağıtımlarda uygulamalar paketler halinde hazırlanır. Bu paketleri isimleri, versiyonları ve bağımlılık gibi temel bilgileri barındıran liste halinde tutan bir dosya oluşturulur. Bu dosyaya **index.lst** isim verebiliriz. Bu dokümanda bu listeyi tutan  **index.lst** doyası kullanılmıştır. Paket sisteminde güncelleme aslında **index.lst** dosyanın en güncellen halinin sisteme yüklenmesi olayıdır.

bps paketleme sisteminde **bpsupdate** scripti hazırlanmıştır. Bu script **index.lst** dosyasının paketlerimizin en güncel halini sistemimize yükleyecektir. Bu dağıtımda paketlerimizi github.com üzerinde oluşturulan bir repostory üzerinden çekilmektedir. Paket listemiz ise yapılan her yeni paketi yükleme sırasında güncellenmektedir.

Paket güncelleme için iki script kullanmaktayız. Bunlar;

**index.lst** Dosyasını Oluşturma
.................................

.. code-block:: shell
	
	#index alma scripti
	#!/bin/sh
	set -ex
	>index.lst
	find ./* -type f -name *bps |
		    while IFS= read file_name; do
		    	tar -xf ${file_name} bpsbuild
		    	version=$(cat bpsbuild|grep version=)
		    	name=$(cat bpsbuild|grep name=)
		      	depends=$(cat bpsbuild|grep depends=)
		       	echo "$name:$version:$depends">>index.lst
		    done
	rm -rf bpsbuild
	mkdir /output -p
	cp -rf index.lst /output 

Bu script bps paket dosyalarımızın olduğu dizinde tüm paketleri açarak içerisinden **bpsbuild** dosyalarını çıkartarak paketle ilgili bilgileri alıp **index.lst** dosyası oluşturmaktadır. istersek paketler local ortamdada index oluşturabiliriz. Bu dokümanda github üzerinde oluşturacak şekilde anlatılmıştır.Paket indeksi oluşturan **index.lst** dosyası aşağıdaki gibi olacaktır. Listede name, version ve depends(bağımlı olduğu paketler) bilgileri bulunmaktadır. Bilgilerin arasında **:** karekteri kullanılmıştır.


.. code-block:: shell

	name="glibc":version="2.38":depends=""
	name="gmp":version="6.3.0":depends="glibc,readline,ncurses"
	name="grub":version="2.06":depends="glibc,readline,ncurses"
	name="kmod":version="31":depends="glibc,zlib"


**index.lst** Dosyasını Güncelleme
..................................

**bpsupdate** dosya içeriği 

.. code-block:: shell
	
	#!/bin/sh
	curl -O /tmp/index.lst https://basitsadigitim.github.io/binary-package/index.lst
	
**index.lst** dosyamızı github üzerinden indiren scriptimiz tek bir satırdan oluşmaktadır.
Bu komut https://basitsadigitim.github.io/binary-package/index.lst adresindeki dosyayı index.lst dosyasını /tmp/index.lst konumuna indirecektir.


.. raw:: pdf

   PageBreak


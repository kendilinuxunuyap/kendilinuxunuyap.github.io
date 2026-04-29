**Depo indexleme**
++++++++++++++++++

Depo, paketlerimizin olduğu alandır. Depoda ne kadar paket varsa bunların isimleri sürüm numaraları gibi bilgiler ile adreslerini liste halinde oluşturma işlemine **depo indexleme** denir.
Depo indexlenirken genellikle bilgiler **paket derleme talimatı(klybuild)** dosyasından alınır.
Paketlerin listesi, paketler kurulurken, silinirken ve güncellenirken kullanılmaktadır.

**kly github Depo Yapma**
-------------------------

Bu doküman kullanılarak hazırlanan paketleri bilgisayarınızda bir dizinde tutabiliriz. Fakat bu çok kısıtlı bir sistem olmasına sebep olacaktır. Paketleri bir internet ortamında bir yerde saklayarak, kurmak istediğimizde internet(uzak) üzerinden kurulması daha doğru bir yöntemdir. Bu dağıtımda paketlerimizi github.com üzerinde oluşturulan bir repository üzerinden çekilmektedir. İnternetteki paketlerimizin listesi her yeni paketi yükleme sırasında güncellenmektedir. Bu işlem github hesabı üzerinden yapılmaktadır. github hakkında temel işlemler için :ref:`githubbilgi` konusunu okuyunuz.

**github üzerinde depolamak için;**

- github hesabı açılır(kendilinuxunuyap)
- github repository oluşturulur(kly-binary-packages)
- kly-binary-packages deposuna aşağıda verilen index dosyasını oluşturunuz.
- kly-binary-packages deposuna .github/workflows dizinini oluşturarak aşağıda verilen **main.yml** dosyasını oluşturunuz. **main.yml** dosyasısdaki **sh index** satırı **index** scriptimizi her githuba paket gönderdiğimizde(commit) çalışacak ve **index.lst** dosyasını oluşturacaktır.
- internet üzerinden kly-binary-packages reposunda settings->action->general->Workflow permissions->Read and write permissions  işaretlenmelidir.
- Yapılan paketler github üzerinde gönderilmelidir.

main.yml
--------

.. code-block:: shell

	#-------------------------------------------------------------------------------------------------------------
	name: CI

	on:
	  push:
		branches: [ master ]
	  schedule:
		- cron: "0 0 1 2 6"

	jobs:
		compile:
		    name: depoindex
		    runs-on: ubuntu-latest
		    steps:
		      - name: Check out the repo
		        uses: actions/checkout@v2
		      - name: Run the build process with Docker
		        uses: addnab/docker-run-action@v3
		        with:
		            image: debian:testing
		            options: -v ${{ github.workspace }}:/root -v /output:/output
		            run: |
		                cd /root
		                sh index
		      - uses: "marvinpinto/action-automatic-releases@latest"
		        with:
		            repo_token: "${{ secrets.GITHUB_TOKEN }}"
		            automatic_release_tag: "current"
		            prerelease: false
		            title: "Latest release"
		            files: |
		              /output/*



.. raw:: pdf

   PageBreak
   
**index Dosyası**
-----------------

Aşağıdaki script kly paket dosyalarımızı olduğu dizinde tek tek açarak içerisinden **klybuild** dosyalarını çıkartır. Paketle ilgili bilgileri alıp **index.lst** dosyası oluşturmaktadır. İstersek paketler local ortamdada index oluşturabiliriz. Bu dokümanda github üzerinde oluşturacak şekilde anlatılmıştır. Paket indeksi oluşturan **index.lst** dosyası aşağıdaki gibi olacaktır. Listede name, version ve depends(bağımlı olduğu paketler) bilgileri bulunmaktadır. Bilgilerin arasında **|** karekteri kullanılmıştır.

.. code-block:: shell

	#!/bin/sh
	#set -ex
	mkdir /output -p
	mkdir -p /klysource
	>index.lst
	find * -type f -name *.kly |
			while IFS= read file_name; do
				dosya="$(dirname $file_name)/klybuild"
				version=$(cat $dosya|grep version=)
				name=$(cat $dosya|grep name=)
				depends=$(cat $dosya|grep depends=)
				echo "$name|$version|$depends|$(dirname $file_name)">>index.lst
			done
	cp -rf index.lst /output

	# *****************************source files******************************
	cp -prfv ./* /klysource/

	find /klysource/* -type f -name *.kly |
			while IFS= read file_name; do
			rm -rf "$file_name"
			done
	tar -cf /output/klysourcepackage.tar /klysource/
	rm -rf /klysource


**index.lst İçeriği**
---------------------

https://github.com/kendilinuxunuyap/kly-binary-packages/releases/download/current/index.lst adresinde bulunan dosya aşağıdaki gibi liste oluşturacaktır.

.. code-block:: shell

	name="acl"|version="2.3.1"|depends="attr"|acl
	name="attr"|version="2.5.1"|depends=""|attr
	name="audit"|version='3.1.1'|depends=""|audit
	name="bash"|version="5.2.21"|depends="glibc,readline,ncurses"|bash


.. raw:: pdf

   PageBreak


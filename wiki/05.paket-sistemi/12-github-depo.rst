github Depo Yapma
-----------------

Bu doküman kullanılarak hazırlanan paketleri bilgisayarınızda bir dizinde tutabiliriz. Fakat bu çok kısıtlı bir sistem olmasına sebepp olacaktır. Paketleri bir internet ortamında bir yerde saklayarak, kurmak istediğimizde internet(uzak) üzwerinden kurulması daha doğru bir yöntemdir. Bu dokümanda hazırlanan paketler github üzerinde saklanacak şekilde anlatım yapılmakadır.

Github üzerinde depolamak için;

- github hesabı açılır(basitdagitim)
- github repository oluşturulur(kly-binary-packages)
- kly-binary-packages deposuna aşağıda verilen index dosyasını oluşturunuz.
- kly-binary-packages deposuna .github/workflows dizinini ouşturarak aşağıda verilen main.yml dosyasını oluşturunuz.
- internet üzerinden kly-binary-packages reposunda settings->action->general->Workflow permissions->Read and write permissions  işaretlenmelidir.
- Yapılan paketler github üzerinde gönderilmelidir.
index Dosyası
-------------

.. code-block:: shell

	#!/bin/sh
	#set -ex
	mkdir /output -p
	mkdir -p /bpssource
	>index.lst
	find * -type f -name *.bps |
			while IFS= read file_name; do
				dosya="$(dirname $file_name)/bpsbuild"
				version=$(cat $dosya|grep version=)
				name=$(cat $dosya|grep name=)
				depends=$(cat $dosya|grep depends=)
				echo "$name|$version|$depends|$(dirname $file_name)">>index.lst
			done
	cp -rf index.lst /output

	# *****************************source files******************************
	cp -prfv ./* /bpssource/

	find /bpssource/* -type f -name *.bps |
			while IFS= read file_name; do
			rm -rf "$file_name"
			done
	tar -cf /output/bpssourcepackage.tar /bpssource/
	rm -rf /bpssource


main.yml
--------

.. code-block:: shell

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


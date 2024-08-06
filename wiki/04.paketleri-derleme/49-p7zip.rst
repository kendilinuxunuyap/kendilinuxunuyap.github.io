p7zip
+++++

Nano, terminal tabanlı bir metin düzenleyicidir ve genellikle yeni başlayanlar için tercih edilir. Basit metin düzenleme işlemleri için idealdir ve kullanımı oldukça kolaydır. Özellikle komut satırında hızlıca metin dosyalarını açmak ve düzenlemek isteyenler için pratik bir araçtır. Nanonun kullanıcı dostu arayüzü, metin içinde gezinmeyi ve düzenlemeyi kolaylaştırır. Temel metin düzenleme işlemleri için tercih edilen bir araç olmasının yanı sıra, kısayol tuşlarıyla da hızlı erişim imkanı sunar.

Derleme
-------

.. code-block:: shell
	
    #!/usr/bin/env bash
    version="17.05"
    name="p7zip"
    depends=""
    description="Command-line file archiver with high compression ratio"
    source="https://github.com/p7zip-project/p7zip/archive/refs/tags/v${version}.tar.gz"
    groups="app.arch"
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf ${name}-${version}.tar.gz
    }
    build(){
        cd ${name}-${version}
        make 7z 7zr 7za
    }
    package(){
        make install DESTDIR=$HOME/distro/rootfs DEST_HOME=/usr
        mv $HOME/distro/rootfs/usr/lib{,64}
        sed -i "s/lib/lib64/g" $HOME/distro/rootfs/usr/bin/*
    }
    
    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı inidirir
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
    

.. raw:: pdf

   PageBreak


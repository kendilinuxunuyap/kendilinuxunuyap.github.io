liveconfig
++++++++++

Nano, terminal tabanlı bir metin düzenleyicidir ve genellikle yeni başlayanlar için tercih edilir. Basit metin düzenleme işlemleri için idealdir ve kullanımı oldukça kolaydır. Özellikle komut satırında hızlıca metin dosyalarını açmak ve düzenlemek isteyenler için pratik bir araçtır. Nanonun kullanıcı dostu arayüzü, metin içinde gezinmeyi ve düzenlemeyi kolaylaştırır. Temel metin düzenleme işlemleri için tercih edilen bir araç olmasının yanı sıra, kısayol tuşlarıyla da hızlı erişim imkanı sunar.

Derleme
-------

.. code-block:: shell
	
    #!/usr/bin/env bash
    version="11.0.4"
    name="live-config"
    depends="glibc,acl,openssl"
    description=""
    source="https://salsa.debian.org/live-team/live-config/-/archive/debian/11.0.4/live-config-debian-11.0.4.tar.gz"
    groups="sys.kernel"
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf ${name}-${version}.tar.gz
    }

    build(){
        cd ${name}-debian-${version}
        make
    }
    package(){
        make install DESTDIR=$HOME/distro/rootfs
    }
    
    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı inidirir
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
    

.. raw:: pdf

   PageBreak




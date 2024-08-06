efivar
++++++

Nano, terminal tabanlı bir metin düzenleyicidir ve genellikle yeni başlayanlar için tercih edilir. Basit metin düzenleme işlemleri için idealdir ve kullanımı oldukça kolaydır. Özellikle komut satırında hızlıca metin dosyalarını açmak ve düzenlemek isteyenler için pratik bir araçtır. Nano'nun kullanıcı dostu arayüzü, metin içinde gezinmeyi ve düzenlemeyi kolaylaştırır. Temel metin düzenleme işlemleri için tercih edilen bir araç olmasının yanı sıra, kısayol tuşlarıyla da hızlı erişim imkanı sunar.

Derleme
-------

.. code-block:: shell
	
    #!/usr/bin/env bash
    version="39"
    name="efivar"
    depends=""
    description="Tools and libraries to work with EFI variables"
    source="https://github.com/rhboot/efivar/archive/refs/tags/$version.tar.gz"
    groups="sys.libs"
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf ${name}-${version}.tar.gz
    }
    setup(){
        export ERRORS=''
        export PATH=$PATH:$HOME
        # fake mandoc for ignore extra dependency
        echo "exit 0" > $HOME/mandoc
        chmod +x $HOME/mandoc
    }
    build(){
        cd ${name}-${version}
        make
    }
    package(){
        local make_options=(
            V=1
            libdir=/usr/lib64/
            bindir=/usr/bin/
            mandir=/usr/share/man/
            includedir=/usr/include/
            )
        make DESTDIR=$HOME/distro/rootfs "${make_options[@]}" install
    }
    
    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı inidirir
    setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
    

.. raw:: pdf

   PageBreak


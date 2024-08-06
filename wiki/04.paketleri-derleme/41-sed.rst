sed
+++

sed bir akış düzenleyicisidir. Dosyalar ve string ifadeler gibi girdi akışları üzerinde temel metin işlemeyi gerçekleştirebilir. sed ile kelime ve satır arayabilir, bulabilir ve değiştirebilir, ekleyebilir ve silebilirsiniz. Karmaşık kalıpları eşleştirmenize izin veren temel ve genişletilmiş düzenli ifadeleri destekler.

Derleme
-------

.. code-block:: shell
	
    #!/usr/bin/env bash
    version="4.9"
    name="sed"
    depends="acl"
    description="Super-useful stream editor"
    source="https://ftp.gnu.org/gnu/sed/sed-$version.tar.xz"
    groups="sys.apps"
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf ${name}-${version}.tar.xz
    }
    setup(){
        cd ${name}-${version}
        ./configure --prefix=/usr \
            --libdir=/usr/lib64/
    }
    build(){
        make
    }
    package(){
        make install DESTDIR=$HOME/distro/rootfs
    }
    
    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı inidirir
    setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
    

.. raw:: pdf

   PageBreak




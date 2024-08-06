libpcre2
+++++++++

LIBPCRE2 paketi, Perl uyumlu düzenli ifade kitaplıklarının yeni neslini içerir.  Bunlar, Perl ile aynı sözdizimini kullanarak düzenli ifade modeli eşleştirmeyi uygulamak için kullanışlıdır.

Derleme
-------

.. code-block:: shell
	
    #!/usr/bin/env bash
    version="10.40"
    name="libpcre2"
    depends="readline"
    description="Perl-compatible regular expression library"
    source="https://github.com/PCRE2Project/pcre2/releases/download/pcre2-${version}/pcre2-${version}.tar.gz"
    groups="dev.libs"
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf ${name}-${version}.tar.gz
    }
    setup(){
        cd ${name}-${version}
        ./configure --prefix=/usr \
            --libdir=/lib64 \
            --enable-shared \
            --enable-static \
            --enable-pcre2-16 \
            --enable-pcre2-32 \
            --enable-jit \
            --enable-pcre2test-libreadline 
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




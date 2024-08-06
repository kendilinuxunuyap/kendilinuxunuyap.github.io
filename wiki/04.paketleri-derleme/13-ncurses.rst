ncurses
+++++++

ncurses, Linux işletim sistemi için bir programlama kütüphanesidir. Bu kütüphane, terminal tabanlı kullanıcı arayüzleri oluşturmak için kullanılır. ncurses, terminal ekranını kontrol etmek, metin tabanlı menüler oluşturmak, renkleri ve stil özelliklerini ayarlamak gibi işlevlere sahiptir.

ncurses, kullanıcıya metin tabanlı bir arayüz sağlar ve terminal penceresinde çeşitli işlemler gerçekleştirmek için kullanılabilir. Örneğin, bir metin düzenleyici, dosya tarayıcısı veya metin tabanlı bir oyun gibi uygulamalar ncurses kullanarak geliştirilebilir.

Derleme
-------

.. code-block:: shell
	
	#!/usr/bin/env bash
    version="6.4"
    name="ncurses"
    depends="glibc"
    description="Console display library"
    source="https://ftp.gnu.org/pub/gnu/ncurses/${name}-${version}.tar.gz"
    groups="sys.libs"
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf ${name}-${version}.tar.gz
    }
    setup(){
            ${name}-${version}/configure --prefix=/usr --libdir=/lib64 --with-shared --disable-tic-depends --with-versioned-syms  --enable-widec --with-cxx-binding --with-cxx-shared --enable-pc-files --without-ada
    }
    build(){
            make
    }
    package(){
            make install DESTDIR=$HOME/distro/rootfs
            cd $HOME/distro/rootfs/lib64
            ln -s libncursesw.so.6 libtinfow.so.6
            ln -s libncursesw.so.6 libtinfo.so.6
            ln -s libncursesw.so.6 libncurses.so.6
    }

    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı inidirir
    setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
    
.. raw:: pdf

   PageBreak


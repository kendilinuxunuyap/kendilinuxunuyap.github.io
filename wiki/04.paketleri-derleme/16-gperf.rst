gperf
+++++

gperf, C++ ile yazılmış mükemmel bir karma fonksiyon üretecidir.  n öğeli, kullanıcı tarafından belirlenen bir anahtar kelime kümesi W'yi mükemmel bir karma fonksiyonu F'ye dönüştürür. F, W'deki anahtar kelimeleri benzersiz bir şekilde 0..k aralığına eşler, burada k >= n-1.  Eğer k = n-1 ise F minimal mükemmel bir kıyım fonksiyonudur.  gperf, 0..k öğeli bir statik arama tablosu ve bir çift C işlevi oluşturur.  Bu işlevler, arama tablosunda en fazla bir sonda kullanarak belirli bir karakter dizisinin W'de bulunup bulunmadığını belirler.

Derleme
-------

.. code-block:: shell

    #!/usr/bin/env bash
    version="3.1"
    name="gperf"
    depends=""
    description="Perfect hash function generator."
    source="https://ftp.gnu.org/gnu/gperf/gperf-$version.tar.gz"
    groups="sys.apps"
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf ${name}-${version}.tar.gz
    }
    setup(){
        ${name}-${version}/configure --prefix=/usr --libdir=/usr/lib64
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


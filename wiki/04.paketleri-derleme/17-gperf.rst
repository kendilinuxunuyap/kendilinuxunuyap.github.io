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
    BUILDDIR="$HOME/distro/build" #Derleme yapılan dizin
    DESTDIR="$HOME/distro/rootfs" #paketin yükleneceği sistem konumu
    
    initsetup(){
		mkdir -p  $BUILDDIR #derleme dizini yoksa oluşturuluyor
		rm -rf $BUILDDIR/* #içeriği temizleniyor
		cd $BUILDDIR #dizinine geçiyoruz
		wget ${source}
		dowloadfile=$(ls|head -1)
		filetype=$(file -b --extension $dowloadfile|cut -d'/' -f1)
		if [ "${filetype}" == "???" ]; then unzip  ${dowloadfile}; else tar -xvf ${dowloadfile};fi
		director=$(find ./* -maxdepth 0 -type d)
		mv $director ${name}-${version};
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
    
    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı indirir
    setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.

Paket adında(ncurses) istediğiniz bir konumda bir dizin oluşturun ve dizin içine giriniz. Yukarı verilen script kodlarını build adında bir dosya oluşturup içine kopyalayın ve kaydedin. Daha sonra build scriptini çalıştırın. Nasıl çalıştırılacağı aşağıdaki komutlarla gösterilmiştir. Aşağıda gösterilen komutları paket için oluşturulan dizinin içinde terminal açarak çalıştırınız.


.. code-block:: shell
	
	chmod 755 build
	./build


.. raw:: pdf

   PageBreak


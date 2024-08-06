openssl
+++++++

coreutils için gerekli olan paket.

OpenSSL, açık kaynaklı bir kriptografik kütüphanedir ve genellikle ağ iletişimi güvenliği için kullanılır. SSL/TLS protokollerini uygulamak, şifreleme, dijital sertifikalar oluşturma ve doğrulama gibi işlemleri gerçekleştirmek için yaygın olarak tercih edilir. Özellikle web sunucuları, e-posta sunucuları ve diğer ağ uygulamaları için güvenli iletişim sağlamak amacıyla kullanılır. OpenSSL, Linux sistemlerinde sıkça kullanılan bir araçtır ve güvenli veri iletimi için önemli bir rol oynar.

Derleme
-------

.. code-block:: shell
	
    #!/usr/bin/env bash
    version="3.2.0"
    name="openssl"
    depends="glibc,zlib"
    description="Toolkit for Transport Layer Security (TLS)"
    source="https://www.openssl.org/source/${name}-${version}.tar.gz"
    groups="dev.libs"
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf ${name}-${version}.tar.gz
    }
    setup(){
        cd ${name}-${version} # Kaynak kodun içine giriliyor

        ./config --prefix=/usr  \
            --openssldir=/etc/ssl \
            --libdir=/usr/lib64  \
            shared  \
            zlib-dynamic
    }
    build(){
        make
    }
    package(){
        make install DESTDIR=$HOME/distro/rootfs
        cd $HOME/distro/rootfs

        [ -w /etc/ssl ] || {
            printf '%s\n' "${0##*/}: root required to update cert." >&2
            exit 1
        }

        cd /etc/ssl && {
            wget -O cacert.pem https://curl.haxx.se/ca/cacert.pem
            mv -f cacert.pem cert.pem
            printf '%s\n' "${0##*/}: updated cert.pem"
        }
    }
    
    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı inidirir
    setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
    

.. raw:: pdf

   PageBreak


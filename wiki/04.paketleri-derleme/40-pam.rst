pam
+++

Linux PAM paketi, uygulama programlarının kullanıcıların kimliğini nasıl doğruladığını kontrol etmek için yerel sistem yöneticisi tarafından kullanılan Takılabilir Kimlik Doğrulama Modüllerini içerir.

Derleme
-------

.. code-block:: shell
	
    #!/usr/bin/env bash
    version="1.6.0"
    name="pam"
    depends="libtirpc,libxcrypt,libnsl,audit"
    description="PAM (Pluggable Authentication Modules) library"
    source="https://github.com/linux-pam/linux-pam/releases/download/v$version/Linux-PAM-$version.tar.xz"
    groups="sys.libs"
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
            --sbindir=/usr/sbin \
            --libdir=/usr/lib64 \
            --enable-securedir=/usr/lib64/security \
            --enable-static \
            --enable-shared \
            --disable-nls \
            --disable-selinux \
            --disable-db
    }
    build(){
        make
    }
    package(){
        make install DESTDIR=$HOME/distro/rootfs
        chmod +s $HOME/distro/rootfs/usr/sbin/unix_chkpwd
    }
    
    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı inidirir
    setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
    

.. raw:: pdf

   PageBreak





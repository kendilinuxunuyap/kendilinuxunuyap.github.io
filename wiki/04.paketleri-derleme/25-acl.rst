acl
+++

coreutils için gerekli olan paket.

ACL (Access Control List), dosya sistemlerinde veya ağ cihazlarında erişim kontrolünü yönetmek için kullanılan bir mekanizmadır. ACL'ler, belirli kullanıcıların veya kullanıcı gruplarının belirli dosya veya kaynaklara erişim düzeylerini tanımlamak için kullanılır. Bu, dosyalara veya kaynaklara erişim izinlerini hassas bir şekilde kontrol etmeyi sağlar. Örneğin, bir dosyaya sadece belirli kullanıcıların yazma izni vermek için ACL'ler kullanılabilir. Bu şekilde, güvenlik ve erişim kontrolü daha ayrıntılı bir şekilde yapılabilmektedir. Linux sistemlerinde, ACL'leri yönetmek için setfacl ve getfacl gibi komutlar kullanılır. Bu komutlar sayesinde dosya veya dizinlerin ACL yapılandırmaları kolayca düzenlenebilir ve denetlenebilir.

Derleme
--------

.. code-block:: shell
	
    #!/usr/bin/env bash
    version="2.3.1"
    name="acl"
    depends="attr"
    description="The acl package contains utilities to administer Access Control Lists"
    source="https://download.savannah.nongnu.org/releases/acl/${name}-${version}.tar.xz"
    groups="sys.apps"
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf ${name}-${version}.tar.xz
    }
    setup(){
        cd ${name}-${version} # Kaynak kodun içine giriliyor
        ./configure --prefix=/ --libdir=/usr/lib64
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


libcap
++++++

coreutils için gerekli olan paket.

libcap, Linux işletim sisteminde yetkilendirme (authorization) işlemlerini yönetmek için kullanılan bir kütüphanedir. Bu kütüphane, özel yetkilendirme işlemlerini gerçekleştirmek için kullanıcıların ve uygulamaların ihtiyaç duyduğu yetkilendirmeleri yönetir. Özellikle, düşük seviyeli ağ ve sistem işlemlerinde güvenlik seviyesini artırmak için kullanılır. libcap, özel yetkilendirme gerektiren işlemleri gerçekleştirmek için kullanıcıların ayrıcalıklarını sınırlamak ve denetlemek için önemli bir araçtır. Bu sayede, sistemdeki güvenlik açıklarının sömürülmesini engellemeye yardımcı olur.

Derleme
-------

.. code-block:: shell
	
    #!/usr/bin/env bash
    version="2.69"
    name="libcap"
    depends="glibc,acl,openssl"
    description="shell ve network copy"
    source="https://mirrors.edge.kernel.org/pub/linux/libs/security/linux-privs/libcap2/${name}-${version}.tar.xz"
    groups="net.misc"
    initsetup(){
        mkdir -p  $HOME/distro/build #derleme dizini yoksa oluşturuluyor
        rm -rf $HOME/distro/build/* #içeriği temizleniyor
        cd $HOME/distro/build #dizinine geçiyoruz
        wget ${source}
        tar -xvf ${name}-${version}.tar.xz
    }

    _common_make_options=(
        CGO_CPPFLAGS="$CPPFLAGS"
        CGO_CFLAGS="$CFLAGS"
        CGO_CXXFLAGS="$CXXFLAGS"
        CGO_LDFLAGS="$LDFLAGS"
        CGO_REQUIRED="1"
        GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
        GO_BUILD_FLAGS="-ldflags '-compressdwarf=false -linkmode=external'"
        )

    setup(){
        cd ${name}-${version} # Kaynak kodun içine giriliyor

        cap_opts=(
            "${_common_make_options[@]}"
            SUDO=""
            prefix=/usr
            KERNEL_HEADERS=/usr/include
            lib=lib64
            RAISE_SETFCAP=no
            PAM_CAP=yes
            )
    }
    build(){
        make ${cap_opts[@]} DYNAMIC=yes
    }
    package(){
        make "${_common_make_options[@]}"  \
            DESTDIR="$HOME/distro/rootfs" \
            RAISE_SETFCAP=no \
            prefix=/usr \
            lib=lib64 \
            sbindir=bin \
            install
    }
    
    initsetup       # initsetup fonksiyonunu çalıştırır ve kaynak dosyayı inidirir
    setup           # setup fonksiyonu çalışır ve derleme öncesi kaynak dosyaların ayalanması sağlanır.
    build           # build fonksiyonu çalışır ve kaynak dosyaları derlenir.
    package         # package fonksiyonu çalışır, yükleme öncesi ayarlamalar yapılır ve yüklenir.
    

.. raw:: pdf

   PageBreak


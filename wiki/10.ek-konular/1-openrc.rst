
openrc Servis Yönetimi
++++++++++++++++++++++

Servisi Başlangıca Ekleme
-------------------------

rc-update add servis default

Servisi Başlangıçtan Kaldırma
-----------------------------

rc-update del servis default


Servislerin Çalışma Sırası
--------------------------

Servislerin çalışma sırasını **rc-update -v** ile öğrenebiliriz.
Bazen servisin başka servisin çalışmasını beklemesi gerekebilir. Aşağıda **sshd** çalıştıkdan sonra çalışacaktır.

depend() {
        after sshd
} 

Bazen servisin başka başka bir servise ihtiyacı olabilir. Aşağıda bu servisin çalışması için **net** servisine ihtiyacı vardır.

depend() {
        need net
} 

Servislerin çalışma sırasını alfabetik olarak yapmaktadır. adlandırma yaparken buna dikkat etmek gerekir.
Yani **axxxx** ile başlayan bir dosyayı **bxxxx** dosyasına göre daha önce çalıştıracaktır.

Basit Servis Komutlarını Çalıştırma
-----------------------------------

**/etc/local.d/** dizini içine basit betikler konabilir.

#!/sbin/openrc-run
description="load modules runsystemd"

name="runsystemda"
command="/etc/local.d/runsystemd"
command_args=""
pidfile="/run/runsystemd.pid"
command_background=true
depend() {
        after lightdm
}


Yukarıdaki **runsystemda** servisi **/etc/local.d/runsystemd** dosyasnı çalıştırmaktadır.

#/etc/local.d/runsystemd
#!/bin/sh
chmod 755 -R /run/systemd


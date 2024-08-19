internet
++++++++

Linux sistemlerinde internete bağlanmak için genellikle birkaç temel pakete ihtiyaç duyarsınız. Öncelikle, ağ arayüzünüzü yönetmek için net-tools veya iproute2 paketleri gereklidir. Bu paketler, ağ ayarlarını yapılandırmanıza ve ağ durumunu kontrol etmenize olanak tanır.

Ayrıca, DHCP üzerinden otomatik IP alımı için dhclient veya dhcpcd gibi DHCP istemcilerine ihtiyacınız olabilir. Eğer statik bir IP yapılandırması yapacaksanız, ifconfig veya ip komutları ile ayarları manuel olarak yapabilirsiniz.

Son olarak, internet bağlantınızı test etmek için ping ve curl gibi araçlar da faydalıdır. Örnek bir DHCP istemcisi kullanarak internete bağlanmak için aşağıdaki komutu kullanabilirsiniz:

language-bash

sudo dhclient eth0

Bu komut, eth0 arayüzü üzerinden DHCP sunucusundan IP adresi almanızı sağlar.

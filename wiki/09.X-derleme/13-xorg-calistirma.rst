**Xorg Çalıştırma**
++++++++++++++++++++

Xorg Yapılandırma Dosyası
-------------------------

Xorg, genellikle /etc/X11/xorg.conf dosyasını kullanır. Eğer bu dosya yoksa, Xorg varsayılan ayarlarla çalışacaktır. Ancak, özel ayarlar yapmak istiyorsanız, bu dosyayı oluşturmanız gerekebilir. Aşağıdaki komut ile bir yapılandırma dosyası oluşturabilirsiniz:

.. code-block:: shell
	
	sudo X -configure

Bu komut, xorg.conf.new adında bir dosya oluşturacaktır. Bu dosyayı /etc/X11/xorg.conf olarak kopyalayabilirsiniz:

.. code-block:: shell
	
	sudo cp ~/xorg.conf.new /etc/X11/xorg.conf

Xorg'u Elle Başlatma
--------------------

Xorg'u elle başlatmak için terminalde aşağıdaki komutu kullanabilirsiniz:

.. code-block:: shell
	
	startx

Bu komut, varsayılan kullanıcı arayüzünü başlatacaktır. Eğer belirli bir pencere yöneticisi veya masaüstü ortamı ile başlatmak istiyorsanız, ~/.xinitrc dosyasını düzenlemeniz gerekebilir. Örneğin, openbox kullanmak istiyorsanız, dosyanın içeriği şöyle olmalıdır:

.. code-block:: shell

	exec openbox-session

Hata Ayıklama
-------------

Eğer Xorg başlatılamıyorsa, hata ayıklamak için aşağıdaki komutu kullanarak log dosyalarını kontrol edebilirsiniz:

.. code-block:: shell
	
	cat /var/log/Xorg.0.log

Bu dosya, Xorg'un başlatılması sırasında oluşan hataları ve uyarıları içerecektir. Hataları inceleyerek sorunu çözmeye çalışabilirsiniz.

Xorg'u Durdurma
---------------

Xorg'u durdurmak için, terminalde Ctrl + Alt + Backspace tuş kombinasyonunu kullanabilirsiniz. Bu, X sunucusunu kapatacaktır.

.. raw:: pdf

   PageBreak


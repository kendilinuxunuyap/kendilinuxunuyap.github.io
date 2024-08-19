polkit
++++++

Polkit, Linux sistemlerinde yetkilendirme ve erişim kontrolü sağlayan bir altyapıdır. Polkit kuralları, belirli kullanıcıların veya kullanıcı gruplarının belirli işlemleri gerçekleştirmesine izin vermek veya engellemek için kullanılır.

Polkit kurallarını eklemek için aşağıdaki adımları izleyebilirsiniz:

Polkit kurallarının bulunduğu dizine gidin. Genellikle **/etc/polkit-1/rules.d/** dizininde bulunur.
Bir metin düzenleyici kullanarak yeni bir dosya oluşturun veya mevcut bir dosyayı düzenleyin. Dosya adı, genellikle **XX-name.rules** formatında
olmalıdır. Burada XX, kuralların uygulanma sırasını belirten bir sayıdır ve name ise dosyanın açıklamasını temsil eder.
Dosyaya aşağıdaki gibi bir polkit kuralı ekleyin:

.. code-block:: shell

	polkit.addRule(function(action, subject) {
	    if (action.id == "org.example.customaction" && subject.user == "username") {
		return polkit.Result.YES;
	    }
	});

Yukarıdaki örnekte, **org.example.customaction** adlı bir eylem için **username** kullanıcısına izin veriliyor. Bu kuralı ihtiyaçlarınıza göre düzenleyebilirsiniz.

Dosyayı kaydedin ve düzenlediğiniz kuralların etkili olması için Polkit servisini yeniden başlatın. Bu işlem için aşağıdaki komutu kullanabilirsiniz:

.. code-block:: shell

	sudo systemctl restart polkit

Artık polkit kurallarınız etkinleştirilmiş olmalı ve belirlediğiniz yetkilendirmeler uygulanmalıdır.

Polkit kuralları, sistem yöneticilerinin belirli işlemleri kontrol etmesine ve kullanıcıların erişimini yönetmesine olanak tanır. Bu sayede sistem güvenliği ve yetkilendirme düzeyi daha iyi kontrol edilebilir.

Tüm Uygulamalarda İzin Verme
----------------------------

.. code-block:: shell

	polkit.addRule(function(action, subject) {
			return polkit.Result.YES;
	});

Bir Gruba İzin Verme
--------------------

.. code-block:: shell

	polkit.addRule(function(action, subject) {
	    if (subject.isInGroup("test")) {
	      return polkit.Result.YES;
	  }
	});

Bir Grub-User-Uygulamaya İzin Verme
-----------------------------------
.. code-block:: shell

	 polkit.addRule( 
	  function(action,subject)
	  {
	    if ( (action.id == "org.freedesktop.policykit.exec") &&
		 (action.lookup("user") == "root") &&
		 (action.lookup("program") == "/path/to/script") &&
		 (subject.isInGroup("someGroup") ) )
	      return polkit.Result.YES;

	    return polkit.Result.NOT_HANDLED;
	  }
	);


.. raw:: pdf

   PageBreak

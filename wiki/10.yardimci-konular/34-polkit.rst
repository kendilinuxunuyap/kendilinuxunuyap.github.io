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

Uygulamaya İzin Verme
----------------------

/usr/share/polkit-1/rules.d/test.rules veya /etc/polkit-1/rules.d/test.rules konumlu dosya ile /test uygulamasına rootyetkisi verilebilir.

.. code-block:: shell

	polkit.addRule(function(action, subject) {
		if (action.id == "org.freedesktop.policykit.exec" &&
		    action.lookup("program") == "/test") {
		    return polkit.Result.YES;
		}
	});

Uygulamaya İzin Verme
----------------------

/usr/share/polkit-1/actions/test.policy konumlu dosya ile /usr/bin/python3 /test.py uygulamasına rootyetkisi verilebilir.

.. code-block:: shell

	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE policyconfig PUBLIC "-//freedesktop//DTD PolicyKit Policy 1.0//EN"
	"http://www.freedesktop.org/standards/PolicyKit/1.0/policykit-policy.dtd">
	<policyconfig>
	  <action id="org.example.test">
		<message>Bu scripti çalıştırmak için yetki gereklidir.</message>
		<defaults>
		  <allow_any>no</allow_any>
		  <allow_inactive>no</allow_inactive>
		  <allow_active>yes</allow_active>
		</defaults>
		 <annotate key="org.freedesktop.policykit.exec.path">/usr/bin/python3</annotate>
	  <annotate key="org.freedesktop.policykit.exec.argv1">/test.py</annotate>
	  </action>
	</policyconfig>

.. raw:: pdf

   PageBreak

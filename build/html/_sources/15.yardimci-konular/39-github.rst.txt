.. _githubbilgi:
**github**
++++++++++

GitHub üzerinde yeni bir depo açmak oldukça basit bir işlemdir. Aşağıdaki adımları takip ederek hızlıca kendi deponuzu oluşturabilirsiniz:


  
**GitHub Hesabınıza Giriş Yapın**
---------------------------------

GitHub ana sayfasına gidin ve hesabınıza giriş yapın. Eğer bir hesabınız yoksa, öncelikle bir hesap oluşturmalısınız.

.. image:: /_static/images/github0.png
  :width: 600
  
.. image:: /_static/images/github1.png
  :width: 600
  
  
**Yeni Depo Oluşturma**
-----------------------

 Sağ üst köşede bulunan "+" simgesine tıklayın ve "New repository" seçeneğini seçin.

.. image:: /_static/images/github2.png
  :width: 600

.. raw:: pdf

   PageBreak
   
  
**Depo Bilgilerini Girin**
--------------------------

 Açılan sayfada, depo adını (repository name) ve isteğe bağlı olarak bir açıklama (description) girin. Depo özel (private) veya herkese açık (public) olarak ayarlanabilir.

.. image:: /_static/images/github3.png
  :width: 600
 

 
**İlk Dosyayı Oluşturma**
-------------------------

 "Initialize this repository with a README" seçeneğini işaretleyerek, depo oluşturulduğunda otomatik olarak bir README dosyası oluşturabilirsiniz.

 .. image:: /_static/images/github5.png
  :width: 600
 
.. raw:: pdf

   PageBreak
   
**github Varsayılan Dal Ayarı:**
--------------------------------

githubda varsayılan olarak eskilede master, yeni sürümlerde main kullanılmaktadır. Projelermizde ve burad kullanılan yapılarda **master** kullanıldığı için aşağıda görülduğü gibi varsalılan dalı  **master** yapıyoruz.

.. image:: /_static/images/github-master.png
  :width: 600
  

**github komut Kullanımı**
--------------------------

.. image:: /_static/images/github-command.png
  :width: 600
  
github'ın çalışma mantığı yukarıda verilen resimde görüldüğü gibidir. Komutları kullanırken resimdeki gibi işlemleri yapmalıyız.

github'a göndermek için; **add --> commit --> push** kullanmalıyız.

github'dan indirmek için; **clone veya pull**  kullanmalıyız.

.. raw:: pdf

   PageBreak
   

**Sık Kullanılan github Komutları**
+++++++++++++++++++++++++++++++++++

**Depoyu Yerele indirme(Clone)**
--------------------------------

.. code-block:: shell

	git clone https://github.com/kullaniciadi/depoadi.git

- **Yerel Depoda Dosya Ekleme:**

.. code-block:: shell

	git add .

- **Yerel Depoda Değişiklik Etiketi Yapma:**

.. code-block:: shell

	git commit -m "ilk adım"

- **Yerel Depodaki Bilgileri Guthuba Gönderme:**

.. code-block:: shell

	git push origin master

- **Yerel Depodaki Bilgileri Guthuba Gönderme Reddedilirse:**

.. code-block:: shell

	git push origin master --force

- **Yerelde github'daki Depoyu clone Yapmadan Oluşturma:**

.. code-block:: shell

	cd proje
	git init
	git config --global user.name "name"
	git config --global user.email "name@gmail.com"
	git add README.md
	git add .
	git commit -m "first commit"
	git remote -v      # push ve pull yapılacak adresleri görmek için kullanılır
	git remote add origin https://github.com/userName/repoName.git
	git push -u origin master

**Dal(Branch):**
----------------

Dal projenin birden fazla kişi ile yapılmasında veya yeni özellikler eklenmek istediğinde projenin bir kopyası ile çalışma gerektirir. Aşağıda dal işlemleri içinkomutlar verilmiştir.

**Yeni Dal Oluşturmak, Seçmek ve Yeni Dalı github'a Göndermek:**

.. code-block:: shell

    # Dalları Görmek kullanılır Seçili olan dalın rengi farklı olur ve önünde * olur
    git branch
    # Dal oluşturmak
    git checkout yeni
    # Yeni dalı uzak adrese göndermek
    git push --force origin master komutu  yerine
    # Uzak adresimizde master dalı dışında yeni dalımızda oluşacaktır...
    git push --force origin yeni komutunu veriyoruz.


.. raw:: pdf

   PageBreak
   
**github token Oluşturma Kullanma**
-----------------------------------

github kullanırken dosya gondermek(**commit**) için kullanıcı adı ve parola ister. Burada hesap parolası yerine **token** kullanılır. Yeni bir **token** için aşağıdaki işlem adımlarını yapmalıyız.

**Settings Seçilir;**

.. image:: /_static/images/github-token1.png
  :width: 600

**Developper Settings Seçilir;**

.. image:: /_static/images/github-token2.png
  :width: 600

**Generate New Token Seçilir;**

.. image:: /_static/images/github-token5.png
  :width: 600

.. raw:: pdf

   PageBreak
   
**Erişim yapabileceği alanlar Seçilir;**
 
.. image:: /_static/images/github-token6.png
  :width: 600

**token Kullanmak üzere kullanmak üzere saklanır. Bu ekrandan sonra sadece silebiliriz. Göremeyiz kopyalayamayız.**

.. image:: /_static/images/github-token7.png
  :width: 600



.. raw:: pdf

   PageBreak

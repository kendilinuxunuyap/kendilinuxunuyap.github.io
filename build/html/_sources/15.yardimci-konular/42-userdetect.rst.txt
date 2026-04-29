**X11 Kullanıcısının Tespiti**
++++++++++++++++++++++++++++++

Linux ortamında masaütündeyken sudo ile script çalıştırıldığında masaütünü açtığımız kullanıcının tespiti aşağıdaki kodla yapılabilir.

.. code-block:: shell

	#!/bin/bash
	
	# Display adı
	display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -1)" 
	
	# Display kullanıcısı 
	user=$(who | grep "(${display})" | awk '{print $1}')                      
	
	echo $user $display
	
	
.. raw:: pdf

   PageBreak



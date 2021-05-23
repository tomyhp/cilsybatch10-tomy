#!/bin/bash

jawaban="Y"

read -p "Apakah kamu yakin akan menghapus webserver ? (Y/n) " pilih;

if [ $pilih == $jawaban ];
then   
	 echo "Menyiapkan penghapusan  Web server"    
	 sudo service apache2 php php-mysql stop    
	 echo "Melakukan penghapusan Webserver"   
	 sudo apt-get purge apache2 php php-mysql   
	 echo "Melakukan penghapusan Database Server"   
	 sudo apt-get purge mysql-server
	 sudo apt-get autoremove
 	 sudo apt-get autoclean   
	 echo "Penghapusan Selesai"   
	 exit 0
else     echo "Penghapusan dibatalkan"    
	 exit 1
fi

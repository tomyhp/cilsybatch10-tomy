#!/bin/bash

echo "=========== Update box =============="
sudo apt update
echo "====== Instalasi Webserver =========="
sudo apt-get install -y unzip apache2 php php-mysql
echo "====== Intstalasi Database =========="
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'
sudo apt-get install -y mysql-server
echo "====== Konfigurasi Database ======="
sudo mysql -u root --password=password << EOF
CREATE DATABASE IF NOT EXISTS dbsosmed;
CREATE USER IF NOT EXISTS 'devopscilsy'@'localhost' IDENTIFIED BY '1234567890';
GRANT ALL PRIVILEGES ON *.* to 'devopscilsy'@'localhost';
FLUSH PRIVILEGES;
EOF
sudo mysql -u devopscilsy --password=1234567890 dbsosmed < dump.sql
echo "=== Hapus file pada direktori /var/www/html ========================"
sudo rm -rf /var/www/html/*
echo "=== Clone repo social media pesbuk dan buat direktori =============="
sudo mkdir /var/www/html/pesbuk
sudo git clone https://github.com/sdcilsy/sosial-media /var/www/html/pesbuk/
echo "========== Clone repo landing-page dan buat direktori ============="
sudo mkdir /var/www/html/landing-page/
sudo git clone https://github.com/sdcilsy/landing-page /var/www/html/landing-page/
echo "========== Download wordpress ==============="
sudo wget https://wordpress.org/latest.zip
echo "=========== Unzip files wordpress ============="
sudo unzip latest.zip
sudo mkdir /var/www/html/wordpress
sudo mv wordpress/* /var/www/html/wordpress


#!/usr/bin/env bash

sudo apt-get install libapache2-mod-php5 -y # PHP5+Apache
sudo a2enmod rewrite # Enabling mod_rewrite
sudo a2enmod headers # Enabling mod_headers
sudo aptitude install php5-gd # GD lib

#Apache config
rm /etc/apache2/sites-available/*
rm /etc/apache2/sites-enabled/*
ln -s /vagrant/apache2/site.conf /etc/apache2/sites-available/site.conf
ln -s /vagrant/apache2/site.conf /etc/apache2/sites-enabled/site.conf

#MySQL
DB_PASS="1234";
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password "${DB_PASS}
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password "${DB_PASS}
sudo apt-get install php5-mysql mysql-server mysql-client -y 

service apache2 restart
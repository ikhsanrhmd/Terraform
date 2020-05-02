#!/bin/bash
sudo mysql -u root -e "CREATE USER 'user_db'@'%' IDENTIFIED BY 'rahasia';"
sudo mysql -u root -e "GRANT ALL ON *.* TO 'user_db'@'%';"
sudo mysql -u root -e "flush privileges;"
sudo mysql -u user_db -p 'rahasia' -e "create database wordpress;"
sudo systemctl restart mariadb


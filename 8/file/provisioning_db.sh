sudo mysql -u root -e "CREATE USER 'username'@'%' IDENTIFIED BY 'password';"
sudo mysql -u root -e "GRANT ALL ON *.* TO 'username'@'%';"
sudo mysql -u root -e "flush privileges;"
sudo mysql -u username -p'password' -e "create database databasename;"
sudo mysql -u username -p'password' < /home/ubuntu/pendekar.sql
sudo systemctl restart mariadb

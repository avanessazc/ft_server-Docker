set -e
#!/bin/bash
service nginx start
service mysql start
service php7.3-fpm start

#wordpress
curl -LO https://wordpress.org/latest.tar.gz
tar xvf latest.tar.gz
rm -f latest.tar.gz
mv wordpress var/www
mv /tmp/wp-config.php var/www/wordpress

#phpMyAdmin
curl -LO https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-english.tar.gz
tar xvf phpMyAdmin-4.9.2-english.tar.gz
rm -f phpMyAdmin-4.9.2-english.tar.gz
mv phpMyAdmin-4.9.2-english var/www/phpMyAdmin

#nginx
cp /tmp/myngnix.conf /etc/nginx/sites-available/localhost
rm -f /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

#MySql
# Access mysql shell and execute following command
mysql -e "CREATE DATABASE wordpress;GRANT ALL ON *.* TO 'user'@'localhost' IDENTIFIED BY 'password';FLUSH PRIVILEGES;"

#ssl
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out localhost.crt -keyout localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=ayzapata"
mv localhost.crt /etc/nginx/ssl
mv localhost.key /etc/nginx/ssl

nginx -t

chown -R www-data /var/www/*
chmod -R 755 /var/www/*

service nginx restart
/bin/bash

#!/bin/bash

# Configure apache to listen on port 8080
sed -i "s/Listen 80/Listen 8080/" /etc/apache2/ports.conf
sed -i "s/VirtualHost *:80/VirtualHost *:8080/" /etc/apache2/sites-enabled/000-default.conf
echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Adminer directory
adm_dir=/var/www/html/adminer

# Create adminer directory
mkdir -p $adm_dir

# Download adminer.php file
wget https://github.com/vrana/adminer/releases/download/v4.7.3/adminer-4.7.3-mysql.php

# Rename file
mv ./adminer-4.7.3-mysql.php $adm_dir/index.php

# Change permissions
chmod +x $adm_dir/index.php

exec "$@"

#!/bin/bash

# Configure apache to listen on port 8080
sed -i "s/Listen 80/Listen 8080/" /etc/apache2/ports.conf
sed -i "s/VirtualHost *:80/VirtualHost *:8080/" /etc/apache2/sites-enabled/000-default.conf

# Create adminer-X.X.X.php file
cd /usr/share/adminer
php compile.php

# Create the apache adminer configuration file
adminer=$(ls /usr/share/adminer | grep adminer-[0-9].[0-9].[0-9].php)
echo "Alias /adminer.php /usr/share/adminer/$adminer" | tee /etc/apache2/conf-available/adminer.conf

# Activate configuration
cd /etc/apache2/conf-available/
a2enconf adminer.conf

# Reload apache webserver
service apache2 reload

exec "$@"

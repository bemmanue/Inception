#!/bin/bash

# Install wordpress command line interface
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Make the file executable and move it to somewhere in PATH
# to use WP-CLI from the command line by typing wp
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Download wordpress
wp core download --allow-root		\
	--path=/var/www/wordpress	\
	--locale=ru_RU

# Create config file
wp config create --allow-root		\
	--path=/var/www/wordpress	\
	--dbname=$MYSQL_DATABASE	\
	--dbuser=$MYSQL_USER		\
	--dbpass=$MYSQL_PASSWORD	\
	--dbhost=$MYSQL_HOST

# Install wordpress
wp core install --allow-root		\
	--path=/var/www/wordpress	\
	--url=$DOMAIN_NAME		\
	--title=$TITLE			\
	--admin_user=$USER		\
	--admin_password=$USER_PASSWORD	\
	--admin_email=$USER_EMAIL

echo "WordPress is installed!"

exec "$@"

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

# Install redis-cache
wp plugin install redis-cache		\
	--allow-root			\
	--path=/var/www/wordpress	\
	--activate

# Configure wp-config.php for redis
wp config set --allow-root --path=/var/www/wordpress --anchor="/**#@+" --separator="\n\n" WP_REDIS_HOST redis
wp config set --allow-root --path=/var/www/wordpress --anchor="/**#@+" --separator="\n\n" --raw WP_REDIS_PORT 6379
wp config set --allow-root --path=/var/www/wordpress --anchor="/**#@+" --separator="\n\n" --raw WP_REDIS_TIMEOUT 1
wp config set --allow-root --path=/var/www/wordpress --anchor="/**#@+" --separator="\n\n" --raw WP_REDIS_READ_TIMEOUT 1
wp config set --allow-root --path=/var/www/wordpress --anchor="/**#@+" --separator="\n\n" --raw WP_REDIS_DATABASE 0

# Launch redis-cache
wp redis enable --allow-root		\
	--path=/var/www/wordpress

exec "$@"

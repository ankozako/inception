#!/bin/bash

if echo "${WP_ADMIN_USER}" | grep -qi "admin"; then
	echo "ERROR: WP_ADMIN_USER must not contain 'admin'"
	exit 1
fi

DB_PASSWORD=$(cat /run/secrets/db_password)
WP_ADMIN_PASSWORD=$(grep WP_ADMIN_PASSWORD /run/secrets/credentials | cut -d= -f2)
WP_USER_PASSWORD=$(grep WP_USER_PASSWORD /run/secrets/credentials | cut -d= -f2)
until mysqladmin ping -h mariadb -u"${MYSQL_USER}" -p"${DB_PASSWORD}" --silent; do
	sleep 1
done
if [ ! -f /var/www/html/wp-config.php ]; then
	wp core download --allow-root --path=/var/www/html

	wp config create --allow-root --path=/var/www/html \
		--dbname="${MYSQL_DATABASE}" \
		--dbuser="${MYSQL_USER}" \
		--dbpass="${DB_PASSWORD}" \
		--dbhost=mariadb 

	wp core install --allow-root --path=/var/www/html \
		--url="${DOMAIN_NAME}" \
		--title="${WP_TITLE}" \
		--admin_user="${WP_ADMIN_USER}" \
		--admin_password="${WP_ADMIN_PASSWORD}" \
		--admin_email="${WP_ADMIN_EMAIL}"

	wp user create "${WP_USER}" "${WP_USER_EMAIL}" \
		--role=editor \
		--user_pass="${WP_USER_PASSWORD}" \
		--allow-root \
		--path=/var/www/html
fi

exec php-fpm8.2 -F

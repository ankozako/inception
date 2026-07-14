#!/bin/bash
if [ ! -d /var/lib/mysql/mysql ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
	mysqld_safe --datadir=/var/lib/mysql &
	until mysqladmin ping >/dev/null 2>&1; do
		sleep 1
	done

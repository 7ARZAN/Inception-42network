# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/24 14:11:56 by tarzan            #+#    #+#              #
#    Updated: 2024/09/27 00:06:27 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

SOCKET_FILE=/var/run/mysqld/mysqld.sock

printInfo(){
	echo -e "\e[34m[ INFO ]\e[0m $1"
}

printSuccess(){
	echo -e "\e[32m[ SUCCESS ]\e[0m $1"
}

printError(){
	echo -e "\e[31m[ ERROR ]\e[0m $1"
}

exec_mysql_cmd(){
	mysql -u root -p "$MYSQL_ROOT_PASSWORD" -e "$1" > /dev/null 2>&1
	if [[ $? -ne 0 ]]; then
		printError "MySQL command failed: $1"
	else
		printSuccess "MySQL command executed successfully: $1"
	fi
}

if [ -S "$SOCKET_FILE" ]; then
	printInfo "mariaDB is already running, proceeding with the initialization.."

	exec_mysql_cmd "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
	exec_mysql_cmd "CREATE USER IF NOT EXISTS '$MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
	exec_mysql_cmd "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;"
	exec_mysql_cmd "FLUSH PRIVILEGES;"

	printInfo "Shutting down mariaDB.."
	mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown > /dev/null 2>&1
else
	printInfo "mariaDB is not running, starting the initialization.."

	mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null 2>&1
	if [[ $? -ne 0 ]]; then
		printError "Failed to init mariaDB"
		exit 1
	else
		printSuccess "mariaDB initialized successfully"
	fi

	printInfo "Starting mariaDB in the background.."
	mysqld_safe --user=mysql --datadir=/var/lib/mysql > /dev/null 2>&1 & sleep 5

	while [ ! -S "$SOCKET_FILE" ]; do
		printInfo "Waiting for mariaDB to start.."
		sleep 1
	done

	exec_mysql_cmd "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
	exec_mysql_cmd "CREATE USER IF NOT EXISTS '$MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
	exec_mysql_cmd "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;"
	exec_mysql_cmd "FLUSH PRIVILEGES;"

	printInfo "Shutting down mariaDB.."
	mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown > /dev/null 2>&1
fi

printSuccess "Initialization completed successfully"
exec mysqld_safe --user=mysql --datadir=/var/lib/mysql

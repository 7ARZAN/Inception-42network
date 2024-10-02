# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/24 14:11:56 by tarzan            #+#    #+#              #
#    Updated: 2024/09/30 17:22:41 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

echo	"Database Name: $DB_NAME"

if [ ! -d "/var/lib/mysql/wpdb" ]; then
	{
		echo "FLUSH PRIVILEGES;"
		echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
		echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
		echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
		echo "FLUSH PRIVILEGES;"
	} > init.sql

	mariadbd --user=mysql --bootstrap < init.sql
	rm init.sql
	echo "Database created successfully!"
else
	echo "Error: Database already exists."
fi

exec	"$@"

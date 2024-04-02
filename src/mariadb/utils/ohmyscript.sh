# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ohmyscript.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/13 05:23:43 by tarzan            #+#    #+#              #
#    Updated: 2024/02/21 19:26:56 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

service mysql start

echo "CREATE DATA BASE IF NOT EXITS $db_name;" > db1.sql
echo "CREATE USER IF NOT EXITS '$db_user'@'localhost' IDENTIFIED BY '$db_password';" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'localhost';" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$db_password';" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql -u root --password=$db_password < db1.sql

kill $(pgrep mysql)

mysqld_safe

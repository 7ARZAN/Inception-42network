# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/24 14:11:56 by tarzan            #+#    #+#              #
#    Updated: 2024/10/24 17:35:06 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

source /run/secrets/database-credentials

cat << EOF > init.sql
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
CREATE USER IF NOT EXISTS 'stats'@'%';
GRANT PROCESS ON *.* TO 'stats'@'%';
DELETE FROM mysql.user WHERE User='';
FLUSH PRIVILEGES;
EOF

mysqld --user=mysql --datadir=/data > /dev/null 2>&1 &

sleep 5

mysql -u root < init.sql

kill $(jobs -p)

rm -f init.sql

cat << 'EOF' > entrypoint.sh
#!/bin/sh
exec mysqld --user=mysql --datadir=/data --port=3306 --bind-address=0.0.0.0 --skip-networking=0
EOF

chmod +x entrypoint.sh

exec  entrypoint.sh

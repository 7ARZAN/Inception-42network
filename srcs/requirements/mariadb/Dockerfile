# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:41:47 by tarzan            #+#    #+#              #
#    Updated: 2024/10/02 07:15:30 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.19

RUN		apk add --no-cache mariadb mariadb-client && \
		sed -i 's#^bind-address\s*=.*#bind-address = 0.0.0.0#' /etc/my.cnf && \
		mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && \
		mysql_install_db --user=mysql --datadir=/var/lib/mysql 

COPY 		./utils/entrypoint.sh /entrypoint.sh

RUN 		chmod +x /entrypoint.sh

ENTRYPOINT 	[ "sh", "/entrypoint.sh" ]

EXPOSE		3306

CMD		["mysqld", "--user=mysql", "--bind-address=0.0.0.0"]

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:41:47 by tarzan            #+#    #+#              #
#    Updated: 2024/09/26 23:44:47 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.15.0

RUN		apk update && apk add --no-cache \
		mariadb mariadb-client 

COPY		/conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY		utils/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN		chmod +x /usr/local/bin/entrypoint.sh

#RUN		chmod 777 /usr/local/bin/entrypoint.sh

ENTRYPOINT	[ "entrypoint.sh" ]

EXPOSE		3306

STOPSIGNAL	SIGQUIT

VOLUME		[ "/var/lib/mysql" ]

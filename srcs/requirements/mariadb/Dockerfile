# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:41:47 by tarzan            #+#    #+#              #
#    Updated: 2024/10/24 17:49:29 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.19

COPY		./utils/entrypoint.sh /

RUN		apk update && apk add --no-cache mariadb mariadb-client && \
		install -do mysql -g mysql /data /run/mysqld && \
		mariadb-install-db --user=mysql --datadir=/data && \
		chmod +x entrypoint.sh

EXPOSE		3306/tcp

ENTRYPOINT	[ "sh", "entrypoint.sh" ]

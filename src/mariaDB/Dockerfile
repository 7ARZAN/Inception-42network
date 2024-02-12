# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: elakhfif <elakhfif@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/12 09:24:48 by elakhfif          #+#    #+#              #
#    Updated: 2024/02/12 10:32:06 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk update && apk add mariadb mariadb-client openrc

COPY	./srcs/entrypoint.sh /PATH/TO/ENTRYPOINT_FILE

COPY	./srcs/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE	3306

ENTRYPOINT	["sh", "/PATH/TO/ENTRYPOINT_FILE"]


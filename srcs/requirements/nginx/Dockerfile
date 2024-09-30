# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:41:29 by tarzan            #+#    #+#              #
#    Updated: 2024/09/30 16:43:19 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.19

RUN		apk update && \
		apl add --no-cache nginx openssl && \
		mkdir -p /etc/nginx/ssl /www && \
		ln -s /dev/stdout /var/log/nginx/access.log && \
		openssl genrsa -out /etc/nginx/ssl/localhost.key 2048 && \
		openssl req -batch -new -key /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.csr && \
		openssl x509 -req -days 365 -in /etc/nginx/ssl/localhost.csr -signkey /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt && \
		chmod 600 /etc/nginx/ssl/*

COPY		/configuration/default.conf /etc/nginx/default.conf

ENTRYPOINT	["nginx", "-g", "daemon off;"]

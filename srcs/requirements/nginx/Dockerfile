# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:41:29 by tarzan            #+#    #+#              #
#    Updated: 2024/10/02 07:14:48 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.19

RUN		apk update && \
		apk add --no-cache nginx openssl && \
		mkdir -p /etc/nginx/ssl /var/www/html/ && \
		ln -s /dev/stdout /var/log/nginx/access.log && \
		openssl genrsa -out /etc/nginx/ssl/nginx.key 2048 && \
		openssl req -batch -new -key /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.csr && \
		openssl x509 -req -days 365 -in /etc/nginx/ssl/nginx.csr -signkey /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt && \
		chmod 600 /etc/nginx/ssl/*

COPY		/configuration/default.conf /etc/nginx/nginx.conf

EXPOSE		80 443

ENTRYPOINT	["nginx", "-g", "daemon off;"]

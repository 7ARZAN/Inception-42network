# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:41:29 by tarzan            #+#    #+#              #
#    Updated: 2024/10/20 18:02:17 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.19

RUN		apk update && apk add --no-cache nginx openssl && \
		mkdir -p /etc/nginx/ssl /www && openssl genrsa --out /etc/nginx/ssl/nginx.key 2048 && \
		openssl req -batch -new -key /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.csr && \
		openssl x509 -req -days 365 -in /etc/nginx/ssl/nginx.csr \
		-signkey /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt

COPY		/configuration/default.conf /etc/nginx/http.d/default.conf

EXPOSE		443/tcp

ENTRYPOINT	[ "nginx", "-g", "daemon off;" ]

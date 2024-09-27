# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:44:27 by tarzan            #+#    #+#              #
#    Updated: 2024/09/27 01:55:24 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		debian:bookworm

RUN		apt-get update && apt-get install -y curl php-fpm && mkdir -p /run/php

COPY		./configuration/www.conf /etc/php/8.0/fpm/pool.d/www.conf

COPY		./utils/entrypoint.sh /entrypoint.sh

RUN		chmod +x /entrypoint.sh && mv entrypoint.sh /usr/local/bin/

EXPOSE		6969

ENTRYPOINT	[ "entrypoint.sh" ]

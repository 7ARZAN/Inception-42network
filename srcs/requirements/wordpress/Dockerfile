# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:41:05 by tarzan            #+#    #+#              #
#    Updated: 2024/09/27 00:12:01 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:bookworm

RUN		apt-get update && apt-get install -y php-fpm \
		php-mysql \
		curl \
		mariadb-client \
		redis \
		php-redis \
		grep 

RUN		mkdir -p /run/php 

COPY		configuration/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY		configuration/wp-config.php /

EXPOSE		9000

COPY		./utils/entrypoint.sh /usr/bin/entrypoint.sh

RUN		chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT	[ "entrypoint.sh" ]

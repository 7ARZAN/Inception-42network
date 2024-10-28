# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:44:27 by tarzan            #+#    #+#              #
#    Updated: 2024/10/28 04:59:12 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#FROM		alpine:3.19
#
#RUN		apk update && apk add php php-fpm wget procps
#
#WORKDIR		/www/html 
#
#COPY		./utils/entrypoint.sh /
#
#RUN		chmod +x /entrypoint.sh
#
#ENTRYPOINT	[ "/bin/sh", "/entrypoint.sh" ]
#
#CMD		[ "php-fpm",  "-F" ]

FROM debian:bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    php \
    php-mysqli \
    php-fpm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /www/html

COPY ./utils/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

CMD ["php-fpm", "-F"]

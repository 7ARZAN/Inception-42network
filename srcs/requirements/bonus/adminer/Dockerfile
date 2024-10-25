# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:44:27 by tarzan            #+#    #+#              #
#    Updated: 2024/10/02 07:17:43 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.19

RUN		apk add --no-cache php8 php8-fpm php8-mysqli wget 

WORKDIR		/var/www/html

COPY		./utils/entrypoint.sh /entrypoint.sh

RUN		chmod +x /entrypoint.sh

ENTRYPOINT	[ "/bin/sh", "-c", "/entrypoint.sh && php-fpm8 -F" ]

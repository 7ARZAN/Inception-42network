# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:44:27 by tarzan            #+#    #+#              #
#    Updated: 2024/10/25 18:35:14 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.19

RUN		apk add --no-cache php php-fpm php-mysqli wget 

WORKDIR		/var/www/html

COPY		./utils/entrypoint.sh /entrypoint.sh

RUN		chmod +x /entrypoint.sh

ENTRYPOINT	[ "sh", "/entrypoint.sh && php-fpm8 -F" ]

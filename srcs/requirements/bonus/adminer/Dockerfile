# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:44:27 by tarzan            #+#    #+#              #
#    Updated: 2024/10/26 05:47:47 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.19

RUN		apk add --no-cache wget php php-mysqli procps

WORKDIR		/www/html 

COPY		./utils/entrypoint.sh /

RUN		chmod +x /entrypoint.sh

ENTRYPOINT	[ "/bin/sh", "/entrypoint.sh" ]

CMD		[ "php", "-S", "0.0.0.0:80" ]

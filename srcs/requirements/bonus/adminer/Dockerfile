# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:44:27 by tarzan            #+#    #+#              #
#    Updated: 2024/10/29 19:17:04 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		debian:bookworm

RUN		apt update -y && apt install php php-mysqli wget -y

WORKDIR		/www 

COPY		./utils/entrypoint.sh /

RUN		chmod +x /entrypoint.sh

ENTRYPOINT	[ "sh", "/entrypoint.sh" ]

CMD		[ "php",  "-S", "0.0.0.0:8888" ]

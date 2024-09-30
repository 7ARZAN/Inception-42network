# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:44:36 by tarzan            #+#    #+#              #
#    Updated: 2024/09/30 17:41:46 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.19

RUN		apk add --no-cache vsftpd vim 

COPY		./utils/entrypoint.sh /entrypoint.sh

RUN		chmod +x /init.sh

EXPOSE		21

ENTRYPOINT	[ "/bin/sh", "-c", "/entrypoint.sh && /usr/sbin/vsftpd" ]

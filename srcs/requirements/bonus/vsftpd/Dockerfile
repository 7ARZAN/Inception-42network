# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:44:36 by tarzan            #+#    #+#              #
#    Updated: 2024/10/25 03:29:23 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.19

RUN		apk add --no-cache vsftpd vim 

COPY		./utils/entrypoint.sh /entrypoint.sh

COPY		./configuration/vsftpd.conf /vsftpd.conf

RUN		chmod +x /entrypoint.sh

EXPOSE		21/tcp 5000-5050/tcp

ENTRYPOINT	[ "sh", "entrypoint.sh" ]

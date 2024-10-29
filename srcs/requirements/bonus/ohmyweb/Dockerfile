# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/27 02:10:14 by tarzan            #+#    #+#              #
#    Updated: 2024/10/29 19:39:59 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.19

RUN	apk add --no-cache lighttpd

COPY	./assembly/  /var/www/localhost/htdocs/

EXPOSE	80/tcp

CMD	[ "lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf" ]


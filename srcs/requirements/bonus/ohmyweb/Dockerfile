# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/27 02:10:14 by tarzan            #+#    #+#              #
#    Updated: 2024/10/27 20:22:56 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.19

RUN	apk add --no-cache lighttpd

COPY	./assembly/  /var/www/localhost/htdocs/

EXPOSE	80

CMD	[ "lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf" ]


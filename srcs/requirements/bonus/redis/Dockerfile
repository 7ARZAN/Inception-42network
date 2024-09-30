# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:44:55 by tarzan            #+#    #+#              #
#    Updated: 2024/09/30 17:45:00 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.19

RUN		apk add --no-cache redis && \
		sed -i 's/^daemonize yes/daemonize no/' /etc/redis/redis.conf && \
    		sed -i 's/^bind 127.0.0.1 -::1/bind 0.0.0.0/' /etc/redis/redis.conf && \
    		sed -i 's/^protected-mode yes/protected-mode no/' /etc/redis/redis.conf

EXPOSE 		6379

ENTRYPOINT	[ "redis-server", "/etc/redis/redis.conf" ]

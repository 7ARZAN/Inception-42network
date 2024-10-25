# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:44:55 by tarzan            #+#    #+#              #
#    Updated: 2024/10/25 03:24:59 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.19

RUN		apk update && apk add --no-cache redis

EXPOSE		6379/tcp

ENTRYPOINT	[ "redis-server", "--protected-mode", "no", "--bind", "0.0.0.0", \
			"--maxmemory", "50mb", "--maxmemory-policy", "allkeys-lru"]

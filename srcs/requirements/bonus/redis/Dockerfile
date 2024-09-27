# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:44:55 by tarzan            #+#    #+#              #
#    Updated: 2024/09/24 14:18:27 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:bookworm

RUN	apt-get update && apt-get install -y redis

COPY	./utils/entrypoint.sh /entrypoint.sh

RUN	chmod +x /entrypoint.sh && mv entrypoint.sh /usr/bin/entrypoint.sh

EXPOSE	6379

ENTRYPOINT	[ "entrypoint.sh" ]


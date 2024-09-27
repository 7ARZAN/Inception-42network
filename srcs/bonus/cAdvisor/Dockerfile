# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/24 14:28:49 by tarzan            #+#    #+#              #
#    Updated: 2024/09/27 02:08:32 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.17

RUN	apk -U upgrade && apk add --no-cache wget bash

RUN	wget -O /usr/local/bin/cadvisor https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor && \
	chmod +x /usr/local/bin/cadvisor

CMD	[ "bash", "-c", "echo -e \"\033[1;32mStarting cadvisor...\" && /usr/local/bin/cadvisor" ]

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/24 14:28:49 by tarzan            #+#    #+#              #
#    Updated: 2024/09/30 17:59:47 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.19

RUN	apk -U upgrade && apk add --no-cache wget bash 

RUN	wget -O /usr/local/bin/cadvisor https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor && \
	chmod +x /usr/local/bin/cadvisor

EXPOSE	8080

CMD	[ "bash", "-c", "echo -e \"\033[1;32mStarting cAdvisor...\" && /usr/local/bin/cadvisor" ]

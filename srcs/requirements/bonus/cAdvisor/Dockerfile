# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/24 14:28:49 by tarzan            #+#    #+#              #
#    Updated: 2024/10/27 19:27:58 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

RUN	apt update -y && apt install wget -y 

RUN	wget https://github.com/google/cadvisor/releases/download/v0.37.0/cadvisor && \ 
	chmod +x cadvisor

CMD	[ "./cadvisor" ]

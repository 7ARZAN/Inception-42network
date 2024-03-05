# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: elakhfif <elakhfif@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/12 09:24:37 by elakhfif          #+#    #+#              #
#    Updated: 2024/03/05 16:00:09 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

RUN	apt -y update && apt install -y ngingx && apt install openssl -y && apt install -y vim && apt install -y curl

COPY	./srcs/ohmyscript.sh /

CMD	["bash", "-c", "./ohmyscript.sh"]

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/23 06:05:14 by tarzan            #+#    #+#              #
#    Updated: 2024/03/25 09:05:28 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y \
	nginx \
	openssl \
	php7.3-fpm \
	mariadb-server \
	php-mysql \
	wget \
	vim

RUN mkdir /var/www/localhost && chown -R www-data:www-data /var/www/localhost

COPY srcs/localhost /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/ && \
	rm /etc/nginx/sites-enabled/default

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt -subj "default"

COPY srcs/init.sh /tmp/

RUN chmod +x /tmp/init.sh && /tmp/init.sh

EXPOSE 80 443 3306

CMD ["nginx", "-g", "daemon off;"]


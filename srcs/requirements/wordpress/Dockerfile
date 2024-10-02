# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:41:05 by tarzan            #+#    #+#              #
#    Updated: 2024/10/02 19:25:36 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.19

RUN		apk update && apk add --no-cache php82-fpm php82-mysqli && \
		mkdir -p /var/www/html

RUN		if ! getent group www-data > /dev/null; then \
			addgroup -S www-data; \
		fi && \
		if ! getent passwd www-data > /dev/null; then \
			adduser -S www-data -G www-data; \
		fi 

COPY		configuration/www.conf /etc/php82/php-fpm.d/

ADD		https://wordpress.org/latest.zip latest.zip

RUN		unzip latest.zip && \
		rm -rf latest.zip && \
		mv wordpress/* /var/www/html && \
		chown -R www-data:www-data /var/www/html && \
		chmod -R 755 /var/www/html/

EXPOSE		9000

ENTRYPOINT	[ "php-fpm82", "--allow-to-run-as-root", "-F" ]

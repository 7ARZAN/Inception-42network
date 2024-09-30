# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:41:05 by tarzan            #+#    #+#              #
#    Updated: 2024/09/30 16:55:04 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.19

RUN		apk update && apk add --no-cache php82-fpm php82-mysqli && \
		mkdir -p /www && \
		chown -R www-data:www-data /www && \
		chmod -R 755 /www

COPY		configuration/www.conf /etc/php82/php-fpm.d/

ADD		https://wordpress.org/latest.zip latest.zip

RUN		unzip latest.zip && \
		rm -rf latest.zip && \
		mv wordpress /www/ && \
		chown -R www-data:www-data /www/wordpress && \
		chmod -R 755 /www/wordpress

EXPOSE		9000

ENTRYPOINT	[ "php-fpm82", "--allow-to-rub-as-root", "-F" ]

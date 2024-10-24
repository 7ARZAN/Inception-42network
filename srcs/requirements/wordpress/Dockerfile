# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:41:05 by tarzan            #+#    #+#              #
#    Updated: 2024/10/24 17:51:55 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.19

COPY		./utils/entrypoint.sh /

ADD		https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp

RUN		apk update && apk add --no-cache \
		php82-fpm php82-mysqli php82-phar \
		php82-iconv php82-mbstring && \
		chmod +x /usr/local/bin/wp /entrypoint.sh && \
		wp core download --path=/www && \
		rm -rf /root/.wp-cli && \
		ln -s /dev/stdout /var/log/php82/access.log && \
		ln -s /dev/stderr /var/log/php82/error.log

COPY		./configuration/www.conf /etc/php82/php-fpm.d/

COPY		./configuration/wp-config.php /www
    
EXPOSE		9000/tcp
    
ENTRYPOINT	[ "sh", "entrypoint.sh" ]

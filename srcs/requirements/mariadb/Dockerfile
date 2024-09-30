# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:41:47 by tarzan            #+#    #+#              #
#    Updated: 2024/09/30 17:19:30 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.19

# Install MariaDB and remove unnecessary files to keep the image small
RUN		apk add --no-cache mariadb mariadb-client && \
		sed -i 's#^bind-address\s*=.*#bind-address = 0.0.0.0#' /etc/my.cnf && \
		mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# Copy the initialization script
COPY		./utils/entrypoint.sh /

# Set the entrypoint to the initialization script and start the MariaDB server
ENTRYPOINT	[ "sh", "-c", "/entrypoint.sh && mysqld --user=mysql --bind-address=0.0.0.0" ]


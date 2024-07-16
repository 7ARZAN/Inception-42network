# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/13 05:19:37 by tarzan            #+#    #+#              #
#    Updated: 2024/02/21 19:26:03 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# lets talk about mariadb server for a moment :
# mariaDB is a fork of MySQL, it is a relational database management system (RDBMS) that provides an SQL interface for accessing data.
# It is built on the knowledge of its predecessor, MySQL, and is intended to remain free and open-source software under the GNU General Public License.
# okey, now lets talk about the dockerfile of mariadb server :
# we will start by pulling the debian buster image, then we will update the package list and install the mariadb server.
# we will copy the 50-server.cnf file to the /etc/mysql/mariadb.conf.d/ directory, this file contains the configuration of the mariadb server. (we will talk about it later)
#what is 50-server.cnf file ? is a file that contains the configuration of the mariadb server, it is used to configure the server.
# we will copy the ohmyscript.sh file to the root directory, this file will start the mariadb server and create a database and a user.
# we will run the ohmyscript.sh file to start the mariadb server and create a database and a user.

#conf.d files with .d extension are used to configure the server, they are used to add additional configuration to the server.
#the .d extension is used to indicate that the file is a directory, and the files inside it are used to configure the server.

FROM debian:buster

RUN apt-get update -y && apt-get install mariadb-server -y

COPY ./srcs/utils/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./srcs/utils/ohmyscript.sh /

CMD ["bash", "-c", "ohmyscript.sh"]

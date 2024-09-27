# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/24 14:15:27 by tarzan            #+#    #+#              #
#    Updated: 2024/09/27 01:47:29 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

printInfo(){
	echo -e "\e[34m[ INFO ]\e[0m $1"
}

printSuccess(){
	echo -e "\e[32m[ SUCCESS ]\e[0m $1"
}

printError(){
	echo -e "\e[31m[ ERROR ]\e[0m $1"
}

if [ ! -f "/etc/redis/redis.conf" ]; then
	cp /etc/redis/redis.conf /tmp/redis.conf.tmp
	sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis/redis.conf > /dev/null 2>&1
	sed -i "s|# maxmemory <bytes>|maxmemory 256mb|g" /etc/redis/redis.conf > /dev/null 2>&1
	sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf > /dev/null 2>&1

fi

printInfo "Starting Redis Server .."
redis-server --protected-mode no > /dev/null 2>&1
if [ $? -eq 0 ]; then
	printSuccess "Redis Server Started Successfully"
else
	printError "Failed to Start Redis Server"
fi

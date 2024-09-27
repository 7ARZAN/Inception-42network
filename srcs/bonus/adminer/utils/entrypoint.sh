# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/24 14:21:30 by tarzan            #+#    #+#              #
#    Updated: 2024/09/27 02:03:59 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

printInfo(){
	echo -e "\e[34m[ INFO ]\e[0m $1"
}

printSuccess(){
	echo -e "\e32m[ SUCCESS ]\e[0m $1"
}

printError(){
	echo -e "\e31m[ ERROR ]\e[0m $1"
}

printInfo "Downloading Adminer .."
curl -L -o /adminer-4.8.1.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php > /dev/null 2>&1

if [[ $? -ne 0 ]]; then
	printError "Failed to download Adminer"
else
	printSuccess "Adminer downloaded successfully"
	mv /adminer-4.8.1.php /var/www/html/adminer-4.8.1.php
	if [[ $? -ne 0 ]]; then
		printError "Failed to move Adminer to /var/www/html"
	else
		printSuccess "Adminer moved successfully to /var/www/html"
	fi
fi

#navigate to the web directory
cd /var/www/html || { printError "Failed to navigate to /var/www/html"; exit 1; }

printInfo "Updating PHP-FPM configuration .."
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
	printError "Failed to update PHP-FPM configuration"
else
	printSuccess "PHP-FPM configuration updated successfully"
fi

printInfo "Starting PHP-FPM service .."
/usr/sbin/php-fpm7.3 -F -R > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
	printError "Failed to start PHP-FPM service"
else
	printSuccess "PHP-FPM service started successfully"
fi

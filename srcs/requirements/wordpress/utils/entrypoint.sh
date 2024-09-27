# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/24 14:14:03 by tarzan            #+#    #+#              #
#    Updated: 2024/09/27 00:42:15 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh


INITIAL_FILE="/var/www/html/.container_initialized"
CONFIG_FILE="/var/www/html/wp-config.php"

printInfo() {
    echo -e "\e[34m[ INFO ]\e[0m $1"
}

printSuccess(){
	echo -e "\e[32m[ SUCCESS ]\e[0m $1"
}

printError(){
	echo -e "\e[31m[ ERROR ]\e[0m $1"
}

update_wpConfig(){
	if grep -q "define('DB_NAME', 'wordpress');" $CONFIG_FILE; then
		printInfo "Updating wp-config.php with the database credentials"
		sed -i "s/define('DB_NAME', 'wordpress');/define('DB_NAME', '$MYSQL_DATABASE');/g" $CONFIG_FILE > /dev/null 2>&1
		sed -i "s/define('DB_USER', 'wordpress');/define('DB_USER', '$MYSQL_USER');/g" $CONFIG_FILE > /dev/null 2>&1
		sed -i "s/define('DB_PASSWORD', 'wordpress');/define('DB_PASSWORD', '$MYSQL_PASSWORD');/g" $CONFIG_FILE > /dev/null 2>&1
		sed -i "s/define('DB_HOST', 'localhost');/define('DB_HOST', '$MYSQL_HOST');/g" $CONFIG_FILE > /dev/null 2>&1
		
		if [[ $? -eq 0 ]]; then
			printSuccess "wp-config.php updated successfully"
		else
			printError "Failed to update wp-config.php"
		fi
	else
		printInfo "wp-config.php already has the database credentials"
	fi
}

#function to start php-fpm
start_services(){
	printInfo "Starting services"
	/usr/sbin/php-fpm7.3 -F > /dev/null 2>&1
	if [[ $? -eq 0 ]]; then
		printSuccess "PHP-FPM started successfully"
	else
		printError "Failed to start PHP-FPM"
	fi
}

while ! mysqladmin ping -h"$MYSQL_HOST" --silent > /dev/null 2>&1; do
    printInfo "Waiting for MySQL to be ready..."
    sleep 2
done

printInfo "getting wp-cli.phar .."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null 2>&1

if [[ $? -eq 0 ]]; then
	printSuccess "wp-cli.phar downloaded successfully"
else
	printError "Failed to download wp-cli.phar"
fi

printInfo "Changing permissions for wp-cli.phar .."
chmod +x wp-cli.phar > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
	printSuccess "Permissions changed successfully"
else
	printError "Failed to change permissions"
fi

printInfo "Moving wp-cli.phar to /usr/local/bin/wp .."
mv wp-cli.phar /usr/local/bin/wp > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
	printSuccess "wp-cli.phar moved successfully"
else
	printError "Failed to move wp-cli.phar"
fi

#Downloading wordpress core
printInfo "Downloading WordPress core .."
wp core download --path=/var/www/html --allow-root > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
	printSuccess "WordPress core downloaded successfully"
else
	printError "Failed to download WordPress core"
fi

#go into the web root directory
cd /var/www/html || { printError "Failed to change directory to /var/www/html"; exit 1; }

#remove the default wp-config-sample.php file
printInfo "Removing wp-config-sample.php .."
rm wp-config-sample.php > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
	printSuccess "wp-config-sample.php removed successfully"
else
	printError "Failed to remove wp-config-sample.php"
fi

printInfo "Moving wp-config.php to /var/www/html .."
mv /wp-config.php /var/www/html/wp-config.php > /dev/null 2>&1 #if something went wrong, the wp-config.php file will be copied to the root directory of the container
if [[ $? -eq 0 ]]; then
	printSuccess "wp-config.php moved successfully"
else
	printError "Failed to move wp-config.php"
fi

#update wp-config.php with the database credentials
printInfo "Updating wp-config.php with the database credentials .."
if [[ ! -n "$MYSQL_DATABASE" ]]; then
	sed -i "s/db/$MYSQL_DATABASE/g" /var/www/html/wp-config.php > /dev/null 2>&1
	if [[ $? -eq 0 ]]; then
		printSuccess "wp-config.php updated successfully"
	else
		printError "Failed to update wp-config.php"
	fi
else
	printError "MYSQL_DATABASE is not set in the environment variables"
fi

if [[ ! -n "$MYSQL_USER" ]]; then
	sed -i "s/user/$MYSQL_USER/g" /var/www/html/wp-config.php > /dev/null 2>&1
	if [[ $? -eq 0 ]]; then
		printSuccess "wp-config.php updated successfully"
	else
		printError "Failed to update wp-config.php"
	fi
else
	printError "MYSQL_USER is not set in the environment variables"
fi

if [[ ! -n "$MYSQL_PASSWORD" ]]; then
	sed -i "s/password/$MYSQL_PASSWORD/g" /var/www/html/wp-config.php > /dev/null 2>&1
	if [[ $? -eq 0 ]]; then
		printSuccess "wp-config.php updated successfully"
	else
		printError "Failed to update wp-config.php"
	fi
else
	printError "MYSQL_PASSWORD is not set in the environment variables"
fi

if [[ ! -n "$MYSQL_HOST" ]]; then
	sed -i "s/host/$MYSQL_HOST/g" /var/www/html/wp-config.php > /dev/null 2>&1
	if [[ $? -eq 0 ]]; then
		printSuccess "wp-config.php updated successfully"
	else
		printError "Failed to update wp-config.php"
	fi
else
	printError "MYSQL_HOST is not set in the environment variables"
fi

#installing wordpress
printInfo "Installing WordPress .."
wp core install --url="$WORDPRESS_URL" --title="$WORDPRESS_TITLE" --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="$WORDPRESS_ADMIN_EMAIL" --allow-root > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
	printSuccess "WordPress installed successfully"
else
	printError "Failed to install WordPress"
fi

#creating a new wp admin
printInfo "Creating a new WordPress admin .."
wp user create "$WORDPRESS_ADMIN_USER" "$WORDPRESS_ADMIN_EMAIL" --role=administrator --user_pass="$WORDPRESS_ADMIN_PASSWORD" --allow-root > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
	printSuccess "WordPress admin created successfully"
else
	printError "Failed to create WordPress admin"
fi

printInfo "Creating a new WordPress user .."
wp user create "$WORDPRESS_USER" "$WORDPRESS_USER_EMAIL" --role=author --user_pass="$WORDPRESS_USER_PASSWORD" --allow-root > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
	printSuccess "WordPress user created successfully"
else
	printError "Failed to create WordPress user"
fi

#update php-fpm configuration
printInfo "Updating PHP-FPM configuration .."
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
	printSuccess "PHP-FPM configuration updated successfully"
else
	printError "Failed to update PHP-FPM configuration"
fi

#enable redis cache
printInfo "Enabling Redis cache .."
wp redis enable --force --allow-root > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
	printSuccess "Redis cache enabled successfully"
else
	printError "Failed to enable Redis cache"
fi

#mark the container as initialized
printInfo "The container has been initialized"
touch $INITIAL_FILE

start_services

printInfo "the entrypoint script has finished its execution"

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/24 13:48:26 by tarzan            #+#    #+#              #
#    Updated: 2024/09/26 23:30:18 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!bin/bash

printInfo(){
	echo -e "\e[34m[ INFO ]\e[0m $1"
}

printSuccess(){
	echo -e "\e[32m[ SUCCESS ]\e[0m $1"
}

printError(){
	echo -e "\e[31m[ ERROR ]\e[0m $1"
}

printInfo "Starting script to configure SSL and nginx .."

# Check if the domain name is set or not and print the appropriate message
printInfo "Checking if DOMAIN_NAME is set .."
if [[ -z "$DOMAIN_NAME" ]]; then
	printError "Error: DOMAIN_NAME is not set"
else
	printInfo "DOMAIN_NAME is set to $DOMAIN_NAME"
fi

# Check if the private key path is set or not and print the appropriate message
printInfo "Checking if Private Key Path is set .."
if [[ -z "$PRIV_KEY" ]]; then
	printError "Error: PRIV_KEY (Private Key Path) is not set"
else
	printInfo "Private Key Path is set to $PRIV_KEY"
fi

# Check if the certificate path is set or not and print the appropriate message
printInfo "Checking if Certificate Path is set .."
if [[ -z "$CERTIF" ]]; then
	printError "Error: CERTIF (Certificate Path) is not set"
else
	printInfo "Certificate Path is set to $CERTIF"
fi

printInfo "Requesting self-signed certificate for $DOMAIN_NAME .."
# Generate self-signed certificate using openssl and store it in the specified path [CERTIF]
openssl	req -nodes -new -x509 \
	-keyout "$PRIV_KEY" \
	-out "$CERTIF" \
	-subj "/C=MA/ST=Tetouan/L=Tetouan/O=1337/CN=$DOMAIN_NAME" > /dev/null 2>&

# Check if the certificate was generated successfully or not and print the appropriate message
printInfo "Checking if the self-signed certificate was generated successfully .."
if [[ $? -ne 0 ]]; then
	printError "Error: Failed to generate self-signed certificate"
else
	printSuccess "Self-signed certificate generated successfully"
fi

# Check if the certificate and private key files exist, if not print an error message
printInfo "Configuring nginx .."
if [[ -f /etc/nginx/nginx.conf ]]; then
	printInfo "nginx configuration file found at /etc/nginx/nginx.conf"
else
	printError "Error: nginx configuration file not found"
fi

# Start nginx in the foreground using the specified configuration file [nginx.conf]
printInfo "Starting nginx .."
nginx	-g "daemon off;" > /dev/null 2>&1

# Check if nginx started successfully or not and print the appropriate message
printInfo "Checking if nginx started successfully .."
if [[ $? -ne 0 ]]; then
	printError "Error: nginx failed to start"
	exit 1
else
	printSuccess "nginx started successfully"
fi

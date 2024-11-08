# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/30 17:32:07 by tarzan            #+#    #+#              #
#    Updated: 2024/10/29 19:57:17 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

echo	"Initializing Adminer setup..."

ADMINER_DIR="/www/adminer/"
ADMINER_URL="http://www.adminer.org/latest.php"
ADMINER_PATH="$ADMINER_DIR/adminer.php"

echo "Downloading Adminer..."
wget -q "$ADMINER_URL" -O adminer.php
echo "Adminer downloaded successfully!"


chmod	755 "$ADMINER_PATH"
echo	"Permissions set for Adminer."
echo	"Adminer setup completed successfully!"

mv adminer.php /www/adminer/
cd /www/adminer

exec	"$@"

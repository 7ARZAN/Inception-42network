# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/30 17:32:07 by tarzan            #+#    #+#              #
#    Updated: 2024/10/28 05:00:09 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

echo	"Initializing Adminer setup..."

ADMINER_DIR="/www"
ADMINER_URL="http://www.adminer.org/latest.php"
ADMINER_PATH="$ADMINER_DIR/adminer.php"

echo "Downloading Adminer..."
wget -q "$ADMINER_URL" -O adminer.php
echo "Adminer downloaded successfully!"

mv adminer.php /www/adminer/

chmod	755 "$ADMINER_PATH"
echo	"Permissions set for Adminer."
echo	"Adminer setup completed successfully!"

cd /www/adminer

#php -S 0.0.0.0:8888

exec	"$@"

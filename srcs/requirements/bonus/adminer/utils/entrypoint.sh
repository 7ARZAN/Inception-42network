# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/30 17:32:07 by tarzan            #+#    #+#              #
#    Updated: 2024/10/26 05:44:46 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

echo	"Initializing Adminer setup..."

ADMINER_DIR="/www/html/adminer"
mkdir	-p "$ADMINER_DIR"

ADMINER_URL="https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php"
ADMINER_PATH="$ADMINER_DIR/index.php"

if [ ! -f "$ADMINER_PATH" ]; then
	echo "Downloading Adminer..."
	wget -q "$ADMINER_URL" -O "$ADMINER_PATH"
	echo "Adminer downloaded successfully!"
else
	echo "Adminer is already installed."
fi

chmod	755 "$ADMINER_PATH"
echo	"Permissions set for Adminer."
echo	"Adminer setup completed successfully!"

exec	"$@"

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: elakhfif <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/13 04:26:29 by elakhfif          #+#    #+#              #
#    Updated: 2024/10/24 19:10:04 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

source /run/secrets/database-credentials
source /run/secrets/wordpress-credentials


keys="DB_NAME DB_USER DB_PASSWD AUTH_KEY SECURE_AUTH_KEY LOGGED_IN_KEY NONCE_KEY AUTH_SALT SECURE_AUTH_SALT LOGGED_IN_SALT NONCE_SALT DB_PREFIX"

for key in $keys; do
	value=$(eval echo \$$key)
	sed -i "s/\$$key/$value/" /www/wp-config.php
done

wp core install --path="/www" --url="$WEBSITE_HOST" --title="$WEBSITE_TITLE" \
    --admin_user="$WP_MASTER" --admin_password="$WP_MASTER_PASSWD" \
    --admin_email="$WP_MASTER_EMAIL" --skip-email

wp user create "$WP_MODERATOR" "$WP_MODERATOR_EMAIL" --role="editor" \
    --user_pass="$WP_MODERATOR_PASSWD" --path="/www"

cat << EOF > entrypoint.sh
#!/bin/sh
exec php-fpm82 --allow-to-run-as-root -F
EOF

exec php-fpm82 --allow-to-run-as-root -F

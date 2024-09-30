# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/30 17:38:39 by tarzan            #+#    #+#              #
#    Updated: 2024/09/30 17:40:48 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

echo	"Initializing FTP setup..."

if [ ! -d "/var/run/vsftpd/empty" ]; then
	mkdir -p /var/run/vsftpd/empty

	sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/' /etc/vsftpd.conf

    # Create the FTP user

    if id "$FTP_USER" &>/dev/null; then
	    echo "User $FTP_USER already exists."
    else
	    adduser -D -h /var/www/html "$FTP_USER" && \
		    echo "$FTP_USER:$FTP_PASS" | chpasswd && \
		    echo "FTP user $FTP_USER created successfully!"
    fi

    chmod	755 /home/"$FTP_USER"
    echo	"FTP setup completed!"
else
	echo	"FTP setup already completed."
fi

exec	"$@"

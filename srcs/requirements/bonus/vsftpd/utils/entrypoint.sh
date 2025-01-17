# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/30 17:38:39 by tarzan            #+#    #+#              #
#    Updated: 2024/10/30 05:02:28 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

source /run/secrets/ftp-credentials

adduser $FTP_USER -Dh /www

echo "$FTP_USER:$FTP_PASSWD" | chpasswd

exec vsftpd /vsftpd.conf

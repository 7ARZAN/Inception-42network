# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/30 17:38:39 by tarzan            #+#    #+#              #
#    Updated: 2024/10/25 19:09:08 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

source /run/secrets/ftp_credentials

adduser $FTP_USER -Dh /www

echo "$FTP_USER:$FTP_PASSWD" | chpasswd

echo -e "#!/bin/sh\n\nexec vsftpd /vsftpd.conf" > entrypoint.sh

exec vsftpd /vsftpd.conf

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/30 17:38:39 by tarzan            #+#    #+#              #
#    Updated: 2024/10/25 19:48:40 by elakhfif         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

source /run/secrets/ftp-credentials

adduser $FTP_USER -Dh /www

echo "$FTP_USER:$FTP_PASSWD" | chpasswd

echo -e "#!/bin/sh\n\nexec vsftpd /vsftpd.conf" > launch.sh

exec vsftpd /vsftpd.conf

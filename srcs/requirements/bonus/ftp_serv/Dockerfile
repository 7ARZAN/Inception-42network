# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 11:44:36 by tarzan            #+#    #+#              #
#    Updated: 2024/09/27 01:52:46 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:bookworm

ENV	FTP_USER=tarzan
ENV	FTP_PASS=Tarzan123

RUN	apt-get update && apt-get install -y vsftpd

COPY	./configuration/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN	mkdir -p /var/share/ftp

EXPOSE	21

RUN	useradd -m $FTP_USER && echo "$FTP_USER:$FTP_PASS" | chpasswd

ENTRYPOINT	[ "/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf" ]

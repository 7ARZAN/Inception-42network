# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/13 05:35:11 by tarzan            #+#    #+#              #
#    Updated: 2024/03/15 22:33:12 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#let me give you a brief explanation of what I did here 
#I used the debian image as a base image 'cause it's lightweight and has a lot of tools that I need to install nginx and openssl'
#I used the apt package manager to install the required tools and packages
#I copied the ohmyscript.sh file to the root directory of the container
#I used the CMD command to run the ohmyscript.sh file as an entrypoint
#briefly the Dockerfile is a script that contains a set of instructions and commands that will be executed by the docker daemon to build a docker image
#I hope that I was clear enough and that you understood what I did here @tarzan

FROM	debian:buster

RUN apt -y update && apt install -y nginx && apt install openssl -y && apt install -y vim && apt install -y curl

COPY ./srcs/ohmyscript.sh /

CMD ["bash", "-c", "ohmyscript.sh"]

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/13 05:18:22 by tarzan            #+#    #+#              #
#    Updated: 2024/03/25 09:08:03 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#Makefile for docker Inception project

#Variables
NAME = inception
VERSION = 1.0
DOCKER = docker
DOCKERFILE = Dockerfile
DOCKER_IMAGE = $(NAME):$(VERSION)
DOCKER_CONTAINER = $(NAME)_container
PORT = 80
PORTS = $(PORT):80
VOLUME = /var/www/html
VOLUMES = $(VOLUME)
NETWORK = bridge
NETWORKS = $(NETWORK)
ENV = AUTOINDEX=on
ENVIRONMENTS = $(ENV)

#Colors
RED = \033[0;31m
GREEN = \033[0;32m
NC = \033[0m

#Rules
all: build run

build:
	@$(DOCKER) build -t $(DOCKER_IMAGE) -f $(DOCKERFILE) .

run:
	@$(DOCKER) run -d --name $(DOCKER_CONTAINER) -p $(PORTS) -v $(VOLUMES) --network $(NETWORKS) --env $(ENVIRONMENTS) $(DOCKER_IMAGE)
	@echo "$(GREEN)$(NAME) is running on http://localhost:$(PORT)$(NC)"

stop:
	@$(DOCKER) stop $(DOCKER_CONTAINER)
	@$(DOCKER) rm $(DOCKER_CONTAINER)
	@echo "$(RED)$(NAME) has been stopped$(NC)"

clean:
	@$(DOCKER) rmi $(DOCKER_IMAGE)
	@echo "$(RED)$(NAME) image has been removed$(NC)"

fclean: clean stop

re: fclean all

.PHONY: all build run stop clean fclean re

#docker run -d --name my_nginx -p 80:80 -v /var/www/html:/usr/share/nginx/html --network bridge --env AUTOINDEX=on my_nginx:1.0

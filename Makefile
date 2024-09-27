# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarzan <elakhfif@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/13 05:18:22 by tarzan            #+#    #+#              #
#    Updated: 2024/09/27 23:37:18 by tarzan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			= inception
VERSION			= 1.0
DOCKER_COMPOSE		= docker-compose
COMPOSE_FILE		= srcs/docker-compose.yaml

# Colors
RED			= \033[0;31m
GREEN			= \033[0;32m
NC			= \033[0m

#Generate .env file

# Rules
all: up

up:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up -d
	@echo "$(GREEN)Containers are up and running$(NC)"

down:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down
	@echo "$(RED)Containers are stopped$(NC)"

build:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) build
	@echo "$(GREEN)Containers are built$(NC)"

clean: down
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) rm -f
	@echo "$(RED)Containers are removed$(NC)"

fclean: clean
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down -v
	@echo "$(RED)Containers and volumes are removed$(NC)"

prune: fclean
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down --rmi all
	@echo "$(RED)Containers, volumes and images are removed$(NC)"

restart: down up

.PHONY: all up down build clean restart

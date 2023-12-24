.PHONY: generate-key-pair compose-up compose-down

DOCKER_COMPOSE = docker compose

generate-key-pair:
	bash scripts/ssh-key-pair.sh

compose-up:
	$(DOCKER_COMPOSE) up -d

compose-down:
	$(DOCKER_COMPOSE) down
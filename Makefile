.PHONY: help
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

PWD = $(shell pwd)

build-local: ## Builds local image
	docker build -t tcardonne/ansible:local .

local-run: ## Start local image
	docker run -it --rm tcardonne/ansible:local sh

TAG    := $$(git log -1 --pretty=format:"%H")

release: ## Builds Docker images and pushes it to repository
	docker build -t tcardonne/ansible:latest -t tcardonne/ansible:${TAG} .
	docker push tcardonne/ansible:${TAG}
	docker push tcardonne/ansible:latest
	@echo "-----------------------------------"
	@echo "built with tags : latest, ${TAG}"
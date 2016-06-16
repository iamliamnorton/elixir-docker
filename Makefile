PROJECT ?= elixir-docker
TAG ?= dev

IMAGE = $(PROJECT):$(TAG)

.PHONY: default build shell

default: build shell

build: Dockerfile
	docker build --rm -t $(IMAGE) .

shell:
	docker run --rm -it \
		--name $(PROJECT)-shell \
		-v $(PWD):/app \
		$(IMAGE) bash

IMAGE_VERSION   ?= $(shell git describe --tags --dirty | cut -c 2-)
BASE_IMAGE_NAME ?= lita
FULL_IMAGE_NAME ?= $(DOCKER_URL)/$(BASE_IMAGE_NAME):$(IMAGE_VERSION)

all: build

release: build push

build:
	@docker build -t "$(FULL_IMAGE_NAME)" .

push:
	@docker push "$(FULL_IMAGE_NAME)"

.PHONY: release build push

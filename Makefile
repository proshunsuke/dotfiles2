DOTFILES_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CONTAINER_NAME_DEBIAN=debian_dotfiles_proshunsuke
HOME_DIR=/root/

all: install

install:
	@DOTFILES_PATH=$(DOTFILES_PATH) sh $(DOTFILES_PATH)/scripts/init.sh

up-debian: build-debian run-debian start-debian

build-debian:
	docker build -t ${CONTAINER_NAME_DEBIAN} docker/debian/

run-debian:
	docker run -it -d -p 8080:80 --name ${CONTAINER_NAME_DEBIAN} ${CONTAINER_NAME_DEBIAN}
	docker cp ~/.ssh ${CONTAINER_NAME_DEBIAN}:${HOME_DIR}

start-debian:
	docker start ${CONTAINER_NAME_DEBIAN}

stop-debian:
	docker stop ${CONTAINER_NAME_DEBIAN}

rm-debian: stop-debian
	docker rm ${CONTAINER_NAME_DEBIAN}

rmi-debian:
	docker rmi ${IMAGE_ID_DEBIAN}

ssh-debian:
	docker exec -it ${CONTAINER_NAME_DEBIAN} bash

install-in-debian:
	docker exec -it ${CONTAINER_NAME_DEBIAN} bash -c "git clone git@github.com:proshunsuke/dotfiles.git && cd dotfiles && make"

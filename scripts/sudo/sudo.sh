#!/bin/bash

. ${DOTFILES_PATH}/scripts/lib.sh

if ! has "sudo" ; then
    case "$(os)" in
        debian)
            apt-get install -y sudo ;;
    esac
fi

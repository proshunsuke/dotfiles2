#!/bin/bash

. ${DOTFILES_PATH}/scripts/lib.sh

if ! has "xsel" ; then
    case "$(os)" in
        debian)
            sudo apt-get install -y -qq xsel ;;
    esac
fi

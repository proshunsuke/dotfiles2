#!/bin/bash

. ${DOTFILES_PATH}/scripts/lib.sh

if ! has "xsel" ; then
    case "$(os)" in
        debian)
            sudo apt-get install -y -qq xsel ;;
        arch)
            sudo pacman -S --noconfirm xsel ;;
    esac
fi

#!/bin/bash

. ${DOTFILES_PATH}/scripts/lib.sh

if ! has "python" ; then
    case "$(os)" in
        debian)
            sudo apt-get install -y -qq python ;;
        arch)
            sudo pacman -S --noconfirm python ;;
    esac
fi

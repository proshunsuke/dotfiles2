#!/bin/bash

. ${DOTFILES_PATH}/scripts/lib.sh

if ! has "emacs" ; then
    case "$(os)" in
        debian)
            sudo apt-get install -y -qq emacs ;;
        arch)
            sudo pacman -S --noconfirm emacs ;;
    esac
fi

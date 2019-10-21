#!/bin/bash

. ${DOTFILES_PATH}/scripts/lib.sh

if ! has "sudo" ; then
    case "$(os)" in
        debian)
            apt-get install -y -qq sudo ;;
        arch)
            pacman -S sudo --noconfirm ;;
    esac
fi

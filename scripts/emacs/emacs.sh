#!/bin/bash

. ${DOTFILES_PATH}/scripts/lib.sh

if ! has "emacs" ; then
    case "$(os)" in
        debian)
            sudo apt-get install -y -qq emacs ;;
    esac
fi

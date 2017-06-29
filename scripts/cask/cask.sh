#!/bin/bash

. ${DOTFILES_PATH}/scripts/lib.sh
if ! [ -e ${HOME}/.cask ] ; then
    case "$(os)" in
        debian)
            curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python ;;
    esac
fi

cd $HOME/.emacs.d/
${HOME}/.cask/bin/cask install

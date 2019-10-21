#!/bin/bash

. ${DOTFILES_PATH}/scripts/lib.sh
if ! [ -e ${HOME}/.cask ] ; then
    if is_linux ; then
        curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
    fi
    cd $HOME/.emacs.d/
    ${HOME}/.cask/bin/cask install
fi

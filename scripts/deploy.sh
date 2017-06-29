#!/bin/bash

for file in $(ls -A ${DOTFILES_PATH}/dots/) ; do
    ln -sfnv ${DOTFILES_PATH}/dots/${file} ${HOME}/"${file}"
done

#!/bin/bash

. ${DOTFILES_PATH}/scripts/lib.sh

log_info "$(e_arrow "create a symbolic link of dotfiles")"

for file in $(ls -A ${DOTFILES_PATH}/dots/) ; do
    ln -sfnv ${DOTFILES_PATH}/dots/${file} ${HOME}/"${file}"
done

log_info "$(e_done "create a symbolic link of dotfiles")"

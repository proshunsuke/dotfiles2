#!/bin/bash

. ${DOTFILES_PATH}/scripts/lib.sh

log_info "$(e_arrow "deploy dotfiles to home directory")"

for file in $(ls -A ${DOTFILES_PATH}/dots/) ; do
    ln -sfnv ${DOTFILES_PATH}/dots/${file} ${HOME}/"${file}"
done

log_info "$(e_done "deploy")"

#!/bin/sh

. ${DOTFILES_PATH}/scripts/lib.sh

install() {
   local package_name="$1"
   log_info "$(e_arrow ${package_name})"
   sh ${DOTFILES_PATH}/scripts/${package_name}/${package_name}.sh
   log_info "$(e_done ${package_name})"
}

 #!/bin/sh

. ${DOTFILES_PATH}/scripts/install.sh

install "sudo"
install "emacs"
install "python"
install "tmux"
install "xsel"
install "zsh"
sh ${DOTFILES_PATH}/scripts/deploy.sh
install "cask"
install "peco"

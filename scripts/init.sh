 #!/bin/sh

. ${DOTFILES_PATH}/scripts/install.sh

cat << EOT
      _       _    __ _ _
   __| | ___ | |_ / _(_) | ___  ___
  / _\` |/ _ \| __| |_| | |/ _ \/ __|
 | (_| | (_) | |_|  _| | |  __/\__ \\
  \__,_|\___/ \__|_| |_|_|\___||___/
  _               ____                      _                           _
 | |__  _   _    / __ \ _ __  _ __ ___  ___| |__  _   _ _ __  ___ _   _| | _____
 | '_ \| | | |  / / _\` | '_ \| '__/ _ \/ __| '_ \| | | | '_ \/ __| | | | |/ / _ \\
 | |_) | |_| | | | (_| | |_) | | | (_) \__ \ | | | |_| | | | \__ \ |_| |   <  __/
 |_.__/ \__, |  \ \__,_| .__/|_|  \___/|___/_| |_|\__,_|_| |_|___/\__,_|_|\_\___|
        |___/    \____/|_|

https://twitter.com/pro_shunsuke
EOT

install "sudo"
install "emacs"
install "python"
install "tmux"
install "xsel"
install "zsh"
sh ${DOTFILES_PATH}/scripts/deploy.sh
install "cask"
install "peco"

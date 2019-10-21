#!/bin/bash

. ${DOTFILES_PATH}/scripts/lib.sh

if ! has "zsh" ; then
    case "$(os)" in
        debian)
            sudo apt-get install -y -qq zsh ;;
        arch)
            sudo pacman -S --noconfirm zsh ;;
    esac
fi

# ログイン時にzshを使うように設定
zsh_path="$(which zsh)"
chsh -s "$zsh_path"

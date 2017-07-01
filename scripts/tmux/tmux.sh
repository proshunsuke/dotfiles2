#!/bin/bash

. ${DOTFILES_PATH}/scripts/lib.sh

if ! has "tmux" ; then
    case "$(os)" in
        debian)
            sudo apt-get install -y -qq automake libevent-dev libncurses5-dev pkg-config
    esac
    git clone https://github.com/tmux/tmux.git
    cd tmux
    git checkout $(git tag | sort -V | tail -n 1)
    sh autogen.sh
    ./configure
    make -j4
    sudo make install
    rm -rf ${DOTFILES_PATH}/tmux
fi

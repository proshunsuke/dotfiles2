#!/bin/bash

. ${DOTFILES_PATH}/scripts/lib.sh

if ! has "peco" ; then
    case "$(os)" in
        debian)
            latest=$(
                curl -fsSI https://github.com/peco/peco/releases/latest |
                tr -d '\r' |
                awk -F'/' '/^Location:/{print $NF}'
            )

            : ${latest:?}

            curl -fsSL "https://github.com/peco/peco/releases/download/${latest}/peco_linux_amd64.tar.gz" |
              sudo sh -c "tar -xz --to-stdout peco_linux_amd64/peco > /usr/local/bin/peco"

            sudo chmod +x /usr/local/bin/peco
    esac
fi

#!/bin/bash

is_exists() {
    which "$1" >/dev/null 2>&1
    return $?
}

has() {
    is_exists "$@"
}

contains() {
    string="$1"
    substring="$2"
    if [ "${string#*$substring}" != "$string" ]; then
        return 0
    else
        return 1
    fi
}

os_detect() {
    export PLATFORM
    case $(uname) in
        *'Linux'*)  PLATFORM='linux'   ;;
        *'Darwin'*) PLATFORM='osx'     ;;
        *'Bsd'*)    PLATFORM='bsd'     ;;
        *)          PLATFORM='unknown' ;;
    esac
}

is_linux() {
    os_detect
    if [ "$PLATFORM" = "linux" ]; then
        return 0
    else
        return 1
    fi
}

is_debian() {
    if has "apt-get" ; then
        return 0
    else
        return 1
    fi
}

os() {
    os_detect
    if is_linux ; then
        if is_debian ; then
            echo "debian"
        fi
    fi
}

# 言語設定
export LANG=ja_JP.UTF-8

# プロンプトの色設定
autoload -Uz colors
colors

# gitの色設定
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "${fg_bold[yellow]}!"
zstyle ':vcs_info:git:*' unstagedstr "${fg_bold[red]}+"
zstyle ':vcs_info:*' formats "${fg_bold[black]}-${reset_color}${fg_bold[black]}[${reset_color}%F{green}%c%u%b${fg_bold[black]}]${reset_color}%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# プロンプトの設定
NEWLINE=$'\n'
LEFT_PROMPT="%{${fg_bold[green]}%}%n${reset_color}:${fg_bold[black]}[${fg_bold[magenta]}%~${reset_color}${fg_bold[black]}][${fg_bold[cyan]}%T${fg_bold[black]}${reset_color}${fg_bold[black]}]${fg[white]}${reset_color}"
PROMPT=$LEFT_PROMPT'${vcs_info_msg_0_}'
PROMPT=$PROMPT${NEWLINE}"%# "

# 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_cd

# cd でTabを押すとdir list を表示
setopt auto_pushd

# ディレクトリスタックに同じディレクトリを追加しないようになる
setopt pushd_ignore_dups

# コマンドのスペルチェックをする
setopt correct

# コマンドライン全てのスペルチェックをする
setopt correct_all

# 上書きリダイレクトの禁止
setopt no_clobber

# 補完候補リストを詰めて表示
setopt list_packed

# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt list_types

# 補完候補が複数ある時に、一覧表示する
setopt auto_list

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# カッコの対応などを自動的に補完する
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl

# 補完キー（Tab,  Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt auto_menu

# sudoも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# 色付きで補完する
zstyle ':completion:*' list-colors di=34 fi=0

# 複数のリダイレクトやパイプなど、必要に応じて tee や cat の機能が使われる
setopt multios

# 最後がディレクトリ名で終わっている場合末尾の / を自動的に取り除かない
setopt noautoremoveslash

# beepを鳴らさないようにする
setopt nolistbeep

# lsコマンドなどを見やすく
setopt extended_glob

# emacsライクなキーバインドに
bindkey -e

# 履歴が追いやすく鳴る
# ls # この状態で alt-p alt-n でそのコマンドについての履歴が追える
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

## コマンド履歴設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 登録済コマンド行は古い方を削除
setopt hist_ignore_all_dups

# historyの共有
setopt share_history

# 余分な空白は詰める
setopt hist_reduce_blanks

# コマンド実行されたら履歴追加
setopt inc_append_history

# history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store

# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments

# URLをコピペしたときに自動でエスケープ
autoload -Uz url-quote-magic

# 勝手にpushd
setopt autopushd

# エラーメッセージ本文出力に色付け
e_normal=`echo -e "¥033[0;30m"`
e_RED=`echo -e "¥033[1;31m"`
e_BLUE=`echo -e "¥033[1;36m"`

function make() {
    LANG=C command make "$@" 2>&1 | sed -e "s@[Ee]rror:.*@$e_RED&$e_normal@g" -e "s@cannot¥sfind.*@$e_RED&$e_normal@g" -e "s@[Ww]arning:.*@$e_BLUE&$e_normal@g"
}
function cwaf() {
    LANG=C command ./waf "$@" 2>&1 | sed -e "s@[Ee]rror:.*@$e_RED&$e_normal@g" -e "s@cannot¥sfind.*@$e_RED&$e_normal@g" -e "s@[Ww]arning:.*@$e_BLUE&$e_normal@g"
}

# Completion設定
fpath=(~/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit -u

# zshエディタ
autoload zed
export SUDO_EDITOR="$(which emacs)"
export EDITOR="$(which emacs)"

# コマンド補完
autoload predict-on

# lsに色を付ける
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -AGF --color=auto"
alias ll="ls -AlGF --color=auto"

# tmuxの自動起動
if [ -z "$TMUX" -a -z "$STY" ]; then
    if type tmuxx >/dev/null 2>&1; then
        tmuxx
    elif type tmux >/dev/null 2>&1; then
        if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
            tmux attach && echo "tmux attached session "
        else
            tmux new-session && echo "tmux created new session"
        fi
    elif type screen >/dev/null 2>&1; then
        screen -rx || screen -D -RR
    fi
fi

# zsh-completionsを利用する Github => zsh-completions
fpath=(~/.zsh-completions $fpath)

## cask
PATH="$HOME/.cask/bin:$PATH"

## peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

case "${OSTYPE}" in
    darwin*)
        ;;
    linux*)
        # 入力メソッド
        export GTK_IM_MODULE=fcitx
        export XMODIFIERS=@im=fcitx
        export QT_IM_MODULE=fcitx
        ;;
esac

# global bashrc
[ -r /etc/bashrc ] && source /etc/bashrc

export PATH=$HOME/.local/bin:$HOME/bin:$HOME/dotfiles/bin:$PATH
export EDITOR=vim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# functii generice
[ -r "${HOME}/dotfiles/bash/functions.sh" ] && . "${HOME}/dotfiles/bash/functions.sh"

# if [ ! -z "$BASH_COMPLETION_VERSINFO" ]
# then
for bcfile in "${HOME}"/dotfiles/.bash_completion.d/* ; do
. $bcfile
done
# fi

# alias pentru xclip
[[ $(type "xclip" 2>/dev/null) ]] && alias xc='xclip -selection clipboard'

function __ps1_git()
{
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo "($branch) "
    else
        echo ""
    fi;
}

#PS1='[\u@\h \W]\$ ' # default
export PS1=\
'\u@\h \[\033[38;2;255;255;0m\]\w'\
'\n'\
'\[\033[38;2;0;111;184m\]$( declare -F __ps1_git &>/dev/null && __ps1_git )\[\033[00m\]'\
'\[\033[38;2;0;128;128m\]▶\[\033[00m\] '

# .bashrc_local in home dir
[ -r "${HOME}/.bashrc_local" ] && . "${HOME}/.bashrc_local"


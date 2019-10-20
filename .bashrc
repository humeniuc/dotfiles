# global bashrc
[ -r /etc/bashrc ] && source /etc/bashrc

export PATH=$HOME/.local/bin:$HOME/bin:$HOME/dotfiles/bin:$HOME/gocode/bin:$PATH
export EDITOR=vim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# functii generice
[ -r "${HOME}/dotfiles/bash/functions.sh" ] && . "${HOME}/dotfiles/bash/functions.sh"

if [ ! -z "$BASH_COMPLETION_VERSINFO" ]
then
    for bcfile in "${HOME}"/dotfiles/.bash_completion.d/* ; do
    . $bcfile
    done
fi

# alias pentru xclip
[[ $(type "xclip" 2>/dev/null) ]] && alias xc='xclip -selection clipboard'


function __ps1_git()
{
    git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/(\1) /"
    # git symbolic-ref -q --short HEAD || echo "not on a branch "
}

function __ps1_svn()
{
    svn info 2>/dev/null | sed -n "/^URL: /s/.*\/\(\(trunk\)\|branches\/\([^/]*\)\).*/(\2\3) /p"
}

#PS1='[\u@\h \W]\$ ' # default
export PS1=\
'\u@\h \[\033[93m\]\w'\
'\n'\
'\[\033[33m\]$( declare -F __ps1_git &>/dev/null && __ps1_git )\[\033[00m\]'\
'\[\033[0;36m\]▶\[\033[00m\] '

# .bashrc_local in home dir
[ -r "${HOME}/.bashrc_local" ] && . "${HOME}/.bashrc_local"


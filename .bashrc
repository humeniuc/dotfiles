#
# ~/.bashrc
#

export EDITOR=vim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias gvr='gvim --remote'
PS1='[\u@\h \W]\$ '

function randomchars {
    tr -dc A-Za-z0-9 </dev/urandom |  head -c $1
}

# posibilitatea de a avea pe langa bashrc-ul generic, din repository, a unui bashrc local
if [ -f ~/.bashrc_local ]
then
    bash ~/.bashrc_local
fi

#bash ~/scripts/keyboard/fix_enter.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Enable programmable sdb completion features.
if [ -f ~/.sdb/.sdb-completion.bash ]; then
 source ~/.sdb/.sdb-completion.bash
fi

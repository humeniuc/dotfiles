#
# ~/.bashrc
#

export EDITOR=vim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias gvr='gvim --remote'
PS1='[\u@\h \W]\$ '


#bash ~/scripts/keyboard/fix_enter.bash

function randomchars {
    tr -dc A-Za-z0-9 </dev/urandom |  head -c $1
}

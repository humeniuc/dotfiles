# System bashrc
# Centos
[ -r /etc/bashrc ] && source /etc/bashrc
# Arch
[ -r /etc/bash.bashrc ] && source /etc/bash.bashrc

. "$DOTFILES_PATH/lib/bash/path_augment_local.sh"

export EDITOR=vim

# What follows next is only for interactive bash
[[ $- != *i* ]] && return


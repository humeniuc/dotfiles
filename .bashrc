# System bashrc
# Centos 
[ -r /etc/bashrc ] && source /etc/bashrc
# Arch
[ -r /etc/bash.bashrc ] && source /etc/bash.bashrc

. "${HOME}/dotfiles/lib/bash/path_augment_local.sh"

export EDITOR=vim

# What follows next is only for interactive bash
[[ $- != *i* ]] && return

# The settings for interactive bash whould be loaded from $HOME/dotfiles/bashrc.d/*.sh.
# For details see $HOME/dotfiles/bashrc.d/Readme.md
for file in "$HOME/dotfiles/bashrc.d/"*.sh; do
    [ -r "$file" ] && . "$file"
done
unset file

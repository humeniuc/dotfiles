# System bashrc
# Centos 
[ -r /etc/bashrc ] && source /etc/bashrc
# Arch
[ -r /etc/bash.bashrc ] && source /etc/bash.bashrc

# $HOME/.local/bin and its's recursive subdirectories added in $PATH.
# That way, if I symlink dotfiles/bin to $HOME/.local/bin/dotfiles, the dotfiles/bin executables whould be accesible.
# PATH_AUGMENTED prevents re-augment PATH when starting bash from bash or bash > mc or bash > tmux > bash > mc, etc. 
[ -z "$PATH_AUGMENTED" ] && {
    export PATH="$(find -L "${HOME}/.local/bin" -type d -print0 | sed "s/\x0$//; s/\x0/:/g"):$PATH"
    export PATH_AUGMENTED=true
}

export EDITOR=vim

# What follows next is only for interactive bash
[[ $- != *i* ]] && return

# The settings for interactive bash whould be loaded from $HOME/dotfiles/bashrc.d/*.sh.
# For details see $HOME/dotfiles/bashrc.d/Readme.md
for file in "$HOME/dotfiles/bashrc.d/"*.sh; do
    [ -r "$file" ] && . "$file"
done
unset file

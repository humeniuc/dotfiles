# global bashrc
[ -r /etc/bashrc ] && source /etc/bashrc
[ -r /etc/bash.bashrc ] && source /etc/bash.bashrc

# Pun in path $HOME/.local/bin si subdirectoarele 
export PATH="$(find -L "${HOME}/.local/bin" -type d -print0 | sed "s/\x0$//; s/\x0/:/g"):$PATH"

export EDITOR=vim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for file in "$HOME/dotfiles/bashrc.d/"*.sh; do
    [ -r "$file" ] && . "$file"
done
unset file

# global bashrc
[ -r /etc/bashrc ] && source /etc/bashrc

export PATH=$HOME/.local/bin:$HOME/bin:$HOME/dotfiles/bin:$PATH
export EDITOR=vim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for file in "$HOME/dotfiles/bashrc.d/"*.sh; do
    [ -r "$file" ] && . "$file"
done
unset file

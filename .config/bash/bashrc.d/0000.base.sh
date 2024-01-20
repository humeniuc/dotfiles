# System bashrc
# Centos
[ -r /etc/bashrc ] && source /etc/bashrc
# Arch
[ -r /etc/bash.bashrc ] && source /etc/bash.bashrc

source "$DOTFILES_PATH/lib/bash/path_augment_local.sh"

# Large history.
export HISTSIZE=1000000

# No limit for HISTFILESIZE
# From: https://excessivelyadequate.com/posts/history.html
# > If it is unset at this point,
# > it is set to the same value as `HISTSIZE`. Therefore we must set it to `NIL`,
# > in which case it isn't "unset", but doesn't have a value either, enabling us
# > to keep an unlimited history.
export HISTFILESIZE=""

export HISTTIMEFORMAT="%F %T - "

# Ignores space preceding commands and duplicate commands
export HISTCONTROL=ignoreboth

# Do not record some commands
export HISTIGNORE="clear:history:exit:mc:[bf]g:* --help"

shopt -s histappend  # merge session histories

export EDITOR=vim

# What follows next is only for interactive bash
[[ $- != *i* ]] && return


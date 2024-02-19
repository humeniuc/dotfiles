command -v vim 2>/dev/null && export EDITOR=vim
command -v xfce4-terminal 2>/dev/null && export TERMINAL=xfce4-terminal

# Add to $DOTFILES/bin to $PATH
source "$DOTFILES_PATH/lib/bash/path_augment_local.sh"

# background color
xsetroot -solid "#2E3440"

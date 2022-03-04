#!/bin/bash

SCRIPT_PATH=$( realpath "${BASH_SOURCE[0]}" )
DOTFILES_PATH="${SCRIPT_PATH%/*}"

ln -s -r -f -T "$DOTFILES_PATH/.vim" "${HOME}/.vim"
ln -s -r -f "$DOTFILES_PATH/.ctags" "${HOME}/.ctags"

bash "$DOTFILES_PATH/build-bashrc" > "$HOME/.bashrc"
bash "$DOTFILES_PATH/build-xprofile" > "$HOME/.xprofile"
bash "$DOTFILES_PATH/build-tmux" > "$HOME/.tmux.conf"


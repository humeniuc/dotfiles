#!/bin/bash

DOTFILES="${HOME}/dotfiles"

ln -s -r -f "$DOTFILES/.vim" "${HOME}/.vim"
ln -s -r -f "$DOTFILES/.bashrc" "${HOME}/.bashrc"
ln -s -r -f "$DOTFILES/.ctags" "${HOME}/.ctags"
ln -s -r -f "$DOTFILES/.tmux.conf" "${HOME}/.tmux.conf"
ln -s -r -f "$DOTFILES/bin" "${HOME}/.local/bin/dotfiles"


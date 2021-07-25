#!/bin/bash

DOTFILES="${HOME}/dotfiles"

ln -s -r -f -T "$DOTFILES/.vim" "${HOME}/.vim"
ln -s -r -f "$DOTFILES/.bashrc" "${HOME}/.bashrc"
ln -s -r -f "$DOTFILES/.ctags" "${HOME}/.ctags"
ln -s -r -f "$DOTFILES/.tmux.conf" "${HOME}/.tmux.conf"
ln -s -r -f -T "$DOTFILES/bin" "${HOME}/.local/bin/dotfiles"


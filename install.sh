#!/bin/bash

DOTFILES="${HOME}/dotfiles"


ln -s -r -f -T "$DOTFILES/.vim" "${HOME}/.vim"
ln -s -r -f "$DOTFILES/.bashrc" "${HOME}/.bashrc"
ln -s -r -f "$DOTFILES/.ctags" "${HOME}/.ctags"
ln -s -r -f "$DOTFILES/.tmux.conf" "${HOME}/.tmux.conf"
mkdir -p "${HOME}/.local/bin"
ln -s -r -f -T "$DOTFILES/bin" "${HOME}/.local/bin/dotfiles"
mkdir -p "${HOME}/.local/share/mc/skins"
ln -s -r -f -T "$DOTFILES/mc/skins/nord16M.ini" "${HOME}/.local/share/mc/skins/nord16M.ini"


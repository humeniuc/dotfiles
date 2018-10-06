#!/bin/bash

dir="${HOME}/dotfiles"
olddir="${HOME}/dotfiles_old"
files=(
    .bash_aliases
    .bashrc
    .bash_utils
    .ctags
    .screenrc
    .tmux.conf
    .vim
    .vimrc
)

set -x
cd ~
mkdir -p $olddir

for file in "${files[@]}";
do
    mv "${HOME}/$file" "$olddir"
    ln -s -r "$dir/$file" "${HOME}/$file"
done



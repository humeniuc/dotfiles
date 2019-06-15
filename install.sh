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
)

set -x
cd ~
mkdir -p $olddir

for file in "${files[@]}";
do
    mv "${HOME}/$file" "$olddir"
    ln -s -r "$dir/$file" "${HOME}/$file"
done

for f in "$HOME/dotfiles/bin/*";
do
    if [[ -f "$f" ]]; then
        ln -s "$f" "$HOME/bin/"$(basename "$f");
    fi
done

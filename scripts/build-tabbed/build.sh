#!/bin/bash

SCRIPT_PATH=$( if [ "${BASH_SOURCE[0]:0:1}" == "/" ]; then echo "${BASH_SOURCE[0]}"; else echo "$(pwd)/${BASH_SOURCE[0]}"; fi )
SCRIPT_DIR="${SCRIPT_PATH%/*}"
REPODIR="$HOME/repositories/tabbed"

[ -d "$REPODIR" ] || mkdir -p "$REPODIR"
[ -d "$REPODIR" ] || { echo "$REPODIR does not exists"; exit 2; }

cd "$REPODIR"

stat="$(git rev-parse --is-inside-work-tree)"
if [ "$stat" != "true" ]; then
    git clone git://git.suckless.org/tabbed .
fi

make clean
git checkout -- .
[ -f ./config.h ] && rm ./config.h

git apply "$SCRIPT_DIR/patch-install-path.diff"
git apply "$SCRIPT_DIR/patch-new-tab-at-the-end.diff"
git apply "$SCRIPT_DIR/patch-nav-with-page-up-down.diff"

make clean install


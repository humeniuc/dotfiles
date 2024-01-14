#!/bin/bash

# set -e

SCRIPT_PATH=$( if [ "${BASH_SOURCE[0]:0:1}" == "/" ]; then echo "${BASH_SOURCE[0]}"; else echo "$(pwd)/${BASH_SOURCE[0]}"; fi )
SCRIPT_DIR="${SCRIPT_PATH%/*}"
REPO_URL="git://git.suckless.org/tabbed"
REPO_DIR="$HOME/repositories/tabbed"

[ -d "$REPO_DIR" ] || mkdir -p "$REPO_DIR"
[ -d "$REPO_DIR" ] || { echo "$REPO_DIR does not exists"; exit 2; }

cd "$REPO_DIR"

stat="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
if [ "$stat" != "true" ]; then
    git clone "$REPO_URL" .
fi

make clean
git checkout -- .
git pull origin master
[ -f ./config.h ] && rm ./config.h

git apply "$SCRIPT_DIR/patch-install-path.diff"
git apply "$SCRIPT_DIR/patch-font.diff"
git apply "$SCRIPT_DIR/patch-new-tab-at-the-end.diff"
git apply "$SCRIPT_DIR/patch-nav-fix.diff"

make clean install


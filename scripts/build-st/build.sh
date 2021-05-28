#!/bin/bash

SCRIPT_PATH=$( if [ "${BASH_SOURCE[0]:0:1}" == "/" ]; then echo "${BASH_SOURCE[0]}"; else echo "$(pwd)/${BASH_SOURCE[0]}"; fi )
SCRIPT_DIR="${SCRIPT_PATH%/*}"
REPO_URL="git://git.suckless.org/st"
REPO_DIR="$HOME/repositories/st"

[ -d "$REPO_DIR" ] || mkdir -p "$REPO_DIR"
[ -d "$REPO_DIR" ] || { echo "$REPO_DIR does not exists"; exit 2; }

cd "$REPO_DIR"
stat="$(git rev-parse --is-inside-work-tree)"
if [ "$stat" != "true" ]; then
    git clone "$REPO_URL" .
fi

PATCHES_DIR="./patches"
mkdir -p "$PATCHES_DIR"

make clean
git checkout -- .
[ -f ./config.h ] && rm ./config.h

function install_patch()
{   
    URL=$1
    FILENAME=${URL/*\//}

    if [ ! -f "$PATCHES_DIR/$FILENAME" ]; then
        ( cd $PATCHES_DIR && curl -O "$URL")
    fi
    patch -p1 < "$PATCHES_DIR/$FILENAME"
    # git apply < "$PATCHES_DIR/$FILENAME"
}

# scrollback
install_patch "https://st.suckless.org/patches/scrollback/st-scrollback-20210507-4536f46.diff"

# scrollback with mouse
install_patch "https://st.suckless.org/patches/scrollback/st-scrollback-mouse-20191024-a2c479c.diff"

# scrollback alt screen
install_patch "https://st.suckless.org/patches/scrollback/st-scrollback-mouse-altscreen-20200416-5703aa0.diff"

# clipboard
install_patch "https://st.suckless.org/patches/clipboard/st-clipboard-20180309-c5ba9c0.diff"

git apply "$SCRIPT_DIR/patch-install-local.diff"
git apply "$SCRIPT_DIR/patch-color.diff"
git apply "$SCRIPT_DIR/patch-delkey.diff"
git apply "$SCRIPT_DIR/patch-font-terminus.diff"
git apply "$SCRIPT_DIR/patch-osc52-enable.diff"

# make st
make clean install

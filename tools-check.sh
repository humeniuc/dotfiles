#!/bin/bash

declare -a executables=(
    "autorandr"
    "chromium"
    "dex"
    "firefox"
    "flameshot"
    "greenclip"
    "jq"
    "numlockx"
    "polybar"
    "rofi"
    "screenkey"
    "simplescreenrecorder"
    "tmux"
    "udiskctl"
    "volumeicon"
    "x11-ssh-askpass"
    "xpanes"
)

for executable in "${executables[@]}"
do
    command -v "$executable" >/dev/null || echo "$executable is not installed";
done

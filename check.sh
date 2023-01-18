#!/bin/bash

declare -a executables=(
    "chromium"
    "firefox"
    "flameshot"
    "numlockx"
    "greenclip"
    "rofi"
    "screenkey"
    "simplescreenrecorder"
    "tmux"
    "udiskctl"
    "volumeicon"
    "x11-ssh-askpass"
    "xpanes"
    "polybar"
    "autorandr"
)

for executable in "${executables[@]}"
do
    command -v "$executable" >/dev/null || echo "$executable is not installed";
done

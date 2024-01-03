#!/bin/bash

declare -a executables=(
    "arandr"
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
    "udisksctl"
    "volumeicon"
    "x11-ssh-askpass"
    "xdotool"
    "xpanes"
    "xrandr"
)

for executable in "${executables[@]}"
do
    command -v "$executable" >/dev/null || echo "$executable is not installed";
done

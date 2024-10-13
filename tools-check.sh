#!/bin/bash

declare -a executables=(
    "arandr"
    "autorandr"
    "brightnessctl"
    "chromium"
    "dex"
    "firefox"
    "flameshot"
    "fzf"
    "greenclip"
    "i3lock"
    "jq"
    "numlockx"
    "pip"
    "polybar"
    "pylsp"
    "rofi"
    "screenkey"
    "simplescreenrecorder"
    "tmux"
    "udisksctl"
    "volumeicon"
    "wezterm"
    "x11-ssh-askpass"
    "xdotool"
    "xpanes"
    "xrandr"
    "zathura"
)

for executable in "${executables[@]}"
do
    command -v "$executable" >/dev/null || echo "$executable is not installed";
done

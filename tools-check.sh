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
    "gammastep"
    "ghostty"
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
    "sway"
    "tmux"
    "udisksctl"
    "volumeicon"
    "waybar"
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

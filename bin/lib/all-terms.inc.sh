#!/bin/bash

_error_message() {
    [ -n "$1" ] && {
        echo "$1" >&2
        command -v /bin/notify-send >/dev/null && notify-send -- "$1"
    }
}

_exit() {
    [ -n "$1" ] && _error_message "$1"
    exit 1
}

_ssh_ensure_key() {
    ssh-ensure-key "${1}" || _exit "Nu am putut încărca ${1}"
}

# @param command
# @param windowname 
new_tab()
{   
    if [ "$1" == "1" ]; then
        if [ "$_TERM" == "xfce4-terminal" ]; then
            xfce4-terminal --tab --title="$3"
        fi

        if [ "$_TERM" == "st" ]; then
            xdotool key "Ctrl+grave"
            sleep 0.1
            xdotool type --delay 0 -- "-t $3"
            xdotool key "Return"
            sleep 0.1
        fi
    fi

    xdotool type --delay 0 "$2"
    xdotool key "Return"
}


start_xfce4_terminal()
{
    xfce4-terminal --initial-title="local" &
    xdotool search --sync --onlyvisible --class "xfce4-terminal"
}


start_st_terminal()
{
    tabbed -r 2 -n "tabbed-st" st -w '' &
    xdotool search --sync --onlyvisible --class "tabbed"
    sleep 0.1
}

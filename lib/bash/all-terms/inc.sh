#!/bin/bash

# See sample

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
_new_tab() {   
    my_term="${1}"
    create_new_tab="${2}"
    my_command="${3}"
    label="${4}"

    # new tab
    if [ "${create_new_tab}" == "1" ]; then
        echo "new tab!"
        case "${my_term}" in 
            "xfce4-terminal")
                xfce4-terminal --tab --title="${label}"
                ;;
            "st")
                xdotool key "Ctrl+grave"
                sleep 0.1
                xdotool type --delay 0 -- "-t ${label}"
                xdotool key "Return"
                sleep 0.1
                ;;
            *)
                _exit "Terminal greșit configurat"
                ;;
        esac
    fi

    echo "run command ${my_command}"
    xdotool type --delay 0 "${my_command}"
    xdotool key "Return"
}


_start_term() {
    case "$1" in
        "xfce4-terminal")
            xfce4-terminal --initial-title="local" &
            xdotool search --sync --onlyvisible --class "xfce4-terminal"
            ;;
        "st")
            tabbed -r 2 -n "tabbed-st" st -w '' &
            xdotool search --sync --onlyvisible --class "tabbed"
            sleep 0.1
            ;;
        *)
            _exit "Not a term ${1}"
        ;;
    esac
}

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

new_id=""

# @param command
# @param windowname 
_new_tab() {   
    window_id="${1}"
    my_term="${2}"
    create_new_tab="${3}"
    my_command="${4}"
    label="${5}"

    # new tab
    if [ "${create_new_tab}" == "1" ]; then
        echo "new tab!"

        swaymsg "[con_id=${window_id}]" focus

        case "${my_term}" in 
            "xfce4-terminal")
                xfce4-terminal --tab --title="${label}"
                sleep 0.2
                ;;

            "ghostty")
                wtype -M ctrl -M shift t -m ctrl -m shift
                sleep 0.2
                ;;

            *)
                _exit "Terminal greșit configurat"
                ;;
        esac
    fi

    wtype "${my_command}"
    wtype -k Return
}

_start_term_listener() {
    app_id="$( command_to_application_id "$1" )"
    [ -z "${app_id}" ] && _exit "Application identifier for ${1} could not be found"
    sway_wait_for_window "${app_id}"
}

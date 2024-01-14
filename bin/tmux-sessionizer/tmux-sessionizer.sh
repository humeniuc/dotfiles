#!/usr/bin/env bash

CMD_ATTACH=()
CMD_SWITCH=()

_error()
{
    echo "$1" >&2;
    command -v /bin/notify-send >/dev/null && notify-send -- "$1"
    exit 1;
}

# Choose a session path 
# in TERM use fzf, else start rofi/dmenu
# The options are from tmux-sessionizer-paths.sh
choose_session_path() {
    local EXE_NAME="tmux-sessionizer-paths.sh"


    if [ -f "${HOME}/.local/bin/${EXE_NAME}" ]; then
        paths_command=( "bash" "${HOME}/.local/bin/${EXE_NAME}")
    elif [ -n "${DOTFILES_PATH}" -a -f "${DOTFILES_PATH}/bin/tmux-sessionizer/${EXE_NAME}" ]; then
        paths_command=( "bash" "$DOTFILES_PATH/bin/tmux-sessionizer/${EXE_NAME}" )
    else
        _error "${EXE_NAME} nu este definit"
    fi

    # is termial
    if [ -t "0" ]; then
        "${paths_command[@]}" | fzf
    else
        prompt='Choose a project'

        if [ $(command -v rofi) ]; then
            launcher_cmd=("rofi" "-dmenu" "-i" "-no-custom" "-p" "$prompt" "-monitor" "-4")
        else
            launcher_cmd=("dmenu" "-i" "-l" "10" "-p" "${prompt}:" "-fn" "Terminus:regular:size=12")
        fi

        "${paths_command[@]}" | "${launcher_cmd[@]}"
    fi
}


tmux_switch_or_attach()
{
    local SESSION_NAME="$1"

    CMD_ATTACH=("tmux" "attach-session" "-t" "$SESSION_NAME")
    CMD_SWITCH=("tmux" "switch-client" "-t" "$SESSION_NAME")

    if [ -t "0" ]; then
        # In terminal: Switch or attach depending if inside tmux or not
        [ -n "$TMUX" ] && "${CMD_SWITCH[@]}" || "${CMD_ATTACH[@]}"
    else
        # Try to switch, else start terminal and attach
        "${CMD_SWITCH[@]}" 2>/dev/null || tmux_attach_in_new_term
    fi
}


# start terminal and run the attach command
tmux_attach_in_new_term()
{
    existing_windows=$( xdotool search --onlyvisible --class "$TERMINAL" | sort )

    setsid "$TERMINAL" </dev/null >/dev/null 2>/dev/null &

    idx=0
    while true; do
        ((idx=idx+1))
        [ $idx -gt 10 ] && break

        new_windows=$( xdotool search --onlyvisible --class "$TERMINAL" | sort )

        winid=$( comm -13 <( echo "$existing_windows" ) <( echo "$new_windows" ) | tail -n1 )

        if [ ! -z "$winid" ]; then
            xdotool type --window "$winid" --delay 0 -- "${CMD_ATTACH[*]}" 
            xdotool key --window "$winid" "Return"
            break
        fi

        sleep 0.2
    done
}


session_name()
{
    echo $(echo "$1" | tr . _)
}


main() {
    local SESSION_NAME=""
    local SESSION_PATH=""

    # path && name could be script params. 
    # if not choose from options
    if [ $# -gt 0 ]; then
        SESSION_PATH="$1"
        SESSION_NAME="$2"
    else
        < <(choose_session_path) read SESSION_PATH SESSION_NAME
    fi

    # Session path is required.
    [ -z "$SESSION_PATH" ] && _error "No session path"


    # The first parameter could be a session name
    if [ -z "$SESSION_NAME" ]; then
        _SESSION_NAME=$(session_name "$SESSION_PATH")

        if tmux has-session -t="$_SESSION_NAME" 2>/dev/null; then
            tmux_switch_or_attach "$_SESSION_NAME"
            exit 0
        fi
    fi

    cd "$SESSION_PATH" 2>/dev/null && SESSION_PATH=$(pwd) || _error "Inexisting path $SESSION_PATH"

    # Determine session name from path if not set.
    [ -z "$SESSION_NAME" ] && SESSION_NAME=$(session_name $(basename "$SESSION_PATH"))

    # Ensure tmux session
    tmux has-session -t="$SESSION_NAME" 2>/dev/null || tmux new-session -d -s "$SESSION_NAME" -c "$SESSION_PATH" 

    tmux_switch_or_attach "$SESSION_NAME"
}

main "$@"

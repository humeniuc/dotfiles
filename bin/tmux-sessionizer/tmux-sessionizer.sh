#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    session_path=$1
    session_name=$2
else
    function _select_path_and_name() {
        paths_command=( "bash" "$DOTFILES_PATH/bin/tmux-sessionizer/tmux-sessionizer-paths.sh" )

        # is termial
        if [ -t 0 ]; then
            "${paths_command[@]}" | fzf
        else
            prompt='Alege un proiect'

            if [ $(command -v rofi) ]; then
                launcher_cmd=("rofi" "-dmenu" "-i" "-no-custom" "-p" "$prompt" "-monitor" "-4")
            else
                launcher_cmd=("dmenu" "-i" "-l" "10" "-p" "${prompt}:" "-fn" "Terminus:regular:size=12")
            fi

            "${paths_command[@]}" | "${launcher_cmd[@]}"
        fi
    }

    < <(_select_path_and_name) read session_path session_name
fi

# Session path is required.
if [ -z "$session_path" ]; then
    exit 1
fi

# Determine session name from path if not set.
if [ -z "$session_name" ]; then
    session_name=$(basename "$session_path" | tr . _)
fi

# Switch to session if exists
tmux switch-client -t="$session_name" 2>/dev/null
if [[ $? -eq 0 ]]; then
    exit 0
fi

# Create new session
# tmux new-session -d -c "$session_path" -s "$session_name" && tmux switch-client -t="$session_name" || tmux new -c "$session_path" -A -s "$session_name"

tmux new-session -d -c "$session_path" -s "$session_name" && tmux switch-client -t="$session_name" || {
    cmd=("tmux" "attach-session" "-t" "$session_name")

    if [ -t "0" ]; then
        "${cmd[@]}"
    else
        "$TERMINAL" &
        xdotool search --sync --onlyvisible --class "$TERMINAL" && \
        xdotool type --delay 0 -- "${cmd[*]}" && \
        xdotool key "Return"
    fi
}

#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    session_path=$1
    session_name=$2
else
    function _select_path_and_name() {
        paths_command=( "bash" "$DOTFILES_PATH/bin/tmux-sessionizer/tmux-sessionizer-paths.sh" )

        # is termial
        if [ -t "0" ]; then
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
[ -z "$session_path" ] && { echo "No session path" >&2; exit 1; }

# Determine session name from path if not set.
[ -z "$session_name" ] && session_name=$(basename "$session_path" | tr . _)

# Start session if it does not exists
tmux has-session -t="$selected_name" 2>/dev/null || tmux new-session -d -s "$session_name" -c "$session_path" 

cmd_attach=("tmux" "attach-session" "-t" "$session_name")
cmd_switch=("tmux" "switch-client" "-t" "$session_name")

# Terminal
if [ -t "0" ]; then
    # Switch or attach depending if inside tmux or not
    [ -n "$TMUX" ] && "${cmd_switch[@]}" || "${cmd_attach[@]}"
else
    if ! "${cmd_switch[@]}" 2>/dev/null; then
        existing_windows=$( xdotool search --onlyvisible --class "$TERMINAL" | sort )

        setsid "$TERMINAL" &

        idx=0
        while true; do
            ((idx=idx+1))
            [ $idx -gt 10 ] && break

            new_windows=$( xdotool search --onlyvisible --class "$TERMINAL" | sort )

            winid=$( comm -13 <( echo "$existing_windows" ) <( echo "$new_windows" ) | tail -n1 )

            if [ ! -z "$winid" ]; then
                xdotool type --window "$winid" --delay 0 -- "${cmd_attach[*]}" 
                xdotool key --window "$winid" "Return"
                break
            fi

            sleep 0.2
        done
    fi
fi

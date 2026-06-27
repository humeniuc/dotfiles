#!/usr/bin/env bash

set -euo pipefail

mapfile -t outputs < <(
    swaymsg -t get_outputs -r |
    jq -r '
        map(select(.active))
        | sort_by(.rect.x)
        | .[]
        | .name
    '
)

case "${#outputs[@]}" in
    0)
        exit 0
        ;;
    1)
        # One monitor
        primary="${outputs[0]}"
        secondary="${outputs[0]}"
        ;;
    2)
        # eDP-1 întotdeauna este în secondary
        if [[ "${outputs[0]}" == "eDP-1" ]]; then
            primary="${outputs[1]}"
            secondary="eDP-1"
        elif [[ "${outputs[1]}" == "eDP-1" ]]; then
            primary="${outputs[0]}"
            secondary="eDP-1"
        else
            primary="${outputs[0]}"
            secondary="${outputs[1]}"
        fi
        ;;
    *)
        filtered=()
        for o in "${outputs[@]}"; do
            [[ "$o" == "eDP-1" ]] && continue
            filtered+=("$o")
        done

        [[ ${#filtered[@]} -lt 2 ]] && exit 0

        primary="${filtered[0]}"
        secondary="${filtered[1]}"
        ;;
esac

declare -A wsmap=(
    [1]="$primary"
    [2]="$secondary"
    [3]="$primary"
    [4]="$secondary"
    [5]="$secondary"
    [6]="$primary"
    [7]="$primary"
    [8]="$secondary"
    [9]="$secondary"
    [10]="$secondary"
)

current_ws=$(swaymsg -t get_workspaces -r | jq -r '.[] | select(.focused) | .num')

for ws in {1..10}; do
    swaymsg "workspace number $ws; move workspace to output ${wsmap[$ws]}"
done

swaymsg "workspace number $current_ws"

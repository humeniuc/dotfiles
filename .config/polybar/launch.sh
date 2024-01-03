#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done

activemonitors=$( xrandr --listactivemonitors | tail -n +2 | awk '{print $NF}' )

priority=(
    "DP-0 144"
    "HDMI-0 96"
    "DP1 144"
    "HDMI2 96"
    "eDP1 96"
)

MAIN_STARTED=0
for f in "${priority[@]}"; do
    read -r MONITOR DPI <<< "$f"

    if printf "%s" "$activemonitors" | grep -E '^'"$MONITOR"'$' -q ; then
        if [ $MAIN_STARTED -eq 0 ]; then
            MAIN_STARTED=1
            BAR="main"
        else
            BAR="simple"
        fi

        MONITOR="$MONITOR" DPI="$DPI" polybar --config=$HOME/.config/polybar/all.ini "$BAR" &
    fi
done

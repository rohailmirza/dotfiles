#!/bin/sh

sink=$(pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1)
muted=false
volume_up() {
    pactl set-sink-volume $sink +1%
}

volume_down() {
    pactl set-sink-volume $sink -1%
}

volume_mute() {
    pactl set-sink-mute $sink toggle
    muted=!muted
}

volume_print() {
    volume=$( pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' )
    if [ "$volume" -lt 1 ]; then
        echo " "
    elif [ "$volume" -lt 50 ]; then
        echo " $volume%"
    else
        echo " $volume%"
    fi
}

listen() {
    volume_print
    pactl subscribe | while read -r event; do
        if echo "$event" | grep -q "#$sink"; then
            volume_print
        fi
    done
}

case "$1" in
    --up)
        volume_up
        ;;
    --down)
        volume_down
        ;;
    --mute)
        volume_mute
        ;;
    *)
        listen
        ;;
esac

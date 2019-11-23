#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done


if type "xrandr"; then
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
MONITOR=$m ~/.config/polybar/polybar --reload rohail &
done
else
~/.config/polybar/polybar --reload sec &
fi 

# Launch polybar
#~/.config/polybar/polybar rohail

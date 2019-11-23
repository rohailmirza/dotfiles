#!/bin/sh -e

# Take a screenshot
#scrot /tmp/screen_locked.png

# Pixellate it 10x
#mogrify -scale 5% -scale 2000% /tmp/screen_locked.png

# Lock screen displaying this image.
#i3lock -i /tmp/screen_locked.png
#i3lock -i /usr/share/backgrounds/wallpapers/lock.png

i3lock -i ~/.wallpapers/new.png -t;wget https://source.unsplash.com/random/1920x1080/?nature -O ~/.wallpapers/new; convert ~/.wallpapers/new ~/.wallpapers/new.png;

# Turn the screen off after a delay.
#sleep 120; pgrep i3lock && xset dpms force off

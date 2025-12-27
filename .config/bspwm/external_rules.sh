#!/usr/bin/env bash

# if there are more than 4 tiled windows on desktop, open new ones as floating
# new="$1"
 
 tiled_windows=$(bspc query -N -d focused -n '.!hidden.!floating.!fullscreen.window' | wc -l)

 if [ $tiled_windows -gt 2 ]; then
     echo "state = floating"    
 fi


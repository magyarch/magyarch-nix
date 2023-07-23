# Hlwm-utils - small utilities and workflow improvements for Herbstluffwm users

### Dependencies:
- Herbstluftwm 0.9.1 or newer
- dmenu (optional) 
- feh (optional)

### Instalation:
clone repo into `~/.config/herbstluftwm/`
in order to use wall-menu, change `~/Wallpapers` to direcotry where are yours wallpapers in all `wall-menu` scripts

## Bind layouts or hlwm-menu.sh as preferd keys.:

```sh 
# autostart

# bind menu
hc keybind $Mod-m sh ~/.config/herbstluftwm/hlwm-utils/hlwm-menu/hlwm-menu.sh

# layout bindings (control or Control)
hc keybind $Mod-control-c  sh ~/.config/herbstluftwm/hlwm-utils/layouts/centered-master
hc keybind $Mod-control-d  sh ~/.config/herbstluftwm/hlwm-utils/layouts/dwindle
hc keybind $Mod-control-m  sh ~/.config/herbstluftwm/hlwm-utils/layouts/master-stack
hc keybind $Mod-control-v  sh ~/.config/herbstluftwm/hlwm-utils/layouts/vertical

# Reset to default
hc keybind $Mod-control-r  sh ~/.config/herbstluftwm/hlwm-utils/layouts/reset
```

example for sxhkd users
```sh
# sxhkdrc

# bind menu
alt + m
  sh ~/.config/herbstluftwm/hlwm-utils/hlwm-menu/hlwm-menu.sh


# layout bindings
alt + control + c
  sh ~/.config/herbstluftwm/hlwm-utils/layouts/centered-master

alt + control + d
  sh ~/.config/herbstluftwm/hlwm-utils/layouts/dwindle

alt + control + m 
  sh ~/.config/herbstluftwm/hlwm-utils/layouts/master-stack
  
alt + control + v
  sh ~/.config/herbstluftwm/hlwm-utils/layouts/vertical
  
# Reset to default 
alt + control + r 
  sh ~/.config/herbstluftwm/hlwm-utils/layouts/reset
````
## Planed features and preview:
<img src="https://i.imgur.com/SLCIsH1.jpg" alt="img" align="right" width="500px">

### layouts
- spiral
- double master-stack (2 master windows)
- options for master-stack (2, 3, 4, 6 windows)
- options for centered master (4. 6 windows)
- mirror option (invert existing layout)
- more layouts (ideas needed)

### Theme preview (description)
List of all `herbstclient attr` commands where you can change properties in script amd apply them on the fly. They will be visible until you reload WM and does not yours actual theme. You can also copy them and aply into `autostart` as well to save effects. 

### additional frontend:
- Rofi 
- Eww (widget with layouts)

### wall-menu
- solid color option (just type hex in rofi/dmenu)

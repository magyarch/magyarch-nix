##########################
# title: qtile           #
# tags: config.py        #
# author: xeoncpu        #
##########################


import os
import re
import subprocess
from libqtile import qtile
from libqtile import bar, layout, widget, hook
from libqtile.backend.wayland import InputConfig
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
#from .keys import keys, mod
from libqtile.lazy import lazy
from libqtile.command import lazy
from libqtile.utils import guess_terminal
from qtile_extras import widget
from qtile_extras.widget.decorations import BorderDecoration
from qtile_extras.widget.decorations import RectDecoration
from collections import namedtuple
from typing import List  # noqa: F401
from libqtile.log_utils import logger
from libqtile.confreader import ConfigError

# Startup Applications


@hook.subscribe.startup_once
def autostart():
    if qtile.core.name == "x11":
        autostartscript = "~/.config/qtile/x11-autostart.sh"
    elif qtile.core.name == "wayland":
        autostartscript = "~/.config/qtile/wayland-autostart.sh"

    home = os.path.expanduser(autostartscript)
    subprocess.Popen([home])


if qtile.core.name == "wayland":
    os.environ["XDG_SESSION_DESKTOP"] = "qtile:wlroots"
    os.environ["XDG_CURRENT_DESKTOP"] = "qtile:wlroots"


mod = "mod4"
terminal = "kitty"
home = os.path.expanduser('~')


keys = [

    # ESSENTIALS #

    # Important keys
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "Space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "f", lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",),
    Key([mod, "shift"], "f", lazy.window.toggle_floating(),
        desc="Window floating on/off"),
 #   Key([mod], "t", lazy.spawncmd(), desc="Spawn prompt widget"),
    Key([mod], "b", lazy.hide_show_bar(position='top'), desc="Hide/show top bar"),
    Key([mod], "c", lazy.spawn("power"), desc="Open logot script"),

    # Multimedia keys
    Key([], "XF86MonBrightnessUp", lazy.spawn(
        "brightnessctl set +3%"), desc="Raise brightness level by 3%"),
    Key([], "XF86MonBrightnessDown", lazy.spawn(
        "brightnessctl set 3-%"), desc="Lower brightness level by 3%"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
        "amixer sset Master 3%+"), desc="Raise volume level by 3%"),
    Key([], "XF86AudioLowerVolume", lazy.spawn(
        "amixer sset Master 3%-"), desc="Lower volume level by 3%"),
    Key([], "XF86AudioMute", lazy.spawn("amixer sset Master 1+ toggle"),
        desc="Mute or unmute volume level"),

    # Applications
    Key([mod, "shift"], "p", lazy.spawn("thunar"), desc="File manager"),
    Key([mod, "shift"], "e", lazy.spawn("subl"), desc="Sublime Text"),
    Key([mod], "Return", lazy.spawn("kitty"), desc="Terminal"),
    Key([mod], "w", lazy.spawn("firefox"), desc="Web browser"),
    Key([mod], "p", lazy.spawn("discord"), desc="Discord app"),
    Key([mod], "r", lazy.spawn("kitty -e vifmrun"), desc="Tui file manager"),
    Key([mod], "d", lazy.spawn("dmenu_run"), desc="Dmenu app"),


    # Function Keys
    Key([mod], "F5", lazy.spawn("maimpick"), desc="Screenshot tool"),
    Key([mod], "KP_Home", lazy.spawn("dmenurecord"), desc="Open demenu record"),
    Key([mod], "KP_End", lazy.spawn("live.sh"), desc="Open live.sh"),




    # WINDOW FOCUSING #

    # Change Window Focus
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),

    # Resize Windows
    Key([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),

    # Shift focused window
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Left", lazy.layout.swap_left()),
    Key([mod, "shift"], "Right", lazy.layout.swap_right()),

    # Key([mod, "shift"], "Tab",
    #          lazy.layout.rotate(),
    #         # lazy.layout.flip(),
    #          desc='Switch which side main pane occupies (XmonadTall)'
    #          ),


] 
  
groups = []        


group_names = ("1", "2", "3", "4", "5", "6", "7", "8", "9", "10")

group_layouts = ("MonadTall", "MonadTall", "MonadTall", "MonadTall", "MonadTall", "MonadTall", "MonadTall", "Bsp", "Floating", "Bsp")

group_labels = (" ", " ", " ",  " ", " ",
                " ", " ", " ", " ", " ")



for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
            #  scratchpad=group_scratchpads[i],
        ))


for i in groups:
    if i.name == "10":
        keys.extend([
            # mod1 + letter of group = switch to group
            Key([mod], "0", lazy.group["10"].toscreen(
                toggle=False), desc="Jump to group 10"),

            # mod1 + shift + letter of group = switch to & move focused window to group
            Key([mod, "shift"], "0", lazy.window.togroup("10"),
                desc="Move window to group 10, not following"),
            Key([mod, "control"], "0", lazy.window.togroup(
                "10", switch_group=True), desc="Move window to group 10, follow"),
        ])
    else:
        keys.extend([
            # mod1 + letter of group = switch to group
            Key([mod], i.name, lazy.group[i.name].toscreen(
                toggle=False), desc="Jump to group " + i.name),

            # mod1 + shift + letter of group = switch to & move focused window to group
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
                desc="Move window to group " + i.name + ", not following"),
            Key([mod, "control"], i.name, lazy.window.togroup(
                i.name, switch_group=True), desc="Move window to group " + i.name + ", follow"),
        ])


groups.append(
    ScratchPad(
        'scratchpad',
        [
            DropDown(
                'term',
                'kitty',
                width=0.6,
                height=0.5,
                x=0.2,
                y=0.1,
                opacity=1
            ),
            DropDown(
                'music',
                'kitty -e ncmpcpp',
                width=0.6,
                height=0.5,
                x=0.2,
                y=0.1,
                opacity=1
            ),
            DropDown(
                'audio',
                'pavucontrol',
                width=0.6,
                height=0.5,
                x=0.2,
                y=0.1,
                opacity=1
            ),
            DropDown(
                'chat',
                'chromium --app=https://chat.openai.com',
                width=0.6,
                height=0.5,
                x=0.2,
                y=0.1,
                opacity=1
            ),
            DropDown(
                'file',
                'kitty -e vifm',
                width=0.6,
                height=0.5,
                x=0.2,
                y=0.1,
                opacity=1
            ),
        ]
    )
)

          
keys.extend([
    Key([mod, "shift"], "Return", lazy.group['scratchpad'].dropdown_toggle('term')),
    Key([mod, "shift"], "n", lazy.group['scratchpad'].dropdown_toggle('music')),
    Key([mod, "shift"], "a", lazy.group['scratchpad'].dropdown_toggle('audio')),
    Key([mod, "shift"], "t", lazy.group['scratchpad'].dropdown_toggle('file')),
    Key([mod, "shift"], "c", lazy.group['scratchpad'].dropdown_toggle('chat')),
])


layout_theme = {
    "margin": 15,
    "border_focus": "6272a4",
    "border_normal": "282a36",
    "border_width": 4
}


layouts = [
    layout.Max(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Bsp(**layout_theme),
    layout.RatioTile(**layout_theme),
    layout.Floating()
]


floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
                                      Match(wm_class="confirmreset"), 
                                      Match(wm_class="pavucontrol"),  
                                      Match(wm_class="dialog"),         # dialog boxes
                                      Match(wm_class="download"),       # downloads
                                      Match(wm_class="error"),          # error msgs
                                      Match(wm_class="file_progress"),  # file progress boxes
                                      Match(wm_class='kdenlive'),       # kdenlive
                                      Match(wm_class="makebranch"),     # gitk
                                      Match(wm_class="maketag"),        # gitk
                                      Match(wm_class="notification"),   # notifications
                                      Match(wm_class='pinentry-gtk-2'), # GPG key password entry
                                      Match(wm_class="ssh-askpass"),    # ssh-askpass
                                      Match(wm_class="toolbar"),        # toolbars
                                      Match(wm_class="Yad"),            # yad boxes
                                      Match(title="branchdialog"),      # gitk
                                      Match(title='Confirmation'),      # tastyworks exit box
                                      Match(title='Qalculate!'),        # qalculate-gtk
                                      Match(title="pinentry"),          # GPG key password entry

     ],
     **layout_theme,
     )


app_rules = {
    "Chromium": "1",
    "firefox": "1",
    "Brave-browser": "1",
    "Sublime_text": "3",
    "Subl3": "3",
    "Subl": "3",
    "discord": "2",
    "steam": "6",
    "steam_app_0": "6",
    "mpv": "6",
    "qBittorrent": "6",
    "Thunar": "8"
    #  "Music": "9"
}

app_float_pos = ("st-256color",)


@hook.subscribe.client_new
def grouper(window, windows=app_rules):

    try:
        windowtype = window.window.get_wm_class()[1]
        # logger.warning(f'Ez a groupper {windowtype}')
        # logger.warning(f'Ez a wkeys {windows.keys()}')

        # if the window is in our map
        for app in windows.keys():
            # logger.warning(f'Ez a app {app}')
            if windowtype in app:

                window.togroup(windows[windowtype])
                window.group.cmd_toscreen(toggle=False)
    except Exception as e:
        logger.warning(f'Ez a grouper error: {e}')


# @hook.subscribe.client_urgent_hint_changed
# def go(client):
#     logger.debug("rajt urgent config")
#     client.group.cmd_toscreen()


@hook.subscribe.client_new
def go_float(window, windows=app_float_pos):
    win_cal = window.window.get_name()
    # logger.warning(f'ez az win_cal: {win_cal}')
    # dialog = window.window.get_wm_type() == 'dialog'
    # transient = window.window.get_wm_transient_for()

    count = 0
    for app1 in app_float_pos:
        # logger.warning(f'ez az app1: {app1}')
        if win_cal is not None and win_cal in app1:
            window.floating = True
            # window.cmd_set_size_floating(500, 500)
            my_screen_w = Display(":0").screen().width_in_pixels
            window.float_x = 0
            window.float_y = 0
            win_w = window.cmd_get_size()[0]
            window.tweak_float(x=my_screen_w - win_w - 50, y=50)
            count += 1


widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=18,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                    linewidth=1,
                    padding=5,
                    foreground="#4c566a",
                    background="#282a36"
                ),
                widget.CurrentLayoutIcon(
                    padding=4,
                    scale=0.7,
                    foreground="#d8dee9",
                    background="#282a36"
                ),
                widget.Sep(
                    linewidth=1,
                    padding=5,
                    foreground="#4c566a",
                    background="#282a36"
                ),
                widget.GroupBox(
                    font="JetBrainsMono Nerd Font Bold",
                    fontsize=18,
                    margin_y=2,
                    margin_x=3,
                    padding_y=2,
                    padding_x=3,
                    urgent_alert_method="block",
                    urgent_border="#2e8b57",
                    urgent_text="#000000",
                    disable_drag=True,
                    active="#ebcb8b",
                    inactive="#d8dee9",
                    rounded=False,
                    highlight_method="text",
                    this_current_screen_border="#6272a4",
                    foreground="#6272a4",
                    background="#282a36"
                ),
                widget.Sep(
                    linewidth=1,
                    padding=5,
                    foreground="#4c566a",
                    background="#282a36"
                ),
                widget.Prompt(
                    font="JetBrainsMono Nerd Font",
                    fontsize=18,
                    background="#282a36",
                    foreground="#d8dee9"
                ),
                widget.WindowName(
                    font="JetBrainsMono Nerd Font Bold",
                    fontsize=18,
                    foreground="#d8dee9",
                    background="#282a36"
                ),
                widget.Sep(
                    foreground="#4c566a",
                    background="#282a36",
                    padding=5,
                    linewidth=1
                ),
                widget.NvidiaSensors(
                    foreground="#282a36",
                    background="#282a36",
                    font='JetBrainsMono Nerd Font Bold',
                    fontsize=18,
                    format='GPU: {temp}°C, fan speed: {fan_speed}',
                    #interface='eno1',
                    decorations=[
                        RectDecoration(
                            colour="#c3cdc8",
                            padding_y=3,
                            radius=2,
                            filled=True
                        ),
                    ],
                ),
                widget.Sep(
                    linewidth=1,
                    padding=5,
                    foreground="#4c566a",
                    background="#282a36"
                ),
                widget.CPU(
                    background="#282a36",
                    foreground="#282a36",
                    font="JetBrainsMono Nerd Font Bold",
                    fontsize=18,
                    decorations=[
                        RectDecoration(
                            colour="#ebcb8b",
                            padding_y=3,
                            radius=2,
                            filled=True
                        ),
                    ],),
                widget.ThermalSensor(
                    font="JetBrainsMono Nerd Font",
                    fontsize=18,
                    background="#282a36",
                    foreground="#282a36",
                    tag_sensor='Core 0',
                    decorations=[
                        RectDecoration(
                            colour="#ebcb8b",
                            padding_y=3,
                            radius=2,
                            filled=True
                        ),
                    ],),
                widget.Sep(
                    linewidth=1,
                    padding=5,
                    foreground="4c566a",
                    background="#282a36"
                ),
                widget.Memory(
                    measure_mem='G',
                    foreground="#282a36",
                    background="#282a36",
                    font="JetBrainsMono Nerd Font Bold",
                    fontsize=18,
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('kitty -e htop')},
                    decorations=[
                        RectDecoration(
                            colour="#88c0d0",
                            padding_y=3,
                            radius=2,
                            filled=True
                        ),
                    ],),
                widget.Sep(
                    linewidth=1,
                    padding=5,
                    foreground="#4c566a",
                    background="#282a36"
                ),
                widget.DF(
                    visible_on_warn=False,
                    background="#282a36",
                    foreground="#282a36",
                    font="JetBrainsMono Nerd Font Bold",
                    fontsize=18,
                    decorations=[
                        RectDecoration(
                            colour="#28eb57",
                            padding_y=3,
                            radius=2,
                            filled=True
                        ),
                    ],),
                widget.Sep(
                    linewidth=1,
                    padding=5,
                    background="#282a36",
                    foreground="#4c566a"
                ),
                widget.Clock(
                    foreground="#282a36",
                    background="#282a36",
                    font="JetBrainsMono Nerd Font Bold",
                    fontsize=18,
                    format="%D %H:%M",
                    decorations=[
                        RectDecoration(
                            colour="#d85a3b",
                            padding_y=3,
                            radius=2,
                            filled=True
                        ),
                    ],),
                widget.Sep(
                    linewidth=1,
                    padding=5,
                    foreground="#4c566a",
                    background="#282a36"
                ),
                widget.PulseVolume(
                 foreground="#282a36",
                 background="#282a36",
                 font="JetBrainsMono Nerd Font Bold",
                 fontsize=18,
                 fmt = 'Vol: {}',
                 update_interval=0.2,
                 mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('pavucontrol')},
                 decorations=[
                     RectDecoration(
                        colour="#925da7",
                            padding_y=3,
                            radius=2,
                            filled=True
                     )
                 ],
                 ),
                widget.Sep(
                    linewidth=1,
                    padding=5,
                    foreground="#4c566a",
                    background="#282a36"
                ),
                widget.StatusNotifier(
                    background="#282a36",
                    icon_size=24,           
                    padding=5,
                ),
                widget.Sep(
                    linewidth=1,
                    padding=5,
                    foreground="#4c566a",
                    background="#282a36"
                ),
                 widget.Systray(
                    background = "#282a36",
                    icon_size = 24,
                    padding = 5,
                ),
                # widget.Sep(
                #     linewidth=1,
                #     padding=5,
                #     foreground="#4c566a",
                #     background="#282a36"
                # ),
                widget.OpenWeather(
                    app_key="4cf3731a25d1d1f4e4a00207afd451a2",
                    cityid="3045190",
                    format='{main_temp:.0f}° {icon}',
                    metric=True,
                    font="JetBrainsMono Nerd Font Bold",
                    fontsize=18,
                    background="#282a36",
                    foreground="#d8dee9",
                    decorations=[
                        RectDecoration(
                            colour="#282a36",
                            padding_y=3,
                            radius=2,
                            filled=True
                        ),
                    ],),
                widget.Sep(
                    linewidth=1,
                    padding=5,
                    background="#282a36",
                    foreground="#4c566a"
                ),
            ],
            # Sets bar height
            26,
        ),
        # Set wallpaper
        #     wallpaper="/home/xeoncpu/wall.png",
        #    wallpaper_mode='fill',
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list

main = None

follow_mouse_focus = False
bring_front_click = False
floats_kept_above = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "focus"
reconfigure_screens = False

# When using the Wayland backend, this can be used to configure input devices.
 #wl_input_rules = {
  #     "1160:4122:DELL0A20:00 0488:101A Touchpad": InputConfig(tap=True),
  #}

# Something about java being dumb?
wmname = "LG3D"

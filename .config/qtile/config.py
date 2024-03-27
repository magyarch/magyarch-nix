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
    Key([mod], "d", lazy.spawn("dmenu_run"), desc="Dmenu app"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "Space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "m", lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",),
    Key([mod, "shift"], "f", lazy.window.toggle_floating(),
        desc="Window floating on/off"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn prompt widget"),
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

     #=-/ Scratchpads /-=#
    #Key([mod, "shift"], "Return", lazy.group['scratchpad'].dropdown_toggle('scratchpad')),
   # Key([mod, "shift"], "d", lazy.group['menu'].dropdown_toggle('launch')),
   # Key([mod, "shift"], "c", lazy.group['logout'].dropdown_toggle('exitMenu')),
    #Key([mod, "shift"], "t", lazy.group['music'].dropdown_toggle('music')),
   # Key([mod, "shift"], "F2", lazy.group['edit'].dropdown_toggle('editConf')),
        ]


# Fundamental elements
#keys = init_keys()
#mouse = init_mouse()
#floating_layout = init_floating_layout()
#groups = init_groups()
#dgroups_app_rules = init_rules()
#screens = init_screens()
#widget_defaults = init_widget_defaults()
    
# Append some elements
#keys += init_group_keybindings(groups)
#groups += init_scratchpad()
#keys += init_dropdown_keybindings()

groups = [

          # ScratchPad("music",[DropDown("music", "kitty -e ncmpcpp", x=0.05, y=0.02, width=0.90, height=0.6, on_focus_lost_hide=False)]),
          # ScratchPad("menu",[DropDown("launch", "alacritty -e launch.sh", x=0.33, y=0.02, width=0.35, height=0.95, on_focus_lost_hide=False)]),
          # ScratchPad("logout",[DropDown("exitMenu", "alacritty -e herbst-logout.sh", x=0.4, y=0.2, width=0.20, height=0.20, on_focus_lost_hide=False)]),
          # ScratchPad("scratchpad",[DropDown("scratchpad", "kitty", x=0.12, y=0.02, width=0.75, height=0.6, on_focus_lost_hide=False)]),
          # ScratchPad("edit",[DropDown("editConf", "kitty -e edconf.sh", x=0.795, y=0.01, width=0.20, height=0.98, on_focus_lost_hide=False)])
         ]

# groups = [Group(i) for i in "1234567890"]

# for i in groups:
#     keys.extend(
#         [
#             # Change workspaces
#             Key([mod], i.name, lazy.group[i.name].toscreen()),
#             Key([mod], "Tab", lazy.screen.next_group()),
#             Key([mod, "shift" ], "Tab", lazy.screen.prev_group()),

#             # Move focused window to workspace 1-10 / follow
#             Key([mod, "shift"],i.name,lazy.window.togroup(i.name, switch_group=True), desc="Switch to & move focused window to group {}".format(i.name),),

#             # Moved focused window to workspace 1-10 / stay
#             Key([mod, "control"], i.name, lazy.window.togroup(i.name), desc="move focused window to group {}".format(i.name)),

group_names = ("1", "2", "3", "4", "5", "6", "7", "8", "9", "10")

group_layouts = ("Bsp", "Tile", "Bsp", "Bsp", "bsp",
                 "bsp", "bsp", "bsp", "floating", "bsp")

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


def init_layout_theme():
     return {"margin":10,
             "border_width":4,
             "border_focus": "#6272a4",
             "border_normal": "#282a36"
            }

layout_theme = init_layout_theme()

layout_defaults = dict(
    border_focus="#6272a4",
    border_normal="#282a36",
    border_width=4
)

layouts = [
    #layout.MonadTall(**layout_theme, new_client_position='top'),
    layout.Max(),
    layout.Bsp(
        margin=5,
        fair=True,
        grow_amount=5,
        **layout_defaults,
    ),

    layout.Stack(**layout_theme, num_stacks=2
    ),
    # Try more layouts by unleashing below layouts.
    # layout.Columns(),
    layout.Matrix(),
    # layout.MonadTall(),
    layout.MonadWide(),
    #layout.RatioTile(),
    layout.Tile(
        **layout_defaults,
    ),

    # layout.TreeTab(),
    # layout.VerticalTile(),
    #layout.Zoomy(),
    layout.Floating(
        **layout_defaults,
    ),

]

# floating_layout = layout.Floating(
#     float_rules=[
#         *layout.Floating.default_float_rules,
#         Match(wm_class='makebranch'),
#         Match(wm_class='kitty'),
#         Match(wm_class='maketag'),
#         Match(wm_class='sxiv'),
#         Match(wm_class='feh'),
#         Match(title='branchdialog'),
#         Match(wm_class='Lxappearance'),
#         Match(wm_class='Pavucontrol'),
#         Match(title='Music'),
#         Match(wm_class='ssh-askpass')

#     ],
#     **layout_defaults,
#     )


app_rules = {
    "Chromium": "1",
    "firefox": "1",
    "Brave-browser": "1",
    "Sublime_text": "3",
    "Subl3": "3",
    "Subl": "3",
    "discord": "2",
    "steam": "6",
    "mpv": "6",
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

    # logger.warning(f'ez az count: {count}')
    # if (dialog or transient) and count != 1:
    #     window.floating = True
    #     my_screen_w = Display(":0").screen().width_in_pixels
    #     my_screen_h = Display(":0").screen().height_in_pixels
    #     window.float_x = 0
    #     window.float_y = 0
    #     win_w = window.cmd_get_size()[0]
    #     win_h = window.cmd_get_size()[1]
    #     # logger.warning(my_screen_w)
    #     # logger.warning(my_screen_h)
    #     # logger.warning(win_w)
    #     # logger.warning(win_h)
    #     window.tweak_float(x=(my_screen_w // 2) - (win_w // 2), y=(my_screen_h // 2) - (win_h // 2))


# @hook.subscribe.client_new
# def floating_dialogs(window):
#     dialog = window.window.get_wm_type() == 'dialog'
#     transient = window.window.get_wm_transient_for()
#     if dialog or transient:
#         window.floating = True


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
                    background="#2e3440"
                ),
                widget.CurrentLayoutIcon(
                    padding=4,
                    scale=0.7,
                    foreground="#d8dee9",
                    background="#2e3440"
                ),
                widget.Sep(
                    linewidth=1,
                    padding=5,
                    foreground="#4c566a",
                    background="#2e3440"
                ),
                widget.GroupBox(
                    font="JetBrainsMono Nerd Font Bold",
                    fontsize=18,
                    margin_y=2,
                    margin_x=3,
                    padding_y=2,
                    padding_x=3,
                    borderwidth=0,
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
                    background="#2e3440"
                ),
                widget.Sep(
                    linewidth=1,
                    padding=5,
                    foreground="#4c566a",
                    background="#2e3440"
                ),
                widget.Prompt(
                    font="JetBrainsMono Nerd Font",
                    fontsize=18,
                    background="#2e3440",
                    foreground="#d8dee9"
                ),
                widget.WindowName(
                    font="JetBrainsMono Nerd Font Bold",
                    fontsize=18,
                    foreground="#d8dee9",
                    background="#2e3440"
                ),
                widget.Sep(
                    foreground="#4c566a",
                    background="#2e3440",
                    padding=5,
                    linewidth=1
                ),
                widget.Net(
                    foreground="#2e3440",
                    background="#2e3440",
                    font='JetBrainsMono Nerd Font Bold',
                    fontsize=18,
                    format='{down} ↓↑ {up}',
                    interface='eno1',
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
                    background="#2e3440"
                ),
                widget.CPU(
                    background="#2e3440",
                    foreground="#2e3440",
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
                widget.Sep(
                    linewidth=1,
                    padding=5,
                    foreground="4c566a",
                    background="#2e3440"
                ),
                widget.Memory(
                    measure_mem='G',
                    foreground="#2e3440",
                    background="#2e3440",
                    font="JetBrainsMono Nerd Font Bold",
                    fontsize=18,
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
                    background="#2e3440"
                ),
                widget.DF(
                    visible_on_warn=False,
                    background="#2e3440",
                    foreground="#2e3440",
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
                    background="#2e3440",
                    foreground="#4c566a"
                ),
                widget.Clock(
                    foreground="#2e3440",
                    background="#2e3440",
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
                    background="#2e3440"
                ),
                widget.PulseVolume(
                 foreground="#2e3440",
                 background="#2e3440",
                 font="JetBrainsMono Nerd Font Bold",
                 fontsize=18,
                 fmt = 'Vol: {}',
                 update_interval=0.2,
                 decorations=[
                     RectDecoration(
                        colour="#925da7",
                            padding_y=3,
                            radius=2,
                            filled=True
                     )
                 ],
                 ),

                widget.StatusNotifier(
                    background="#2e3440",
                    icon_size=20,
                    padding=5
                ),
                # widget.Systray(
                #    background = "#2e3440",
                #    icon_size = 20,
                #    padding = 5,
                #    ),
                widget.Sep(
                    linewidth=1,
                    padding=5,
                    foreground="#4c566a",
                    background="#2e3440"
                ),
                widget.OpenWeather(
                    app_key="4cf3731a25d1d1f4e4a00207afd451a2",
                    cityid="3045190",
                    format='{main_temp:.0f}° {icon}',
                    metric=True,
                    font="JetBrainsMono Nerd Font Bold",
                    fontsize=18,
                    background="#2e3440",
                    foreground="#d8dee9",
                    decorations=[
                        RectDecoration(
                            colour="#2e3440",
                            padding_y=3,
                            radius=2,
                            filled=True
                        ),
                    ],),
                widget.Sep(
                    linewidth=1,
                    padding=5,
                    background="#2e3440",
                    foreground="#4c566a"
                ),
            ],
            # Sets bar height
            24,
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
floating_layout = layout.Floating(border_width=2, border_focus="#5e81ac", border_normal="#2e3440",
                                  float_rules=[
                                      # Run the utility of `xprop` to see the wm class and name of an X client.
                                      *layout.Floating.default_float_rules,
                                      Match(wm_class="confirmreset"),  # gitk
                                      Match(wm_class="makebranch"),  # gitk
                                      Match(wm_class="maketag"),  # gitk
                                      Match(title="scratchpad"),  # ssh-askpass
                                      Match(title="branchdialog"),  # gitk
                                      Match(title="music"),  # GPG key password entry
                                  ]
                                  )
auto_fullscreen = True
focus_on_window_activation = "focus"
reconfigure_screens = False

# When using the Wayland backend, this can be used to configure input devices.
# wl_input_rules = {
#       "1160:4122:DELL0A20:00 0488:101A Touchpad": InputConfig(tap=True),
#  }

# Something about java being dumb?
wmname = "LG3D"

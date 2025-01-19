"""
Copyright (c) 2010 Aldo Cortesi
Copyright (c) 2010, 2014 dequis
Copyright (c) 2012 Randall Ma
Copyright (c) 2012-2014 Tycho Andersen
Copyright (c) 2012 Craig Barnes
Copyright (c) 2013 horsik
Copyright (c) 2013 Tao Sauvage

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

"""

# =================================================================
# -----------------------------------------------------------------
# IMPORT LIBS
# -----------------------------------------------------------------
# =================================================================
import os

# import sys
import subprocess
import json
from libqtile import bar, layout, qtile, hook
from libqtile.config import (
    Drag,
    Group,
    Key,
    EzKey,
    Match,
    Screen,
    ScratchPad,
    DropDown,
    KeyChord,
)
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from qtile_extras import widget
from libqtile.backend.wayland.inputs import InputConfig
from qtile_extras.widget.decorations import PowerLineDecoration

# import importlib.util

# =================================================================
# -----------------------------------------------------------------
# SETUP ENVIRONMENT
# -----------------------------------------------------------------
# =================================================================

# --------------------------------------------------------
# DIRECTORIES
# --------------------------------------------------------
my_config = os.path.expanduser("~/.config/")
my_scripts = os.path.expanduser("~/.config/.scripts/")
my_settings = os.path.expanduser("~/.config/.settings/")

# --------------------------------------------------------
# INPUTS
# --------------------------------------------------------
wl_input_rules = {
    "type:keyboard": InputConfig(
        # kb_options="caps:swapescape",
        kb_options="caps:escape_shifted_capslock",
        kb_repeat_rate=90,
        kb_repeat_delay=300,
    )
}

# --------------------------------------------------------
# WAYLAND ENVIRONMENT
# --------------------------------------------------------
# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = "Bibata-Modern-Ice"
wl_xcursor_size = 36

env = {
    # "GBM_BACKEND": "nvidia-drm",
    "XDG_CURRENT_DESKTOP": "Qtile",
    # "__GLX_VENDOR_LIBRARY_NAME": "nvidia",
    # "LIBVA_DRIVER_NAME": "nvidia",
    "XDG_SESSION_TYPE": "wayland",
    "XDG_SESSION_DESKTOP": "Qtile",
    "QT_QPA_PLATFORMTHEME": "qt6ct",
    "QT_QPA_PLATFORM": "wayland",
    "GDK_BACKEND": "wayland",
    "CLUTTER_BACKEND": "wayland",
    "SDL_VIDEODRIVER": "wayland",
    "WLR_NO_HARDWARE_CURSORS": "1",
}


# --------------------------------------------------------
# VARS
# --------------------------------------------------------
terminal = guess_terminal()
home = os.path.expanduser("~")

mod = "mod4"
mod1 = "alt"
mod2 = "control"
modifier_keys = {
    "M": "mod4",
    "A": "mod1",
    "S": "shift",
    "C": "control",
}


# DEFAULT APPS FROM SETTINGS
# -----------------------------------------------
# Default Applications - copied from /include/vars.py
# -----------------------------------------------
my_term = "wezterm"  # (M-return) Launch default terminal
my_term2 = "ghostty"  # (M-t) Launch alternate terminal
my_brows = "brave"  # (M-b) Launch default browser
my_brows2 = "firefox"  # (M-f1) Launch alternate browser
my_brows3 = "firedragon"  # (C-A-b) Launch 2nd alternate browser
my_browsv = "qutebrowser"  # (M-o) Launch VIM-based browser
my_email = "thunderbird"  # (M-A-return) Launch default email client
my_email2 = "bluemail"  # (M-f2) Launch alternate email client
my_editg = "kate"  # (M-f3) Launch GUI text editor
my_editc = "nvim"  # (M-n) Launch console text editor
my_filesg = "pcmanfm-qt"  # (M-S-return) Launch GUI file browser
my_filesc = "wezterm -e yazi"
menu_run = "rofi -config /home/moosicmaan/.config/rofi/dmenu.rasi -show run"
menu_drun = "rofi -config /home/moosicmaan/.config/rofi/config.rasi -show drun"
menu_win = "rofi -config /home/moosicmaan/.config/rofi/config.rasi -show window"
my_music = "spotube"  # (M-m) Launch music player
my_media = "vlc"  # (M-S-m) Launch media player
my_office = "libreoffice"  # (M-f4) Launch office suite
my_image = "gimp"  # (M-f5) Launch GUI image editor
emacsd = "emacs --daemon=serve"  # (M-S-d) EMACS daemon
emacsc = "emacsclient -c -a 'emacs'"  # (M-e) EMACS client
emojis = "emote"  # (M-i) Launch emoji browser
my_stream = "obs"  # (M-f5) Launch streaming software


# --------------------------------------------------------
# COLORS
# --------------------------------------------------------
def init_colors():
    return [
        ["#2F343Fcc", "#2F343Fcc"],  # color 0
        ["#111111ee", "333333aa", "#4a4a46aa", "#00000044"],  # color 1
        ["#c0c5ce", "#c0c5ce"],  # color 2
        ["#fba922", "#fba922"],  # color 3
        ["#3384d0", "#3384d0"],  # color 4
        ["#f3f4f5", "#f3f4f5"],  # color 5
        ["#fba92222", "#f3f4f5ff", "#fff92222"],  # color 6
        ["#e2efe022", "#e2efe0aa", "#e2efe022"],  # color 7
        ["#6790eb22", "#6790ebff", "#6790eb22"],  # color 8
        ["#a9a9a922", "#a9a9a9ff", "#a9a9a922"],  # color 9
    ]


colors = init_colors()

# Pywal Colors
Colors = os.path.expanduser("~/.cache/wal/colors.json")
colordict = json.load(open(Colors))
Color0 = colordict["colors"]["color0"]
Color1 = colordict["colors"]["color1"]
Color2 = colordict["colors"]["color2"]
Color3 = colordict["colors"]["color3"]
Color4 = colordict["colors"]["color4"]
Color5 = colordict["colors"]["color5"]
Color6 = colordict["colors"]["color6"]
Color7 = colordict["colors"]["color7"]
Color8 = colordict["colors"]["color8"]
Color9 = colordict["colors"]["color9"]
Color10 = colordict["colors"]["color10"]
Color11 = colordict["colors"]["color11"]
Color12 = colordict["colors"]["color12"]
Color13 = colordict["colors"]["color13"]
Color14 = colordict["colors"]["color14"]
Color15 = colordict["colors"]["color15"]


# --------------------------------------------------------
# WINDOW RULES
# --------------------------------------------------------
@hook.subscribe.client_new
def set_floating(window):
    if (
        window.window.get_wm_transient_for() | window.window.get_wm_type()
        in floating_types
    ):
        window.floating = True


floating_types = ["notification", "toolbar", "splash", "dialog"]
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    fullscreen_border_width=0,
    border_focus=colors[5],
    border_normal=colors[1],
    border_width=3,
    margin=9,
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(title="galculator"),
        Match(wm_class="confirm"),
        Match(wm_class="dialog"),
        Match(wm_class="download"),
        Match(wm_class="error"),
        Match(wm_class="file_progress"),
        Match(wm_class="notification"),
        Match(wm_class="splash"),
        Match(wm_class="toolbar"),
        Match(wm_class="feh"),
        Match(wm_class="garuda-assistant"),
        Match(wm_class="garuda-welcome"),
        Match(wm_class="garuda-gamer"),
        Match(wm_class="garuda-boot-options"),
        Match(wm_class="garuda-settings-manager"),
        Match(wm_class="garuda-network-assistant"),
        Match(wm_class="waypaper"),
        Match(wm_class="org.pulseaudio.pavucontrol"),
        Match(wm_class="archlinux-logout"),
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
)
auto_fullscreen = True
focus_on_window_activation = "focus"  # or smart
# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True


# =================================================================
# -----------------------------------------------------------------
# KEYBINDINGS
# -----------------------------------------------------------------
# =================================================================
def window_to_previous_screen(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen:
            qtile.cmd_to_screen(i - 1)


def window_to_next_screen(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen:
            qtile.cmd_to_screen(i + 1)


@lazy.layout.function
def change_layout_gap(layout, adjustment):
    if adjustment < 0 and layout.margin <= 0:
        return
    layout.margin += adjustment
    layout.cmd_reset()


# -----------------------------------------------------------------
# USING KEY AND EzKEY PATTERNS
# -----------------------------------------------------------------
keys = [
    # -----------------------------------------------------------------
    # APPLICATIONS
    # -----------------------------------------------------------------
    EzKey("M-<Return>", lazy.spawn(my_term), desc="Launch terminal"),
    EzKey("M-A-<Return>", lazy.spawn(my_email), desc="Launch email"),
    EzKey("M-S-<Return>", lazy.spawn(my_filesg), desc="Launch file browser"),
    EzKey("M-b", lazy.spawn(my_brows), desc="Launch web browser"),
    EzKey("M-i", lazy.spawn("emote"), desc="Launch emoticon browser"),
    EzKey("M-e", lazy.spawn("emacsclient -c -a 'emacs'"), desc="Launch emacs client"),
    EzKey("M-S-e", lazy.spawn("emacs --daemon=serve"), desc="Launch emacs server"),
    EzKey("M-o", lazy.spawn(my_browsv), desc="Launch qutebrowser"),
    EzKey("M-t", lazy.spawn(my_term2), desc="Launch alacritty"),
    EzKey("M-m", lazy.spawn(my_music), desc="Launch music"),
    EzKey("M-v", lazy.spawn(my_media), desc="Launch media player"),
    EzKey("M-S-p", lazy.spawn(menu_drun), desc="Launch Rofi menu"),
    EzKey("M-p", lazy.spawn(menu_run), desc="Launch Rofi prompt"),
    EzKey("M-C-p", lazy.spawn(menu_win), desc="Launch Rofi windows"),
    EzKey(
        "M-A-i",
        lazy.group["scratchpad"].dropdown_toggle("term"),
        desc="Terminal Scratchpad",
    ),
    EzKey(
        "M-A-l",
        lazy.group["scratchpad"].dropdown_toggle("btop"),
        desc="BTOP Scratchpad",
    ),
    EzKey(
        "M-A-j",
        lazy.group["scratchpad"].dropdown_toggle("yazi"),
        desc="Yazi Scratchpad",
    ),
    EzKey(
        "M-A-p",
        lazy.group["scratchpad"].dropdown_toggle("moosic"),
        desc="MusikCube Scratchpad",
    ),
    EzKey(
        "M-A-y",
        lazy.group["scratchpad"].dropdown_toggle("qtileshell"),
        desc="Qtile Shell Scratchpad",
    ),
    EzKey(
        "M-A-v",
        lazy.group["scratchpad"].dropdown_toggle("volumectl"),
        desc="Pulse Volume Control Scratchpad",
    ),
    EzKey(
        "M-A-n",
        lazy.group["scratchpad"].dropdown_toggle("neovide"),
        desc="Neovide Scratchpad",
    ),
    KeyChord(
        [mod],
        "n",
        [
            Key([], "m", lazy.spawn("neovide"), desc="Launch neovide"),
            Key([], "c", lazy.spawn("neovide ~/.config/"), desc="Open configs"),
            Key(
                [],
                "w",
                lazy.spawn("neovide ~/.config/waybar/"),
                desc="Open Waybar configs",
            ),
            Key(
                [],
                "s",
                lazy.spawn("neovide ~/.config/.scripts/"),
                desc="Open scripts folder",
            ),
            Key(
                [],
                "q",
                # lazy.spawn("jdb_qtile_config"),
                lazy.spawn("neovide ~/.config/qtile/"),
                desc="Edit Qtile config",
            ),
            Key(
                [],
                "h",
                # lazy.spawn("jdb_hypr_config"),
                lazy.spawn("neovide ~/.config/hypr/"),
                desc="Edit Hyprland config",
            ),
        ],
    ),
    # -----------------------------------------------------------------
    # FUNCTION KEYS
    # -----------------------------------------------------------------
    EzKey("M-<F1>", lazy.spawn(my_brows2), desc="Launch web browser"),
    EzKey("M-<F2>", lazy.spawn(my_email2), desc="Launch email"),
    EzKey("M-<F3>", lazy.spawn(my_filesg), desc="Launch file browser"),
    EzKey("M-<F4>", lazy.spawn(my_editg), desc="Launch graphical editor"),
    EzKey("M-<F5>", lazy.spawn(my_image), desc="Launch GIMP"),
    EzKey("M-<F6>", lazy.spawn(my_media), desc="Launch Media Player"),
    EzKey("M-<F7>", lazy.spawn("obs"), desc="Launch OBS"),
    EzKey("M-<F8>", lazy.spawn("zoom"), desc="Launch zoom"),
    EzKey("M-<F9>", lazy.spawn("skypeforlinux"), desc="Launch Skype"),
    # -----------------------------------------------------------------
    # ACTIONS
    # -----------------------------------------------------------------
    EzKey("M-<space>", lazy.next_layout(), desc="Toggle between layouts"),
    EzKey("M-q", lazy.window.kill(), desc="Kill focused window"),
    EzKey("M-C-x", lazy.window.kill(), desc="Kill focused window"),
    EzKey("M-S-f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),
    EzKey("M-f", lazy.window.toggle_floating(), desc="Toggle floating"),
    EzKey("M-C-r", lazy.reload_config(), desc="Reload the config"),
    EzKey("M-S-r", lazy.reload_config(), desc="Reload the config"),
    EzKey(
        "M-S-q",
        lazy.spawn(
            "rofi -show powermenu -config ~/.config/rofi/config-compact.rasi -modi powermenu:~/.config/.scripts/jb-rofi-power.sh"
        ),
        desc="Logout menu",
    ),
    EzKey("C-A-<delete>", lazy.spawn("wlogout"), desc="Logout menu"),
    EzKey(
        "C-A-k",
        lazy.spawn("/home/moosicmaan/.config/.scripts/toggle_kbd.sh"),
        desc="Toggle kmonad",
    ),
    EzKey(
        "C-A-j",
        lazy.spawn("/home/moosicmaan/.config/.scripts/toggle_lap_kbd.sh"),
        desc="toggle keyboard layout",
    ),
    EzKey(
        "M-S-w",
        lazy.spawn("/home/moosicmaan/.config/.scripts/wallpaper.sh random qtile"),
        desc="Random Wallpaper change",
    ),
    EzKey(
        "M-C-w",
        lazy.spawn("/home/moosicmaan/.config/.scripts/wallpaper.sh select qtile"),
        desc="Choose Wallpaper change",
    ),
    EzKey("M-w", lazy.hide_show_bar(), desc="Toggles the bar on that monitor"),
    # -----------------------------------------------------------------
    # WINDOWS
    # -----------------------------------------------------------------
    EzKey("M-h", lazy.layout.left(), desc="Move focus to left"),
    EzKey("M-l", lazy.layout.right(), desc="Move focus to right"),
    EzKey("M-j", lazy.layout.down(), desc="Move focus down"),
    EzKey("M-k", lazy.layout.up(), desc="Move focus up"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    EzKey("M-S-h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    EzKey("M-S-l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    EzKey("M-S-j", lazy.layout.shuffle_down(), desc="Move window down"),
    EzKey("M-S-k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    EzKey(
        "M-C-l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        # desc="Grow window to the right",
    ),
    EzKey(
        "M-C-h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        # desc="Grow window to the left",
    ),
    EzKey(
        "M-C-k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        # desc="Grow window up",
    ),
    EzKey(
        "M-C-j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        # desc="Grow window down",
    ),
    # MOVE WINDOW TO NEXT SCREEN
    EzKey(
        "M-S-<Right>",
        lazy.function(window_to_next_screen, switch_screen=True),
        desc="Move focused window to the screen on the right",
    ),
    EzKey(
        "M-S-<Left>",
        lazy.function(window_to_previous_screen, switch_screen=True),
        desc="Move focused window to the screen on the left",
    ),
    EzKey("M-S-n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # SWITCH FOCUS TO THE OTHER MONITOR
    EzKey("M-<period>", lazy.next_screen(), desc="Next monitor"),
    EzKey("M-<comma>", lazy.next_screen(), desc="Next monitor"),
    # Increase/Decrease Gaps
    EzKey("M-g", change_layout_gap(adjustment=-1), desc="Decrease gaps by 1"),
    EzKey("M-S-g", change_layout_gap(adjustment=1), desc="Increase gaps by 1"),
    # -----------------------------------------------------------------
    # MULTIMEDIA/FN KEYS
    # -----------------------------------------------------------------
    Key(
        [],
        "XF86MonBrightnessUp",
        lazy.spawn("brightnessctl -q s +10%"),
        desc="Increase brightness",
    ),
    Key(
        [],
        "XF86MonBrightnessDown",
        lazy.spawn("brightnessctl -q s 10%-"),
        desc="Decease brightness",
    ),
    Key(
        [],
        "XF86ZoomIn",
        lazy.spawn("brightnessctl -q s +10%"),
        desc="Increase brightness",
    ),
    Key(
        [],
        "XF86ZoomOut",
        lazy.spawn("brightnessctl -q s 10%-"),
        desc="Decease brightness",
    ),
    Key(
        [],
        "XF86AudioMute",
        lazy.spawn("pactl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
        desc="Mute Audio",
    ),
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"),
        desc="Lower Volume",
    ),
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"),
        desc="Raise Volume",
    ),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc="Audio Play"),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc="Audio Next"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc="Audio Previous"),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop"), desc="Audio Stop"),
    Key([], "XF86Calculator", lazy.spawn("galculator"), desc="Calculator"),
    # Key([], "0x10081244", lazy.spawn("kitty"), desc="launch terminal"),
]

""""
Add key bindings to switch VTs in Wayland.
We can't check qtile.core.name in default config
as it is loaded before qtile is started.
We,therefore, defer the check until the key binding
is run by using .when(func=...)

"""
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )

# -----------------------------------------------------------------
# MOUSE CONFIGURATION
# -----------------------------------------------------------------
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
]


# =================================================================
# -----------------------------------------------------------------
# WORKSPACES/GROUPs
# -----------------------------------------------------------------
# =================================================================
groups = []
group_names = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
]
group_labels = [
    "I",
    "II",
    "III",
    "IV",
    "V",
    "VI",
    "VII",
    "VIII",
    "IX",
    "X",
]
# group_labels = [
#     "Music",
#     "Web",
#     "Video",
#     "Mail",
#     "Notes",
#     "Ref",
#     "Term",
#     "Edit",
#     "Files",
#     "Work",
# ]
# group_labels = [
#     "",
#     "",
#     "",
#     "",
#     "",
#     "",
#     "",
#     "",
#     "",
#     "",
# ]
group_layouts = [
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
    "TreeTab",
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
    "Max",
]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        )
    )

for n in groups:
    keys.extend(
        [
            # CHANGE WORKSPACES
            Key([mod], n.name, lazy.group[n.name].toscreen()),
            Key([mod], "Tab", lazy.screen.next_group()),
            Key([mod, "shift"], "Tab", lazy.screen.prev_group()),
            Key(["mod1"], "Tab", lazy.screen.next_group()),
            Key(["mod1", "shift"], "Tab", lazy.screen.prev_group()),
            # MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND STAY ON WORKSPACE
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
            # MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND FOLLOW MOVED WINDOW TO WORKSPACE
            Key(
                [mod, "shift"],
                n.name,
                lazy.window.togroup(n.name),
                lazy.group[n.name].toscreen(),
            ),
        ]
    )


groups.append(
    ScratchPad(
        "scratchpad",
        [
            DropDown(
                "term",
                "wezterm",
                x=0.05,
                y=0.02,
                height=0.8,
                width=0.9,
                border_width=4,
                opacity=1.0,
                on_focus_lost_hide=False,
            ),
            DropDown(
                "btop",
                "wezterm -e btop",
                x=0.05,
                y=0.02,
                width=0.9,
                height=0.8,
                opacity=1.0,
                on_focus_lost_hide=False,
            ),
            DropDown(
                "yazi",
                "wezterm -e yazi",
                x=0.05,
                y=0.02,
                width=0.9,
                height=0.8,
                opacity=1.0,
                on_focus_lost_hide=False,
            ),
            DropDown(
                "moosic",
                "wezterm -e musikcube",
                x=0.05,
                y=0.02,
                width=0.9,
                height=0.8,
                opacity=1.0,
                on_focus_lost_hide=False,
            ),
            DropDown(
                "qtileshell",
                "wezterm -e qtile shell",
                x=0.05,
                y=0.02,
                width=0.9,
                height=0.8,
                opacity=1.0,
                on_focus_lost_hide=False,
            ),
            DropDown(
                "volumectl",
                "pavucontrol",
                x=0.05,
                y=0.02,
                width=0.9,
                height=0.8,
                opacity=1.0,
                on_focus_lost_hide=False,
            ),
            DropDown(
                "neovide",
                "neovide",
                x=0.05,
                y=0.02,
                width=0.9,
                height=0.8,
                opacity=1.0,
                on_focus_lost_hide=False,
            ),
        ],
    )
)


# =================================================================
# -----------------------------------------------------------------
# LAYOUTS
# -----------------------------------------------------------------
# =================================================================
layouts = [
    layout.Max(),
    layout.TreeTab(),
    layout.Matrix(
        align=0,
        border_focus=colors[5],
        # border_normal=colors[1],
        border_normal=Color1,
        border_width=2,
        change_ratio=0.05,
        change_size=20,
    ),
    layout.MonadTall(
        align=0,
        # border_focus=Color5,
        border_focus=colors[5],
        # border_normal=colors[1],
        border_normal=Color1,
        border_width=2,
        change_ratio=0.05,
        change_size=20,
        margin=9,
        max_ratio=0.80,
        min_ratio=0.25,
        min_secondary_size=85,
        new_client_position="after_current",
        ratio=0.50,
    ),
    layout.MonadWide(
        align=0,
        border_focus=colors[5],
        # border_normal=colors[1],
        border_normal=Color1,
        border_width=2,
        change_ratio=0.05,
        change_size=20,
        margin=9,
        max_ratio=0.80,
        min_ratio=0.25,
        min_secondary_size=85,
        new_client_position="after_current",
        ratio=0.50,
    ),
    layout.RatioTile(
        align=0,
        border_focus=colors[5],
        # border_normal=colors[1],
        border_normal=Color1,
        border_width=2,
        change_ratio=0.05,
        change_size=20,
    ),
    layout.VerticalTile(
        align=0,
        border_focus=colors[5],
        # border_normal=colors[1],
        border_normal=Color1,
        border_width=2,
        change_ratio=0.05,
        change_size=20,
    ),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Zoomy(),
    # layout.Bsp(),
    # layout.Columns(
    #     align=0,
    #     border_focus=colors[5],
    #     border_normal=colors[1],
    #     border_width=2,
    #     change_ratio=0.05,
    #     change_size=20,
    #     margin=9,
    # ),
    # layout.Tile(
    #     align=0,
    #     border_focus=colors[5],
    #     border_normal=colors[1],
    #     border_width=2,
    #     change_ratio=0.05,
    #     change_size=20,
    #     margin=9,
    # ),
]


# =================================================================
# -----------------------------------------------------------------
# BARS/SCREENS/WIDGETS
# -----------------------------------------------------------------
# =================================================================
def init_widgets_defaults():
    return dict(
        padding=2,
        font="SauceCodePro Nerd Font",
        fontsize=14,
        fontshadow="000000",
        foreground=colors[5],
        # background=colors[1],
        background=Color10 + ".1",
        active=colors[5],
        inactive=colors[4],
        other_current_screen_border=colors[9],
        other_screen_border=colors[8],
        this_current_screen_border=colors[6],
        this_screen_border=colors[7],
        border_width=1,
        borderwidth=2,
        line_width=1,
        rounded=False,
    )


# --------------------------------------------------------
# Decorations
# https://qtile-extras.readthedocs.io/en/stable/manual/how_to/decorations.html
# --------------------------------------------------------
decor_left = {
    "decorations": [
        PowerLineDecoration(
            # path="arrow_left",
            path="rounded_left",
            # path="forward_slash",
            # path=[
            #     (0, 0),
            #     (0.5, 0),
            #     (0.5, 0.25),
            #     (1, 0.25),
            #     (1, 0.75),
            #     (0.5, 0.75),
            #     (0.5, 1),
            #     (0, 1),
            # ],
            # path="back_slash",
            shift=8,
            size=10,
        )
    ],
}

decor_right = {
    "decorations": [
        PowerLineDecoration(
            # path="arrow_right",
            path="rounded_right",
            # path="forward_slash",
            # path=[
            #     (0, 0),
            #     (0.5, 0),
            #     (0.5, 0.25),
            #     (1, 0.25),
            #     (1, 0.75),
            #     (0.5, 0.75),
            #     (0.5, 1),
            #     (0, 1),
            # ],
            # path="back_slash",
            shift=8,
            size=10,
        )
    ],
}


# -----------------------------------------------------------------
# WIDGET LISTS
# -----------------------------------------------------------------
def init_widgets_list():
    widgets_list = [
        widget.Sep(
            background=colors[0],
            linewidth=0,
            padding=8,
        ),
        widget.GroupBox(
            background=colors[0],
            **decor_left,
        ),
        widget.Sep(
            background=colors[0],
            **decor_left,
            linewidth=0,
            padding=10,
        ),
        widget.WindowName(
            scroll=True,
            width=500,
            background=Color8 + ".8",
            **decor_left,
            padding=8,
        ),
        widget.Mpris2(
            poll_interval=1,
            format="{xesam:title} - {xesam:album} - {xesam:artist}",
            no_metadata_text="Nothing to display",
            background=Color3 + ".8",
            **decor_left,
        ),
        widget.Spacer(
            length=bar.STRETCH,
            **decor_right,
        ),
        widget.Sep(
            background=Color8 + ".8",
            **decor_right,
            linewidth=0,
            padding=10,
        ),
        widget.TextBox(
            # font="FontAwesome",
            font="Space Mono Nerd Font",
            background=Color5 + ".8",
            foreground=colors[4],
            **decor_right,
            text="  ",
            fontsize=14,
            padding=0,
        ),
        widget.NetGraph(
            bandwidth="down",
            interface="auto",
            fill_color=colors[8],
            foreground=colors[2],
            graph_color=colors[8],
            border_color=colors[2],
            margin_y=5,
            background=Color5 + ".8",
            **decor_right,
        ),
        widget.Sep(
            background=Color5 + ".8",
            **decor_right,
            linewidth=0,
            padding=10,
            scale=0.7,
        ),
        widget.TextBox(
            # font="FontAwesome",
            font="Space Mono Nerd Font",
            text="  ",
            foreground=colors[4],
            padding=0,
            fontsize=14,
            background=Color3 + ".8",
            **decor_right,
        ),
        widget.MemoryGraph(
            bandwidth="down",
            interface="auto",
            fill_color=colors[8],
            graph_color=colors[8],
            border_color=colors[2],
            margin_y=5,
            background=Color3 + ".8",
            **decor_right,
        ),
        widget.Sep(
            background=Color3 + ".8",
            **decor_right,
            linewidth=0,
            padding=10,
            scale=0.7,
        ),
        widget.TextBox(
            # font="FontAwesome",
            font="Space Mono Nerd Font",
            text="  ",
            padding=0,
            fontsize=14,
            foreground=colors[4],
            background=Color2 + ".8",
            **decor_right,
        ),
        widget.CPUGraph(
            border_color=colors[2],
            fill_color=colors[8],
            graph_color=colors[8],
            margin_y=5,
            core="all",
            type="box",
            background=Color2 + ".8",
            **decor_right,
        ),
        widget.Sep(
            background=Color2 + ".8",
            **decor_right,
            linewidth=0,
            padding=10,
            scale=0.7,
        ),
        widget.UPowerWidget(
            spacing=0,
            battery_name="BAT0",
            margin=0,
            background=Color6 + ".8",
            **decor_right,
        ),
        widget.Battery(
            update_interval=10,
            background=Color6 + ".8",
            **decor_right,
        ),
        widget.Sep(
            background=Color6 + ".8",
            **decor_right,
            linewidth=0,
            padding=10,
            scale=0.7,
        ),
        widget.TextBox(
            font="FontAwesome",
            text="  ",
            foreground=colors[4],
            background=Color9 + ".8",
            **decor_right,
            padding=0,
            fontsize=16,
        ),
        # widget.AnalogueClock(
        #     face_background=colors[0],
        #     face_shape="circle",
        #     hour_size=1,
        #     minute_size=1,
        #     hour_length=0.6,
        #     minute_length=0.9,
        #     margin=5,
        #     padding=1,
        #     background=Color9 + ".8",
        #     **decor_right,
        # ),
        widget.Clock(
            format="%Y-%m-%d %H:%M",
            background=Color9 + ".8",
            **decor_right,
        ),
        widget.Sep(
            background=Color9 + ".8",
            **decor_right,
            linewidth=0,
            padding=10,
            scale=0.7,
        ),
        widget.StatusNotifier(
            show_menu_icons=True,
            icon_theme="Dracula",
            icon_size=18,
            menu_icon_size=14,
            padding=4,
            background=colors[0],
            # background=Color11 + ".8",
            **decor_right,
        ),
        # widget.Sep(
        #     background=Color11 + ".8",
        #     **decor_right,
        #     linewidth=0,
        #     padding=10,
        #     scale=0.7,
        # ),
        widget.CurrentScreen(
            background=colors[0],
            **decor_right,
        ),
        # widget.CurrentLayout(),
        widget.CurrentLayoutIcon(
            background=colors[0],
            **decor_right,
            scale=0.7,
        ),
        widget.Sep(
            background=colors[0],
            linewidth=0,
            padding=5,
        ),
    ]
    return widgets_list


def init_widgets_list_2():
    widgets_list = [
        widget.Sep(
            background=colors[0],
            linewidth=0,
            padding=8,
        ),
        widget.GroupBox(
            background=colors[0],
            **decor_left,
        ),
        widget.Sep(
            background=colors[0],
            **decor_left,
            linewidth=0,
            padding=10,
        ),
        widget.WindowName(
            scroll=True,
            width=500,
            background=Color8 + ".8",
            **decor_left,
            padding=8,
        ),
        widget.Spacer(
            length=bar.STRETCH,
            **decor_right,
        ),
        widget.Sep(
            background=Color8 + ".8",
            **decor_right,
            linewidth=0,
            padding=10,
        ),
        widget.PulseVolume(
            background=colors[0],
            **decor_right,
            mode="icon",
        ),
        widget.CurrentScreen(
            background=colors[0],
            **decor_right,
        ),
        # widget.CurrentLayout(),
        widget.CurrentLayoutIcon(
            background=colors[0],
            **decor_right,
            scale=0.7,
        ),
        widget.Sep(
            background=colors[0],
            linewidth=0,
            padding=10,
        ),
    ]
    return widgets_list


# -----------------------------------------------------------------
# SCREENS/BARS
# -----------------------------------------------------------------
def init_screens():
    return [
        Screen(
            top=bar.Bar(
                # widgets=init_widgets_screen1(),
                widgets=init_widgets_list(),
                size=16,
                opacity=1.0,
                margin=[4, 0, 0, 0],
            ),
        ),
        Screen(
            bottom=bar.Bar(
                # widgets=init_widgets_screen2(),
                widgets=init_widgets_list_2(),
                size=16,
                opacity=1.0,
                margin=[0, 0, 4, 0],
            ),
        ),
    ]


# WIDGET DEFAULTS
widget_defaults = init_widgets_defaults()
# SET UP SCREENS
screens = init_screens()

dgroups_key_binder = None
dgroups_app_rules = []


main = None


# =================================================================
# -----------------------------------------------------------------
# HOOKS
# -----------------------------------------------------------------
# =================================================================
@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser("~")
    subprocess.call([home + "/.config/qtile/scripts/autostart.sh"])


wmname = "LG3D"

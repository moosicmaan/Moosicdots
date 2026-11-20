#!/usr/bin/env bash

# dwl's IPC patch handles compositor status separately.
# Close stdin so dwl's startup process doesn't wait for
# an external status consumer.
# exec <&-

# Launch applications under UWSM management.
dunst &
wl-paste --watch cliphist store &
garuda-system-maintenance &
"$HOME/.config/.scripts/ut-bluelight" &
"$HOME/.config/.scripts/ut-save-env"
# Wallpaper daemon, then initialize wallpaper.
# --taking out wallpaper which can be added
# later during the session
# awww-daemon &
# sleep 1
# "$HOME/.config/.scripts/ut-wallpaper" --init &
"$HOME/.config/.scripts/wb-launch" &

if [[ ! "$UWSM_SESSION" ]]; then
    echo "POPULATING ENVIRONMENT for DWL"
    # =====================================================
    # -----------------------------------------------------
    # ENVIRONMENT VARIABLES
    # -----------------------------------------------------
    # =====================================================
    # echo "$(date) - START in uwsm/env setting environment" >>"$HOME/.config/hypr/start.log"
    export GTK2_RC_FILES=$HOME/.gtkrc-2.0

    # SESSION
    export XDG_SESSION_DESKTOP=dwl
    export XDG_CURRENT_DESKTOP=DWL

    export UWSM_SESSION_TYPE=

    # GTK
    export MOZ_ENABLE_WAYLAND=1 # only start firefox in wayland mode and no other GTK apps
    export MOZ_DBUS_REMOTE=1    # fixes firefox is already running, but is not responding
    export MOZ_WAYLAND_USE_VAAPI=1
    export GDK_BACKEND=wayland,x11 # GTK: Use wayland if available. If not: try x11, then any other GDK backend.
    # export GDK_SCALE,2

    # elementary
    export ECORE_EVAS_ENGINE=wayland-egl
    export ELM_ENGINE=wayland_egl

    # java
    # export _JAVA_AWT_WM_NONREPARENTING=1
    export NO_AT_BRIDGE=1
    export BEMENU_BACKEND=wayland

    # sdl
    export SDL_VIDEODRIVER=wayland # this can prevent programs from starting old sdl games. therefore, this should be set per app instead of globally.

    # QT
    export QT_QPA_PLATFORMTHEME=qt6ct
    export QT_QPA_PLATFORM=wayland
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1 # Disables window decorations on Qt applications
    # export QT_STYLE_OVERRIDE,kvantum

    # User preferences
    export UWSM_SESSION=false

fi

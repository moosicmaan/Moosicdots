# =====================================================
# -----------------------------------------------------
# ENVIRONMENT VARIABLES
# -----------------------------------------------------
# =====================================================
env = GTK2_RC_FILES,$HOME/.gtkrc-2.0
env = QT_QPA_PLATFORM,wayland

# Session
env = XDG_SESSION_TYPE,wayland
env = XDG_SESSION_DESKTOP,hyprland
env = XDG_CURRENT_DESKTOP,Hyprland

# GTK
env = MOZ_ENABLE_WAYLAND,1             # only start firefox in wayland mode and no other GTK apps
env = MOZ_DBUS_REMOTE,1                # fixes firefox is already running, but is not responding
env = MOZ_WAYLAND_USE_VAAPI,1
env = GDK_BACKEND,wayland,x11,*            # this can prevent programs from starting (e.g. chromium and electron apps). therefore, this should be set per app instead of globally.
# env = GDK_SCALE,2

# QT
env = QT_QPA_PLATFORMTHEME,qt6ct
env = QT_QPA_PLATFORM,wayland;xcb
env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1 # Disables window decorations on Qt applications
env = QT_STYLE_OVERRIDE,kvantum

# XDG
env = XDG_CONFIG_HOME,$HOME/.config
env = EDITOR,nvim
env = BROWSER,zen-browser
env = TERM,xterm-256color
env = MAIL,thunderbird

# # Nvidia Specific (second monitor)
# env = LIBVA_DRIVER_NAME,nvidia
# env = GBM_BACKEND,nvidia-drm
# env = __GLX_VENDOR_LIBRARY_NAME,nvidia
# use the integrated card first, and then use nvidia card if needed
# env = AQ_DRM_DEVICES,/dev/dri/card2:/dev/dri/card1

# --------------------------others from garuda----------------------------------------------
# # clutter
# #export CLUTTER_BACKEND=wayland          # this can prevent programs from starting. therefore, this should be set per app instead of globally.
#
# # java
# export _JAVA_AWT_WM_NONREPARENTING=1
# export NO_AT_BRIDGE=1
# export BEMENU_BACKEND=wayland
#
# # sdl
# export SDL_VIDEODRIVER=wayland           # this can prevent programs from starting old sdl games. therefore, this should be set per app instead of globally.

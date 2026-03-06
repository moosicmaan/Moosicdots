export PATH="$HOME/.config/.scripts:$PATH"
export JBSTARTSCRIPT=".profile"

# export TERM=xterm-256color
export TERMINAL=kitty
export TERMINAL_EMULATOR=kitty
export BROWSER=zen-browser
export EDITOR=nvim
export VISUAL=kate
export SUDO_EDITOR=vim
export XDG_CONFIG_HOME=$HOME/.config
export EMAIL=thunderbird
export WHAT="Jason is a turnip"
export WLR_NO_HARDWARE_CURSORS=1
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
export XDG_CONFIG_HOME=$HOME/.config
export MOZ_DBUS_REMOTE=1 # fixes firefox is already running, but is not responding
export MOZ_WAYLAND_USE_VAAPI=1
export NO_AT_BRIDGE=1
export QT_QPA_PLATFORMTHEME=qt6ct
export XDG_MENU_PREFIX=arch-
export AMD_VULKAN_ICD=RADV

# Setup fzf
export FZF_CTRL_T_OPTS="-m \
--tmux=75% \
--margin=2%,2% \
--scroll-off=3 \
--border=rounded \
--layout=reverse \
--border-label='╢ FZF Find ╟' \
--preview='bat -n --color=always {}' \
--info=hidden \
--header='<TAB> for MULTI' \
--color='dark,border:bright-cyan,header:italic:yellow,prompt:yellow' \
--walker-skip=.git,node_modules,target,.bluemail,.thunderbird,.firedragon,.mozilla,BraveSoftware,.steam,.rustup,.cache,.local,emacs,heroic,.npm,.nuget,Heroic \
--preview-label=' ~ Preview ~ ' \
--prompt='FIND ▶ ' \
--pointer='→' \
--marker='✓'"

export FZF_CTRL_R_OPTS="--height 85% \
--tmux=75% \
--margin=2%,2% \
--scroll-off=3 \
--preview='echo {}' \
--preview-window='right,40%,wrap' \
--border=rounded \
--layout=reverse \
--border-label='╢ FZF History ╟' \
--info=hidden \
--color='dark,border:bright-cyan,header:italic:yellow,prompt:yellow' \
--prompt='FIND ▶ ' \
--pointer='→' \
--marker '✓'"

export FZF_ALT_C_OPTS="--height 85% \
--tmux=75% \
--margin=2%,2% \
--scroll-off=3 \
--border=rounded \
--layout=reverse \
--border-label='╢ FZF CD ╟' \
--walker-skip=.git,node_modules,target,.bluemail,.thunderbird,.firedragon,.mozilla,BraveSoftware,.steam,.rustup,.cache,.local,emacs,heroic,.npm,.nuget,Heroic \
--preview='tree -C {}' \
--info=hidden \
--color='dark,border:bright-cyan,header:italic:yellow,prompt:yellow' \
--prompt='FIND ▶ ' \
--pointer='→' \
--marker='✓'"

export FZF_DEFAULT_OPTS="-m \
--tmux=75% \
--margin=2%,2% \
--scroll-off=3 \
--border=rounded \
--layout=reverse \
--border-label='╢ FZF ╟' \
--preview='bat -n --color=always {}' \
--info=hidden \
--header='<TAB> for MULTI' \
--color='dark,border:bright-cyan,header:italic:yellow,prompt:yellow' \
--preview-label=' ~ Preview ~ ' \
--prompt='FIND ▶ ' \
--pointer='→' \
--marker='✓'"

export FZF_TMUX_OPTS="-m \
--tmux=75% \
--margin=2%,2% \
--scroll-off=3 \
--border=rounded \
--layout=reverse \
--border-label='╢ FZF ╟' \
--preview='bat -n --color=always {}' \
--info=hidden \
--color='dark,border:bright-cyan,header:bold:yellow,prompt:yellow' \
--header='<TAB> for MULTI' \
--preview-label=' ~ Preview ~ ' \
--prompt='FIND ▶ ' \
--pointer='→' \
--marker='✓'"

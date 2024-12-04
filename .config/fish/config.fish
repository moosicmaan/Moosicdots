## Set values
# Hide welcome message & ensure we are reporting fish as shell
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT 1
set -xU MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -xU MANROFFOPT -c
set -x SHELL /usr/bin/fish

## Export variable need for qt-theme
if type qtile >>/dev/null 2>&1
    set -x QT_QPA_PLATFORMTHEME qt5ct
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low


## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
    source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end


## Starship prompt
if status --is-interactive
    source ("/usr/bin/starship" init fish --print-full-init | psub)
end


## Advanced command-not-found hook
source /usr/share/doc/find-the-command/ftc.fish


## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ]
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | string trim --right --chars=/)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# Cleanup local orphaned packages
function cleanup
    while pacman -Qdtq
        sudo pacman -R (pacman -Qdtq)
    end
end

## Useful aliases

# Replace ls with eza
alias ls 'eza -al --color=always --group-directories-first --icons' # preferred listing
alias la 'eza -a --color=always --group-directories-first --icons' # all files and dirs
alias ll 'eza -l --color=always --group-directories-first --icons' # long format
alias lt 'eza -aT --color=always --group-directories-first --icons' # tree listing
alias l. 'eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles

# Replace some more things with better alternatives
alias cat 'bat --style header --style snip --style changes --style header'
if not test -x /usr/bin/yay; and test -x /usr/bin/paru
    alias yay paru
end


# Common use
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias big 'expac -H M "%m\t%n" | sort -h | nl' # Sort installed packages according to size in MB (expac must be installed)
alias dir 'dir --color=auto'
alias fixpacman 'sudo rm /var/lib/pacman/db.lck'
alias gitpkg 'pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias grep 'ugrep --color=auto'
alias egrep 'ugrep -E --color=auto'
alias fgrep 'ugrep -F --color=auto'
alias grubup 'sudo update-grub'
alias hw 'hwinfo --short' # Hardware Info
alias ip 'ip -color'
alias psmem 'ps auxf | sort -nr -k 4'
alias psmem10 'ps auxf | sort -nr -k 4 | head -10'
alias rmpkg 'sudo pacman -Rdd'
alias tarnow 'tar -acf '
alias untar 'tar -zxvf '
alias upd /usr/bin/garuda-update
alias vdir 'vdir --color=auto'
alias wget 'wget -c '

# Get fastest mirrors
alias mirror 'sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrora 'sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirrord 'sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors 'sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'

# Help people new to Arch
alias apt 'man pacman'
alias apt-get 'man pacman'
alias please sudo
alias tb 'nc termbin.com 9999'
alias helpme 'echo "To print basic information about a command use tldr <command>"'
alias pacdiff 'sudo -H DIFFPROG=meld pacdiff'

# Get the error messages from journalctl
alias jctl 'journalctl -p 3 -xb'

# Recent installed packages
alias rip 'expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'

## Run fastfetch if session is interactive
if status --is-interactive && type -q fastfetch
    # fastfetch --config neofetch.jsonc
    fastfetch --load-config /home/moosicmaan/.config/fastfetch/presets/MOOSICized.json
end


# JDB --->
# my aliases
alias vim 'kitty @ set-spacing padding=0 && nvim'
alias config "cd /mnt/data/moosicmaan/CONFIG/ && kitty @ set-spacing padding=0 && nvim"
alias mux 'kitty @ set-spacing padding=0 && tmux'
alias ec "emacsclient -c -a 'emacs' &"

# add emacs to the path
fish_add_path /home/moosicmaan/.config/emacs/bin

# set colortheme to current wallpaper
# set cwp (cat ~/.cache/current_wallpaper)
# wal -i $cwp >/dev/null

# set vi mode
###set -o vi
fish_vi_key_bindings

# FUNCTIONS
function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# KEYBINDINGS
# change the working directory using yazi
# In Fish shell:
# \c represents the Ctrl key.
# \e represents the Alt key (also known as the Meta key).
# This command binds Ctrl + Alt + y to call the yy function, that changes the working directory on exit through yazi.
bind \e\cy yy
bind \e\cf ff
bind \e\cn nf

alias ff='fzf -m --tmux="center,75%,75%" --reverse --scroll-off=3 --border=rounded --border-label="╢ FZF Select ╟" --height=75% --margin=10%,5% --preview "bat -n --color=always {}" --info=hidden --header="<TAB> for MULTI" --color="dark,border:bright-cyan,header:italic:yellow,prompt:yellow" --preview-window="right,border-double,50%" --preview-label=" ~ Preview ~ " --prompt="FIND ▶ " --pointer="→" --marker="*"'

alias nf='kitty @ set-spacing padding=0 && nvim $(ff)'
# alias np='nvim $(ft)'

# insert fzf keybinding
fzf --fish | source

export FZF_CTRL_T_OPTS="-m \
--height 75% \
--margin 10%,5% \
--scroll-off 3 \
--border rounded \
--layout reverse \
--border-label '╢ FZF Find ╟' \
--preview 'bat -n --color=always {}' \
--info hidden \
--header '<TAB> for MULTI' \
--color 'dark,border:bright-cyan,header:italic:yellow,prompt:yellow' \
--walker-skip .git,node_modules,target,.bluemail,.thunderbird,.firedragon,.mozilla,BraveSoftware,.steam,.rustup,.cache,.local,emacs,heroic,.npm,.nuget,Heroic \
--preview-label ' ~ Preview ~ ' \
--prompt 'FIND ▶ ' \
--pointer '→' \
--marker '*'"

export FZF_CTRL_R_OPTS="--height 75% \
--margin 10%,5% \
--scroll-off 3 \
--border rounded \
--layout reverse \
--border-label '╢ FZF History ╟' \
--info hidden \
--color 'dark,border:bright-cyan,header:italic:yellow,prompt:yellow' \
--prompt 'FIND ▶ ' \
--pointer '→' \
--marker '*'"

export FZF_ALT_C_OPTS="--height 75% \
--margin 10%,5% \
--scroll-off 3 \
--border rounded \
--layout reverse \
--border-label '╢ FZF CD ╟' \
--walker-skip .git,node_modules,target,.bluemail,.thunderbird,.firedragon,.mozilla,BraveSoftware,.steam,.rustup,.cache,.local,emacs,heroic,.npm,.nuget,Heroic \
--preview 'tree -C {}' \
--info hidden \
--color 'dark,border:bright-cyan,header:italic:yellow,prompt:yellow' \
--prompt 'FIND ▶ ' \
--pointer '→' \
--marker '*'"

export FZF_DEFAULT_OPTS="-m \
--height 75% \
--tmux center,75%,75% \
--margin 10%,5% \
--scroll-off 3 \
--border rounded \
--layout reverse \
--border-label '╢ FZF ╟' \
--preview 'bat -n --color=always {}' \
--info hidden \
--header '<TAB> for MULTI' \
--color 'dark,border:bright-cyan,header:italic:yellow,prompt:yellow' \
--preview-label ' ~ Preview ~ ' \
--prompt 'FIND ▶ ' \
--pointer '→' \
--marker '*'"

# <--- JDB

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

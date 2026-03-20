# =====================================================
# -----------------------------------------------------
# FISH SHELL CONFIGURATION
#    Jason Bradberry (2024)
# -----------------------------------------------------
# =====================================================

# -----------------------------------------------------
# SET VALUES, ENVIRONMENT, AND PATHS
# -----------------------------------------------------
# Hide welcome message & ensure we are still reporting bash as shell
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT 1

# Use bat for man pages
set -xU MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -xU MANROFFOPT -c

# Being explicit about active shell
set -x SHELL /usr/bin/bash

# Hint to exit PKGBUILD review in Paru
set -x PARU_PAGER "less -P \"Press 'q' to exit the PKGBUILD review.\""

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

## Environment setup
# Apply .fish_profile: use this to put fish compatible .profile stuff in
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

# -----------------------------------------------------
# PROMPT
# -----------------------------------------------------
## Starship prompt
if status --is-interactive
    if string match -q "/dev/tty*" (tty)
        #function fish_prompt
        #    echo -n "generic> "
        function fish_prompt
            set_color red
            echo -n "─"
            set_color yellow
            echo -n " in "
            set_color magenta
            #echo -n (prompt_pwd)
            echo -n (pwd)
            echo
            set_color red
            echo -n " └─"
            set_color yellow
            echo -n "►"
            set_color white
            echo -n "> "
            set_color normal
        end

        function fish_right_prompt
            if test $status -eq 0
                set_color green
                echo -n "√"
            else
                set_color red
                echo -n "?$status"
            end
            set_color white
            echo -n " "(date +"%H:%M")
            set_color normal
        end
        #echo "Fish in tty..."
    else
        ## Run fastfetch if session is interactive
        # fastfetch --config neofetch.jsonc
        # fastfetch --config /home/moosicmaan/.config/fastfetch/presets/MOOSICized.json
        # start starship prompt
        source ("/usr/bin/starship" init fish --print-full-init | psub)
    end
end

# -----------------------------------------------------
# FUNCTIONS AND HELPER PROGRAMS
# -----------------------------------------------------
## Advanced command-not-found hook
if [ -f /usr/share/doc/find-the-command/ftc.bash ]
    source /usr/share/doc/find-the-command/ftc.fish noupdate info
end

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
        if test "$status" -eq 1
            break
        end
    end
end

# -----------------------------------------------------
# USEFUL ALIASES
# -----------------------------------------------------
# Replace ls with eza
if command -q exa
    alias ls 'exa -ah -F --color=always --group-directories-first --icons' # add colors and file type extensions
    alias lw 'exa -xah -F --color=always --group-directories-first --icons' # wide listing format
    alias ll 'exa -lh -F --color=always --group-directories-first --icons' # long listing format
    alias la 'exa -Alh --color=always --group-directories-first --icons' # show hidden files long format
    alias lm 'exa -alh --color=always --group-directories-first --icons | more' # pipe through 'more'
    alias lT 'exa -aTh  --color=always --group-directories-first --icons | more' # tree listing
    alias lr 'exa -lRh --color=always --group-directories-first --icons | more' # recursive ls
    alias labc 'exa -lah --color=always --sort=name --icons' # sort by alphabetical
    alias lx 'exa -lXBh --color=always --sort=extension --icons' # sort by extension
    alias lk 'exa -lSrh --color=always --sort=size --icons ' # sort by size
    alias lc 'exa -Alh --color=always --changed --sort=changed --icons' # sort by change time
    alias lu 'exa -Alh --color=always --accessed --sort=accessed --icons' # sort by access time
    alias ld 'exa -Alh --color=always --sort=date --icons' # sort by date
    alias lf "exa -ah --color=always --follow-symlinks --only-files --icons" # only files
    alias ldir "exa -ah --color=always --follow-symlinks --only-dirs --icons" # only directories
    alias lla 'exa -aAlh --color=always --group-directories-first --icons .*' # only Hidden Files recursive long
    alias lls 'exa -aAh --color=always --group-directories-first --icons .*' # Only Hidden Files recursive
    alias l. 'exa -aldh --color=always --group-directories-first --icons .*' # only Dotfiles/dirs
else
    alias la 'ls -Alh' # show hidden files
    alias ls 'ls -aFh --color=always' # add colors and file type extensions
    # alias ls 'ls -l' # add colors and file type extensions
    alias lx 'ls -lXBh' # sort by extension
    alias lk 'ls -lSrh' # sort by size
    alias lc 'ls -ltcrh' # sort by change time
    alias lu 'ls -lturh' # sort by access time
    alias lr 'ls -lRh' # recursive ls
    alias ld 'ls -ltrh' # sort by date
    alias lm 'ls -alh |more' # pipe through 'more'
    alias lw 'ls -xAh' # wide listing format
    alias ll 'ls -Fls' # long listing format
    alias labc 'ls -lap' # alphabetical sort
    alias lf "ls -l | egrep -v '^d'" # files only
    alias ldir "ls -l | egrep '^d'" # directories only
    alias lla 'ls -Al' # List and Hidden Files
    alias las 'ls -A' # Hidden Files
    alias lls 'ls -l' # List
    alias le 'tree -aC' # tree listing
    alias l. 'ls -ald .*' # show only dotfiles
end
# list the types of files in a directory or list
alias types '~/.config/.scripts/ut-filetypes'
alias lt '~/.config/.scripts/ut-filetypes'

# Replace some more things with better alternatives
if command -q bat
    abbr cat 'bat --style header,snip,changes'
end

if not test -x /usr/bin/yay; and test -x /usr/bin/paru
    alias yay paru
end

# Common use
alias cp 'cp -i'
alias mv 'mv -i'
alias rv 'rv -i'
alias mkdir 'mkdir -p'
alias less 'less -R -C'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
# cd into the old directory
alias bd 'cd "$OLDPWD"'
alias big 'expac -H M "%m\t%n" | sort -h | nl' # Sort installed packages according to size in MB (expac must be installed)
alias dir 'dir --color=auto'
alias fixpacman 'sudo rm /var/lib/pacman/db.lck'
alias gitpkgs 'pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias grep 'ugrep --color=auto'
alias egrep 'ugrep -E --color=auto'
alias fgrep 'ugrep -F --color=auto'
alias grubup 'sudo update-grub'
alias hw 'hwinfo --short' # Hardware Info
alias ip 'ip -color'
alias ps 'ps auxf'
alias psmem 'ps auxf | sort -nr -k 4'
alias psmem10 'ps auxf | sort -nr -k 4 | head -10'
alias rmpkg 'sudo pacman -Rdd'
alias tarnow 'tar -acf '
alias untar 'tar -zxvf '
alias upd /usr/bin/garuda-update
alias vdir 'vdir --color=auto'
alias wget 'wget -c '

# Alias's to show disk space and space used in a folder
alias diskspace "du -S | sort -n -r |more"
alias folders 'du -h --max-depth=1'
alias folderssort 'find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree 'tree -CAhF --dirsfirst'
alias treed 'tree -CAFd'
alias mountedinfo 'df -hT'

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

# ===============================================================================
# JDB --->
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# MY ALIASES AND ENVIRONMENT
# -------------------------------------------------------------------------------
#
# Currretly doing this through importing wal cache files into configs
# set colortheme to current wallpaper in a wayland session
# if status is-interactive
#     if test -n "$WAYLAND_DISPLAY"
#         # Run pywal for Fish interactive
#         set cwp (cat ~/.cache/current_wallpaper)
#         # wal -i "$cwp" >/dev/null
#         # echo "Wayland session detected, using pywal theme..."
#     else
#         wal --theme tokyonight-moon >/dev/null
#     end
# end

# Making sure sudoedit from term is done with (n)vim 
alias suedit "VISUAL= sudoedit"
alias vi vim
alias config "cd /mnt/data/moosicmaan/CONFIG/ && fish -c 'nvim'"

# play local music and net radio
alias jam rofi-beats

# search/install/run blackarch packages - cli
alias black "$HOME/.config/.scripts/ut-blackmenu"

# -------------------------------------------------------------------------------
# KEYBINDINGS, HELPER PROGRAMS, AND FUNCTIONS
# -------------------------------------------------------------------------------

# IP address lookup
alias whatsmyip "~/.config/.scripts/ut-whatsmyip"

# check the current interfaces
alias whatsmyip="~/.config/.scripts/ut-whatsmyip"

# set vi mode
fish_vi_key_bindings

# KEYBINDINGS
bind --mode insert ctrl-alt-y yy
bind --mode insert ctrl-y yy
bind --mode insert ctrl-alt-n nf
bind --mode insert ctrl-n nf
bind --mode insert ctrl-alt-l clear
bind --mode insert ctrl-l clear

# change the working directory using yazi
function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# replace cd with zoxide, a better cd with an interactive feature
zoxide init fish | source
abbr --erase cd &>/dev/null
# alias cd="__zoxide_z;pwd;ls"
alias cd="__zoxide_z"
abbr --erase cdi &>/dev/null
# alias cdi="__zoxide_zi;pwd;ls"
alias cdi="__zoxide_zi"

# -------------------------------------------------------------------------------
# FZF CONFIG
# -------------------------------------------------------------------------------
# Setup fzf
set -gx FZF_DEFAULT_OPTS_FILE $HOME/.config/fzf/fzf.conf

# used in functions below - basic fzf search
alias ff='fzf-tmux -w 75% -h 75% --reverse --scroll-off=3 --border=rounded --border-label="╢ FZF Select ╟" --height=75% --margin=10%,5% --preview "bat -n --color=always {}" --info=hidden --header="<TAB> for MULTI" --color="dark,border:bright-cyan,header:italic:yellow,prompt:yellow" --preview-window="right,border-double,50%" --preview-label=" ~ Preview ~ " --prompt="FIND ▶ " --pointer="→" --marker="*"'

function nf
    nvim (ff)
end

# -------------------------------------------------------------------------------
# <--- JDB
# ===============================================================================

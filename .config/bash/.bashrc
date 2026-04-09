# =====================================================
# -----------------------------------------------------
# BASH SHELL CONFIGURATION
#    Jason Bradberry (2024, 2026)
# -----------------------------------------------------
# =====================================================

# -----------------------------------------------------
# SET VALUES, ENVIRONMENT, AND PATHS
# -----------------------------------------------------
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=5000
export HISTIGNORE="ls:la:pwd:exit:clear"
export HISTCONTROL=ignoredups:erasedups

# -----------------------------------------------------
# PROMPT
# -----------------------------------------------------
# # Load starship prompt if starship is installed
# if [ -x /usr/bin/starship ]; then
#     __main() {
#         local major="${BASH_VERSINFO[0]}"
#         local minor="${BASH_VERSINFO[1]}"
#
#         if ((major > 4)) || { ((major == 4)) && ((minor >= 1)); }; then
#             source <("/usr/bin/starship" init bash --print-full-init)
#         else
#             source /dev/stdin <<<"$("/usr/bin/starship" init bash --print-full-init)"
#         fi
#     }
#     __main
#     unset -f __main
# fi
#
# My prompt - not using starship in bash - bash_prompt and ~/.initrc.
# Setting VIM mode for the commandline
if [ -f "$HOME/.bash_prompt" ]; then
    source "$HOME/.bash_prompt"
fi
# set vim editing - set in .inputrc
# set -o vi

# -----------------------------------------------------
# FUNCTIONS AND HELPER PROGRAMS
# -----------------------------------------------------
# Advanced command-not-found hook
if [ -f /usr/share/doc/find-the-command/ftc.bash ]; then
    source /usr/share/doc/find-the-command/ftc.bash noupdate info
fi

# Enable bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
fi

# -----------------------------------------------------
# USEFUL ALIASES
# -----------------------------------------------------
# Replace ls with eza (eza)
if command -v eza >/dev/null 2>&1; then
    alias ls='eza -ah -F --color=always --group-directories-first --icons'       # add colors and file type extensions
    alias lw='eza -xah -F --color=always --group-directories-first --icons'      # wide listing format
    alias ll='eza -lh -F --color=always --group-directories-first --icons'       # long listing format
    alias la='eza -Alh  --color=always --group-directories-first --icons'        # show hidden files long format
    alias lm='eza -alh --color=always --group-directories-first --icons | more'  # pipe through 'more'
    alias lT='eza -aTh  --color=always --group-directories-first --icons | more' # tree listing
    alias lr='eza -lRh --color=always --group-directories-first --icons | more'  # recursive ls
    alias labc='eza -lah --color=always --sort=name --icons'                     # sort by alphabetical
    alias lx='eza -lXBh --color=always --sort=extension --icons'                 # sort by extension
    alias lk='eza -lSrh --color=always --sort=size --icons '                     # sort by size
    alias lc='eza -Alh --color=always --changed --sort=changed --icons'          # sort by change time
    alias lu='eza -Alh --color=always --accessed --sort=accessed --icons'        # sort by access time
    alias ld='eza -Alh --color=always --sort=date --icons'                       # sort by date
    alias lf="eza -ah --color=always --follow-symlinks --only-files --icons"     # only files
    alias ldir="eza -ah --color=always --follow-symlinks --only-dirs --icons"    # only directories
    alias lla='eza -aAlh --color=always --group-directories-first --icons .*'    # only Hidden Files recursive long
    alias lls='eza -aAh --color=always --group-directories-first --icons .*'     # Only Hidden Files recursive
    alias l.='eza -aldh --color=always --group-directories-first --icons .*'     # only Dotfiles/dirs
else
    alias la='ls -Alh'                # show hidden files
    alias ls='ls -aFh --color=always' # add colors and file type extensions
    alias lx='ls -lXBh'               # sort by extension
    alias lk='ls -lSrh'               # sort by size
    alias lc='ls -ltcrh'              # sort by change time
    alias lu='ls -lturh'              # sort by access time
    alias lr='ls -lRh'                # recursive ls
    alias ld='ls -ltrh'               # sort by date
    alias lm='ls -alh |more'          # pipe through 'more'
    alias lw='ls -xAh'                # wide listing format
    alias ll='ls -Fls'                # long listing format
    alias labc='ls -lap'              # alphabetical sort
    alias lf="ls -l | egrep -v '^d'"  # files only
    alias ldir="ls -l | egrep '^d'"   # directories only
    alias lla='ls -Al'                # List and Hidden Files
    alias las='ls -A'                 # Hidden Files
    alias lls='ls -l'                 # List
    alias le='tree -aC'               # tree listing
    alias l.='ls -ald .*'             # show only dotfiles
fi
# dir
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
# Replace some more things with better alternatives
if command -v bat >/dev/null 2>&1; then
    alias cat='bat --style header --style snip --style changes --style header'
    # Use bat for man pages
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    # export MANROFFOPT=-c
fi
# use paru instead of yay to as a aur-helper
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Aliases to modified commands
# Common use
alias ps='ps auxf'
alias less='less -R -C'
alias mkdir='mkdir -p'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias hl='rg --passthru'
alias grubup="sudo update-grub"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
# cd into the old directory
alias bd='cd "$OLDPWD"'
alias hw='hwinfo --short' # Hardware Info
alias ip='ip -color'

if command -v ugrep >/dev/null 2>&1; then
    alias grep='ugrep --color=auto'
    alias fgrep='ugrep -F --color=auto'
    alias egrep='ugrep -E --color=auto'
fi

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | \
                   xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | \
            grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | \
            grep -v '[0-9]$' | xargs tail -f"

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

## PACMAN
alias upd='/usr/bin/garuda-update' # Basically pacman -Syu with additional checks
# Help people new to Arch
alias apt='man pacman'
alias apt-get='man pacman'
alias please='sudo'

alias pacdiff='sudo -H DIFFPROG=meld pacdiff'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # Cleanup orphaned packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' \
    | sort | tail -200 |sort -r | nl | less"           # Recent installed packages
alias big="expac -H M '%m\t%n' | sort -rh | nl | less" # Sort installed packages according to size in MB (expac must be installed)
alias gitpkgs='pacman -Q | grep -i "\-git" | wc -l'    # List amount of -git packages
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias rmpkg="sudo pacman -Rsv"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# JDB --->
# -----------------------------------------------------

# -----------------------------------------------------
# Binds
# -----------------------------------------------------
# bind '"<key>": <command>'
bind -x '"\C-n":nf'
bind -x '"\C-\A-n":nf'
bind -x '"\C-l":clear'
bind -x '"\C-A-l":clear'
# bind \co yasi cd
bind -x '"\C-y":yy'
bind -x '"\C-\A-y":yy'

# -----------------------------------------------------
# Aliases
# -----------------------------------------------------
# My aliases and prompts - not using starship in bash.
# IP address lookup
alias whatsmyip="~/.config/.scripts/ut-whatsmyip"
# The new way to start hyprland in a tty,,,,I think...
alias hypr="start-hyprland"
# alias vim="nvim"
alias vi="vim"
# alias ec="emacsclient -c -a 'emacs' &"
alias config="cd /mnt/data/moosicmaan/CONFIG/ && bash -c 'nvim'"
# play local music and net radio
alias jam="~/.config/.scripts/rofi-beats"
# search/install/run blackarch packages - cli
alias black="~/.config/.scripts/ut-blackmenu"
# to help when system is opening sudoedit with graphical program
alias suedit="VISUAL= sudoedit"
# list the types of files in a directory or list
alias types='~/.config/.scripts/ut-filetypes'
alias lt='~/.config/.scripts/ut-filetypes'
# get the return codes for all parts of a pipe operation
alias pipes='echo "${PIPESTATUS[*]}"'

# -----------------------------------------------------
# Functions
# -----------------------------------------------------
# Extracts any archive(s) (if unp isn't installed)
extract() {
    for archive in "$@"; do
        if [ -f "$archive" ]; then
            case $archive in
            *.tar.bz2) tar xvjf "$archive" ;;
            *.tar.gz) tar xvzf "$archive" ;;
            *.bz2) bunzip2 "$archive" ;;
            *.rar) rar x "$archive" ;;
            *.gz) gunzip "$archive" ;;
            *.tar) tar xvf "$archive" ;;
            *.tbz2) tar xvjf "$archive" ;;
            *.tgz) tar xvzf "$archive" ;;
            *.zip) unzip "$archive" ;;
            *.Z) uncompress "$archive" ;;
            *.7z) 7z x "$archive" ;;
            *) echo "don't know how to extract '$archive'..." ;;
            esac
        else
            echo "'$archive' is not a valid file!"
        fi
    done
}

# Copy file with a progress bar
cpp() {
    set -e
    strace -q -ewrite cp -- "${1}" "${2}" 2>&1 |
        awk '{
        count += $NF
        if (count % 10 == 0) {
            percent = count / total_size * 100
            printf "%3d%% [", percent
            for (i=0;i<=percent;i++)
                printf "="
            printf ">"
            for (i=percent;i<100;i++)
                printf " "
            printf "]\r"
        }
    }
    END { print "" }' total_size="$(stat -c '%s' "${1}")" count=0
}

# Changing the font if in TTY session
my_font=ter-u22b.psf.gz
font_directory=/usr/share/kbd/consolefonts
if [[ $DISPLAY == "" ]]; then
    setfont $font_directory/$my_font
    echo " > Font set to: $font_directory/$my_font"
    clear
    fastfetch
fi

# -----------------------------------------------------
# Helper Applications
# -----------------------------------------------------
# Zoxide, a better cd
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash)"
    # alias cd='__zoxide_z;pwd;ls'
    # alias cdi='__zoxide_zi;pwd;ls'
    alias cd='__zoxide_z'
    alias cdi='__zoxide_zi'
fi

if command -v yazi >/dev/null 2>&1; then
    function yy() {
        local tmp
        local cwd

        tmp="$(mktemp -t yazi-cwd.XXXXXX)" || return

        command yazi "$@" --cwd-file="$tmp"

        IFS= read -r -d '' cwd <"$tmp"

        if [ "$cwd" != "$PWD" ] && [ -d "$cwd" ]; then
            builtin cd -- "$cwd"
        fi

        rm -f -- "$tmp"
    }
fi

if command -v fzf >/dev/null 2>&1; then
    # Set up fzf key bindings and fuzzy completion
    eval "$(fzf --bash)"
    alias ff='fzf-tmux -w 75% -h 75% --reverse --scroll-off=3 --border=rounded \
          --border-label="╢ FZF Select ╟" --height=75% --margin=10%,5% \
          --preview "bat {}" --info=hidden --header="<TAB> for MULTI" \
          --color="dark,border:bright-cyan,header:italic:yellow,prompt:yellow" \
          --preview-window="right,border-double,50%" \
          --preview-label=" ~ Preview ~ " --prompt="FIND ▶ " \
          --pointer="→" --marker="*"'
    alias nf='nvim $(ff)'
fi

# -----------------------------------------------------
# <--- JDB
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

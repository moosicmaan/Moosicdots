# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=5000
export HISTIGNORE="ls:pwd:exit:clear"
export HISTCONTROL=ignoredups:erasedups

# # Load starship prompt if starship is installed
# if [ -x /usr/bin/starship ]; then
#   __main() {
#     local major="${BASH_VERSINFO[0]}"
#     local minor="${BASH_VERSINFO[1]}"
#
#     if ((major > 4)) || { ((major == 4)) && ((minor >= 1)); }; then
#       source <("/usr/bin/starship" init bash --print-full-init)
#     else
#       source /dev/stdin <<<"$("/usr/bin/starship" init bash --print-full-init)"
#     fi
#   }
#   __main
#   unset -f __main
# fi

# My prompt - not using starship in bash - bash_prompt and ~/.initrc.
# Setting VIM mode for the commandline
set -o vi
source "$HOME/.bash_prompt.sh"

# Advanced command-not-found hook
# source /usr/share/doc/find-the-command/ftc.bash noupdate info

## Useful aliases

# Replace ls with exa
if [ -f /usr/bin/exa ]; then
  alias la='exa -Alh --color=always --group-directories-first --icons'                  # show hidden files
  alias ls='exa -ah -F --color=always --color=always --group-directories-first --icons' # add colors and file type extensions
  # alias lx='exa -lXBh --color=always --group-directories-first --icons'                 # sort by extension
  # alias lk='exa -lSrh --color=always --group-directories-first --icons '                # sort by size
  # alias lc='exa -ltcrh --color=always --group-directories-first --icons'                # sort by change time
  # alias lu='exa -lturh --color=always --group-directories-first --icons'                # sort by access time
  # alias lr='exa -lRh --color=always --group-directories-first --icons'                  # recursive ls
  # alias ld='exa -ltrh --color=always --group-directories-first --icons'                 # sort by date
  # alias lm='exa -alh |more --color=always --group-directories-first --icons'            # pipe through 'more'
  # alias lw='exa -xAh --color=always --group-directories-first --icons'                  # wide listing format
  alias ll='exa -l -F --color=always --group-directories-first --icons' # long listing format
  # alias labc='exa -lap --color=always --group-directories-first --icons'                # alphabetical sort
  # alias lf="exa -l --color=always --icons | egrep -v '^d'"                              # files only
  # alias ldir="exa -l --color=always --icons | egrep '^d'"                               # directories only
  # alias lla='exa -Al --color=always --group-directories-first --icons'                  # List and Hidden Files
  # alias las='exa -A --color=always --group-directories-first --icons'                   # Hidden Files
  alias lls='exa -l --color=always --group-directories-first --icons'     # List
  alias l.='exa -ald --color=always --group-directories-first --icons .*' # show only dotfiles
  alias le='exa -aT  --color=always --group-directories-first --icons'    # tree listing
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

# Replace some more things with better alternatives
alias cat='bat --style header --style snip --style changes --style header'
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Alias's to modified commands
# Common use
alias ps='ps auxf'
alias less='less -R -C'
alias mkdir='mkdir -p'
alias cp='cp -i'
alias mv='mv -i'
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias rmpkg="sudo pacman -Rsv"
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='/usr/bin/garuda-update'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='ugrep --color=auto'
alias fgrep='ugrep -F --color=auto'
alias egrep='ugrep -E --color=auto'
alias hw='hwinfo --short'                           # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"      # Sort installed packages according to size in MB (expac must be installed)
alias gitpkgs='pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias ip='ip -color'
# cd into the old directory
alias bd='cd "$OLDPWD"'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Help people new to Arch
alias apt='man pacman'
alias apt-get='man pacman'
alias please='sudo'
alias tb='nc termbin.com 9999'
alias helpme='cht.sh --shell'
alias pacdiff='sudo -H DIFFPROG=meld pacdiff'

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# JDB --->
# -----------------------------------------------
# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip() {
  # Internal IP Lookup.
  if command -v ip &>/dev/null; then
    echo -n "Internal IP: "
    ip addr show wlan0 | grep "inet " | awk '{print $2}' | cut -d/ -f1
  else
    echo -n "Internal IP: "
    ifconfig wlan0 | grep "inet " | awk '{print $2}'
  fi

  # External IP Lookup
  echo -n "External IP: "
  curl -4 ifconfig.me
}

# Automatically do an ls after each cd, z, or zoxide
cd() {
  if [ -n "$1" ]; then
    builtin cd "$@" && ls
  else
    builtin cd ~ && ls
  fi
}

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

# Searches for text in all files in the current folder
ftext() {
  # -i case-insensitive
  # -I ignore binary files
  # -H causes filename to be printed
  # -r recursive search
  # -n causes line number to be printed
  # optional: -F treat search term as a literal, not a regular expression
  # optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
  grep -iIHrn --color=always "$1" . | less -r
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

alias suedit="VISUAL= sudoedit"

# Variables
my_font=ter-u22b.psf.gz
font_directory=/usr/share/kbd/consolefonts

# Changing the font if in TTY session
if [[ $DISPLAY == "" ]]; then
  setfont $font_directory/$my_font
  echo " > Font set to: $font_directory/$my_font"
  clear
  fastfetch
fi

# My aliases and prompts - not using starship in bash.
alias hypr="uwsm start -- hyprland.desktop"
# alias vim="nvim"
alias vi="vim"
export PATH=$PATH:$HOME/.config/emacs/bin
alias ec="emacsclient -c -a 'emacs' &"
export PATH="$HOME/.config/.scripts:$PATH"
alias config="cd /mnt/data/moosicmaan/CONFIG/ && fish -c 'nvim'"
# play local music and net radio
alias jam="~/.config/.scripts/rofi-beats"
# search/install/run blackarch packages - cli
alias black="~/.config/.scripts/ut-blackmenu"

# add zoxide, a better cd
eval "$(zoxide init bash)"
alias cd='__zoxide_z'
alias cdi='__zoxide_zi'

# Enable bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
  source /usr/share/bash-completion/bash_completion
fi

function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

alias ff='fzf-tmux -w 75% -h 75% --reverse --scroll-off=3 --border=rounded --border-label="╢ FZF Select ╟" --height=75% --margin=10%,5% --preview "bat {}" --info=hidden --header="<TAB> for MULTI" --color="dark,border:bright-cyan,header:italic:yellow,prompt:yellow" --preview-window="right,border-double,50%" --preview-label=" ~ Preview ~ " --prompt="FIND ▶ " --pointer="→" --marker="*"'

alias nf='nvim $(ff)'
# alias np='nvim $(ft)'

# bind \co yasi cd
# bind '"<key>": <command>'
bind -x '"\C-A-y":yy'
bind -x '"\C-A-n":nf'
bind -x '"\C-l":clear'
bind -x '"\C-A-l":clear'

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

export FZF_CTRL_T_OPTS="-m \
--tmux 75% \
--margin 2%,2% \
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

export FZF_CTRL_R_OPTS="--height 85% \
--tmux 75% \
--margin 2%,2% \
--scroll-off 3 \
--preview 'echo {}' \
--preview-window 'right,40%,wrap' \
--border rounded \
--layout reverse \
--border-label '╢ FZF History ╟' \
--info hidden \
--color 'dark,border:bright-cyan,header:italic:yellow,prompt:yellow' \
--prompt 'FIND ▶ ' \
--pointer '→' \
--marker '*'"

export FZF_ALT_C_OPTS="--height 85% \
--tmux 75% \
--margin 2%,2% \
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
--tmux 75% \
--margin 2%,2% \
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

export FZF_TMUX_OPTS="-m \
--tmux 75% \
--margin 2%,2% \
--scroll-off 3 \
--border rounded \
--layout reverse \
--border-label '╢ FZF ╟' \
--preview 'bat -n --color=always {}' \
--info hidden \
--color 'dark,border:bright-cyan,header:bold:yellow,prompt:yellow' \
--header '<TAB> for MULTI' \
--preview-label ' ~ Preview ~ ' \
--prompt 'FIND ▶ ' \
--pointer '→' \
--marker '*'"
# -----------------------------------------------
# <--- JDB
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

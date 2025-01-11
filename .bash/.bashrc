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
source ~/.bash_prompt.sh

# Advanced command-not-found hook
source /usr/share/doc/find-the-command/ftc.bash

## Useful aliases

# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first --icons'     # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'      # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'      # long format
alias lt='exa -aT --color=always --group-directories-first --icons'     # tree listing
alias l.='exa -ald --color=always --group-directories-first --icons .*' # show only dotfiles

# Replace some more things with better alternatives
alias cat='bat --style header --style snip --style changes --style header'
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Common use
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias rmpkg="sudo pacman -Rdd"
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
alias hw='hwinfo --short'                          # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"     # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias ip='ip -color'

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

# -----------------------------------------------
# JDB --->
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# Variables
my_font=ter-v28n.psf.gz
font_directory=/usr/share/kbd/consolefonts/

# Changing the font if in TTY session
if [[ $DISPLAY == "" ]]; then
  setfont $font_directory$my_font
  echo "----> Font set to: $font_directory$my_font"
fi

# My aliases and prompts - not using starship in bash.
alias vim="nvim"
export PATH=$PATH:$HOME/.config/emacs/bin
alias ec="emacsclient -c -a 'emacs' &"
alias config="cd /mnt/data/moosicmaan/CONFIG/ && fish -c 'nvim'"

function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

alias ff='fzf -m --reverse --scroll-off=3 --border=rounded --border-label="╢ FZF Select ╟" --height=75% --margin=10%,5% --preview "bat {}" --info=hidden --header="<TAB> for MULTI" --color="dark,border:bright-cyan,header:italic:yellow,prompt:yellow" --preview-window="right,border-double,50%" --preview-label=" ~ Preview ~ " --prompt="FIND ▶ " --pointer="→" --marker="*"'

#alias ft 'fzf -m --tmux="center,75%,75%" --reverse --scroll-off=3 --border=rounded --border-label="╢ FZF Select ╟" --preview "bat {}" --info=hidden --header="<TAB> for MULTI" --color="dark,border:bright-cyan,header:italic:yellow,prompt:yellow" --preview-window="right,border-double,50%" --preview-label=" ~ Preview ~ " --prompt="FIND ▶ " --pointer="→" --marker="*"'

alias nf='nvim $(ff)'
# alias np='nvim $(ft)'

# bind \co ranger-cd
bind '"/C-y":yy'
bind '"/C-f":ff'
bind '"/C-j":nf'
#bind -x '"/C-p":np'

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

export FZF_CTRL_T_OPTS="-m \
--height 85% \
--tmux center,75%,75% \
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
--tmux center,75%,75% \
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
--tmux center,75%,75% \
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
--height 85% \
--tmux center,75%,75% \
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

man_fzf() {
  if [ -z "$*" ]; then
    man -k "" | sed 's/ .*//' | fzf --preview="man -P cat {}"
  else
    man -k "$@" | sed 's/ .*//' | fzf --query="$*" --preview="man -P cat {}"
  fi
}

manf() {
  man_fzf "$@" | xargs man
}

# add zoxide, a better cd
eval "$(zoxide init bash)"
alias cd='__zoxide_z'
alias cdi='__zoxide_zi'

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# <--- JDB
# -----------------------------------------------
. "$HOME/.cargo/env"

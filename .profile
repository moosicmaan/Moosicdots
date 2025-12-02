export TERM=xterm-256color
export PATH=".local/bin/bear:$PATH"

export __GLX_VENDOR_LIBRARY_NAME=nvidia
export WLR_NO_HARDWARE_CURSORS=1

export JBSTARTSCRIPT="~/.profile"

uwsm aux app-daemon
# uwsm check || uwsm start default

# if uwsm check may-start; then
#   # if uwsm check may-start && uwsm select; then
#   exec uwsm start default
# fi
. "$HOME/.cargo/env"

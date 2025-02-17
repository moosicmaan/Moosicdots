#!/bin/bash

manf() {
  if [ -z "$*" ]; then
    man -k "" | awk '{print $1}' | fzf --preview="man {}"
  else
    man -k "$@" | awk '{print $1}' | fzf --query="$*" --preview="man {}"
  fi
}

# However, this will not work correctly if the program name contains spaces. A better approach would be to use cut to extract the first field, separated by a space or a tab:
#
# man_fzf() {
#   if [ -z "$*" ]; then
#     man -k "" | cut -d' ' -f1 | fzf --preview="man {}"
#   else
#     man -k "$@" | cut -d' ' -f1 | fzf --query="$*" --preview="man {}"
#   fi
# }

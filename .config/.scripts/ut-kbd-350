#!/bin/bash

PREFIX=$("$HOME/.config/.scripts/wayland-prefix.sh")

LOGFILE="/tmp/kmonad.log"

echo "----------------------------------------" | tee -a "$LOGFILE"
echo "[$(date)] Running kmonad script..." | tee -a "$LOGFILE"

# Check if PREFIX is valid
if [[ -z "$PREFIX" ]]; then
  echo "[$(date)] ERROR: PREFIX is empty. Check wayland-prefix.sh!" | tee -a "$LOGFILE"
  # notify-send --icon=error "Kmonad Error" "PREFIX is empty. Check wayland-prefix.sh!"
  # exit 1
fi

# Debugging output
echo "[$(date)] PREFIX: $PREFIX" | tee -a "$LOGFILE"

# Check if kmonad is installed
if ! command -v kmonad &>/dev/null; then
  echo "[$(date)] ERROR: kmonad is not installed!" | tee -a "$LOGFILE"
  notify-send --icon=error "Kmonad Error" "kmonad is not installed!"
  exit 1
fi

# List processes for debugging
ps aux | grep kmonad | grep -v "grep" | tee -a "$LOGFILE"

# Check if kmonad is running
if pgrep -fl "kmonad" | grep -v "grep" >/dev/null; then
  echo "[$(date)] kmonad is running. Attempting to stop it..." | tee -a "$LOGFILE"
  notify-send --icon=keyboard "Kmonad" "Stopping it..."

  # Attempt to stop kmonad
  if pkill -f "kmonad"; then
    echo "[$(date)] kmonad stopped successfully." | tee -a "$LOGFILE"
  else
    echo "[$(date)] ERROR: Failed to stop kmonad!" | tee -a "$LOGFILE"
    notify-send --icon=error "Kmonad Error" "Failed to stop kmonad!"
    exit 1
  fi
else
  echo "[$(date)] kmonad is not running. Starting it..." | tee -a "$LOGFILE"
  notify-send --icon=keyboard "Kmonad" "Starting..."

  # Start kmonad
  if eval "${PREFIX}kmonad $HOME/.config/kmonad/k350.kbd" &>>"$LOGFILE" & then
    echo "[$(date)] kmonad started successfully for k350." | tee -a "$LOGFILE"
    notify-send --icon=keyboard "Kmonad Started" "kmonad started for k350 keyboard."
  else
    echo "[$(date)] ERROR: kmonad failed to start!" | tee -a "$LOGFILE"
    notify-send --icon=error "Kmonad Error" "Failed to start kmonad!"
    exit 1
  fi
fi

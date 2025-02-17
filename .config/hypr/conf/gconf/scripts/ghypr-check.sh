#!/bin/bash
# if [ -f "$HOME"/.config/hypr/start.log ]; then
#   rm "$HOME"/.config/hypr/start.log
# fi

if [ "$GHYPR" ]; then
  echo "$(date) - GHYPR is enabled" >"$HOME"/.config/hypr/start.log
  exit 0
else
  echo "$(date) - GHYPR is not enabled" >>"$HOME"/.config/hypr/start.log
fi

if [ "$HYPRUWSM" ]; then
  echo "$(date) - HYPRUWSM is enabled" >>"$HOME"/.config/hypr/start.log
else
  echo "$(date) - HYPRUWSM is not enabled" >>"$HOME"/.config/hypr/start.log
  echo "$(date) - Setting environment vairables" >>"$HOME"/.config/hypr/start.log
  "$HOME/.config/uwsm/env"
  "$HOME/.config/uwsm/env-hyprland"
fi

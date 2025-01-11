#!/bin/bash

newwall=$1

echo "$newwall" >"$HOME"/.cache/current_wallpaper
swww img "$newwall" &
$HOME/.config/.scripts/wallpaper.sh init

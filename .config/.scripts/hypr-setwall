#!/bin/bash

PREFIX=$("$HOME/.config/.scripts/wayland-prefix.sh")

newwall=$1

echo "$newwall" >"$HOME"/.cache/current_wallpaper
${PREFIX}swww img "$newwall" &
$HOME/.config/.scripts/wallpaper.sh init

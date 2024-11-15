#!/bin/bash
#
#/home/moosicmaan/.dotfiles/hypr/scripts/wallpaper.sh
wal -q -i ~/Pictures/Backgrounds/

# -----------------------------------------------------
# Load current pywal color scheme
# -----------------------------------------------------
source "$HOME/.cache/wal/colors.sh"
echo ":: Wallpaper: $wallpaper"

# -----------------------------------------------------
# Write selected wallpaper into .cache files
# -----------------------------------------------------
echo "$wallpaper" > "$cache_file"
echo "* { current-image: url(\"$wallpaper\", height); }" > "$rasi_file"

# -----------------------------------------------------
# get wallpaper image name
# -----------------------------------------------------
newwall=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")


# restart waybar
echo 'killing waybar'
# /home/moosicmaan/.dotfiles/waybar/launch.sh
killall -9 waybar
echo 'staring L waybar'
waybar -c /mnt/scsi/data/moosicmaan/_envir.JBAC/dotfiles/waybar/themes/moosic/config -s /mnt/scsi/data/moosicmaan/_envir.JBAC/dotfiles/waybar/themes/moosic/style.css &
echo 'starting R waybar'
waybar -c /mnt/scsi/data/moosicmaan/_envir.JBAC/dotfiles/waybar/themes/moosic/config2 -s /mnt/scsi/data/moosicmaan/_envir.JBAC/dotfiles/waybar/themes/moosic/style.css &

# -----------------------------------------------------
# Set the new wallpaper
# -----------------------------------------------------
echo 'beginning to set new change-wallpaper.sh'
# transition_type="wipe"
# transition_type="outer"
transition_type="random"

swww img $wallpaper \
    --transition-bezier .43,1.19,1,.4 \
    --transition-fps=60 \
    --transition-type=$transition_type \
    --transition-duration=0.7 \
    --transition-pos "$( hyprctl cursorpos )"

# -----------------------------------------------------
# Send notification
# -----------------------------------------------------

if [ "$1" == "init" ] ;then
    echo ":: Init"
else
    sleep 1
    notify-send "Colors and Wallpaper updated" "with image $newwall"
fi

echo "DONE!"

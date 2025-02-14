#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# For Rofi Beats to play online Music or Locally save media files

# Directory local music folder
mDIR="$HOME/Music/Spotube/"

# Directory for icons
iDIR="/usr/share/icons/candy-icons/status/scalable/"

# Prefix to run commands in wayland using uwsm.
PREFIX=$("$HOME/.config/.scripts/wayland-prefix.sh")

# Online Stations. Edit as required
# https://streamurl.link is a good resource for online music
declare -A online_music=(
  ["Radio - Lofi Girl 🎧🎶"]="https://play.streamafrica.net/lofiradio"
  ["Radio - Chillhop 🎧🎶"]="http://stream.zeno.fm/fyn8eh3h5f8uv"
  ["Radio - Alternative Crossover 🎧🎶"]="http://streams.deltaradio.de/delta-alternative/mp3-192/play.m3u"
  ["Radio - Classical Oasis 🎧🎶"]="http://66.42.114.24:8000/live"
  ["Radio - Radio Art Broadway 🎧🎶"]="http://air-tunein.radioart.com/fBroadway.mp3"
  ["Radio - Irish Folk 🎧🎶"]="https://irish-folk.stream.laut.fm/irish-folk"
  ["Radio - Heart Musicals 🎧🎶"]="http://media-ice.musicradio.com/HeartMusicalsMP3"
  ["Radio - Study Music 🎧🎶"]="https://study-high.rautemusik.fm/"
  ["Radio - DooWop Music 🎧🎶"]="http://66.59.109.208:8000/stream/2/;"
  ["Radio - Mel's Old Time Radio Shows 🎧🎶"]="http://ec1.yesstreaming.net:1790"
  ["Radio - Greek New Age 🎧🎶"]="https://stream-152.zeno.fm/9yu82xwmdc9uv"
  ["Radio - Colorado Classical 🎧🎶"]="https://stream1.cprnetwork.org/cpr2_lo"
  ["Radio - Vocal Jazz 181 🎧🎶"]="http://listen.181fm.com/181-vocals_128k.mp3"
  ["Radio - Swing Street 🎧🎶"]="https://s1.voscast.com:10413/stream"
  ["Radio - Cleansing 50s 🎧🎶"]="http://hemnos.cdnstream.com/1464_128"
)

# Populate local_music array with files from music directory and subdirectories
populate_local_music() {
  local_music=()
  filenames=()
  while IFS= read -r file; do
    local_music+=("$file")
    filenames+=("$(basename "$file")")
  done < <(find "$mDIR" -type f \( -iname "*.mp3" -o -iname "*.m4a" -o -iname "*.flac" -o -iname "*.wav" -o -iname "*.ogg" -o -iname "*.mp4" \))
}

# Function for displaying notifications
notification() {
  # notify-send -u normal -i "$iDIR/media-playback-playing.svg" "Playing: $@"
  echo "$iDIR/media-playback-playing.svg" "Playing: $@"
}

# Main function for playing local music
play_local_music() {
  populate_local_music

  # Prompt the user to select a song
  choice=$(printf "%s\n" "${filenames[@]}" | rofi -i -dmenu -config ~/.config/rofi/config-wide.rasi -p "Local Music")
  # choice=$(printf "%s\n" "${filenames[@]}" | rofi -i -dmenu -config ~/.config/rofi/launchers/type-1/style-14.rasi -p "Local Music")

  if [ -z "$choice" ]; then
    exit 1
  fi

  # Find the corresponding file path based on user's choice and set that to play the song then continue on the list
  for ((i = 0; i < "${#filenames[@]}"; ++i)); do
    if [ "${filenames[$i]}" = "$choice" ]; then

      notification "$choice"

      # Play the selected local music file using mpv
      ${PREFIX}mpv --playlist-start="$i" --loop-playlist --vid=no "${local_music[@]}"

      break
    fi
  done
}

# Main function for shuffling local music
shuffle_local_music() {
  notification "Shuffle local music"

  # Play music in $mDIR on shuffle
  ${PREFIX}mpv --shuffle --loop-playlist --vid=no "$mDIR"
}

# Main function for playing online music
play_online_music() {
  choice=$(printf "%s\n" "${!online_music[@]}" | rofi -i -dmenu -config ~/.config/rofi/config-wide.rasi -p "Online Music")
  # choice=$(printf "%s\n" "${!online_music[@]}" | rofi -i -dmenu -config ~/.config/rofi/launchers/type-1/style-14.rasi -p "Online Music")

  if [ -z "$choice" ]; then
    exit 1
  fi

  link="${online_music[$choice]}"

  notification "$choice"

  # Play the selected online music using mpv
  ${PREFIX}mpv --shuffle --vid=no "$link"
  # ${PREFIX}mpg123 "$link"
}

# Check if an online music process is running and send a notification, otherwise run the main function
pkill mpv && notify-send -u low -i "$iDIR/media-playback-stopped.svg" "Music stopped" || {

  # Prompt the user to choose between local and online music
  user_choice=$(printf "Play from Online Stations\nPlay from Music Folder\nShuffle Play from Music Folder" | rofi -dmenu -config ~/.config/rofi/config-wide.rasi -p "Select music source")
  # user_choice=$(printf "Play from Online Stations\nPlay from Music Folder\nShuffle Play from Music Folder" | rofi -dmenu -config ~/.config/rofi/launchers/type-1/style-14.rasi -p "Select music source")

  case "$user_choice" in
  "Play from Music Folder")
    play_local_music
    ;;
  "Play from Online Stations")
    play_online_music
    ;;
  "Shuffle Play from Music Folder")
    shuffle_local_music
    ;;
  *)
    echo "Invalid choice"
    ;;
  esac
}

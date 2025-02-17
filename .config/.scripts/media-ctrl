#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Playerctl

# music_icon="$HOME/.config/.settngs/icons/music.png"
music_icon="/usr/share/icons/candy-icons/mimetypes/scalable/audio-x-generic.svg"
# music_icon="music"

# Play the next track
play_next() {
  playerctl next
  sleep 2
  show_music_notification
}

# Play the previous track
play_previous() {
  playerctl previous
  sleep 2
  show_music_notification
}

# Toggle play/pause
toggle_play_pause() {
  playerctl play-pause
  sleep 2
  show_music_notification
}

# Stop playback
stop_playback() {
  playerctl stop
  sleep 2
  notify-send -e -u low -i "$music_icon" "Playback Stopped"
}

# Display notification with song information
show_music_notification() {
  status=$(playerctl status)
  player=$(playerctl -l | head -n 1)
  if [[ "$status" == "Playing" ]]; then
    if [[ "$player" == "mpv" ]]; then
      # notify-send -e -u low -i "$music_icon" "MPV PLAYER"
      exit 1
    fi
    song_title=$(playerctl metadata title)
    song_artist=$(playerctl metadata artist)
    music_icon="/usr/share/icons/candy-icons/status/scalable/media-playback-playing.svg"
    notify-send -e -u normal -i "$music_icon" "Now Playing:" "$song_title\nby $song_artist"
  elif [[ "$status" == "Paused" ]]; then
    music_icon="/usr/share/icons/candy-icons/status/scalable/media-playback-paused.svg"
    notify-send -e -u normal -i "$music_icon" "Playback Paused"
  fi
}

# Get media control action from command line argument
case "$1" in
"--nxt")
  play_next
  ;;
"--prv")
  play_previous
  ;;
"--pause")
  toggle_play_pause
  ;;
"--stop")
  stop_playback
  ;;
*)
  echo "Usage: $0 [--nxt|--prv|--pause|--stop]"
  exit 1
  ;;
esac

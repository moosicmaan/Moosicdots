#!/bin/bash

term_pid=$1 # Pass the terminal's PID as an argument

# Function to get window ID of the terminal
get_terminal_window() {
  hyprctl clients | grep -B5 "pid: $term_pid" | awk '/window:/{print $2}'
}

# Get the terminal's window ID
terminal_window=$(get_terminal_window)

# Wait for a new window to appear (child window)
child_window=""
while [ -z "$child_window" ]; do
  child_window=$(hyprctl clients | grep -B5 "class: " | grep -v "$terminal_window" | awk '/window:/{print $2}')
  sleep 0.1
done

# Hide the terminal window
hyprctl dispatch movewindow toworkspace unset $terminal_window

# Wait for the child process to close
while hyprctl clients | grep -q "$child_window"; do
  sleep 0.1
done

# Restore the terminal window
hyprctl dispatch movewindow toworkspace unset $terminal_window

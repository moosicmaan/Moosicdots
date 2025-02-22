#!/bin/bash
# =====================================================
# -----------------------------------------------------
# Launch the statusbar selector for wayland compositors
#    Jason Bradberry (2024)
# -----------------------------------------------------
# =====================================================

themes_path="$HOME/.config/.settings/barthemes/"

# Initialize theme lists
declare -a theme_list
declare -a theme_names

# -----------------------------------------------------
# Read available themes
# -----------------------------------------------------
while IFS= read -r theme_dir; do
  [[ "$theme_dir" == "$themes_path/assets" || "$theme_dir" == "$themes_path" ]] && continue
  [[ $(find -L "$theme_dir" -maxdepth 1 -type d | wc -l) -ne 1 ]] && continue

  # Extract relative theme path
  rel_path="${theme_dir#"$themes_path"}" # Remove base path
  first_folder="${rel_path%/*}"          # Get first directory name
  if [ "$first_folder" == "" ]; then     # For configs in the base theme folder
    first_folder="$rel_path"
  fi
  formatted_theme="$first_folder;$rel_path"

  config_path="$theme_dir/config.sh"

  if [[ -f "$config_path" ]]; then
    source "$config_path"
    theme_names+=("$theme_name")
  else
    theme_names+=("$formatted_theme")
  fi

  echo "$formatted_theme"

  theme_list+=("$formatted_theme")
done < <(find -L "$themes_path" -maxdepth 2 -type d)

#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/wallpapers"


dir=$(ls -1 ~/wallpapers/ | rofi -dmenu -config ~/.config/rofi/rofi.rasi -p "" -matching=fuzzy)


WALLPAPER_DIR="$HOME/wallpapers/$dir"

mapfile -t wallpapers < <(
    find ~/wallpapers/$dir -type f \
        \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.gif' -o -iname '*.webp' \) |
        sort
)

[ "${#wallpapers[@]}" -eq 0 ] && exit 1

selected=$(
    printf '%s\n' "${wallpapers[@]}" |
    while IFS= read -r file; do
        printf '%s\0icon\x1f%s\n' "$(basename "$file")" "$file"
    done |
    rofi -dmenu -i \
        -p "Wallpaper" \
	-config ~/.config/rofi/wallpaper.rasi \
        -show-icons
)

[ -z "$selected" ] && exit 0

# Recover the full path from the selected filename
selected_file="$WALLPAPER_DIR/$selected"

[ -f "$selected_file" ] || exit 1

awww img --transition-type any "$selected_file"
matugen image "$selected_file" --source-color-index 1

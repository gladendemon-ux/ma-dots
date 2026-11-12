
#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/wallpapers"

mapfile -t wallpapers < <(
    find "$WALLPAPER_DIR" -type f \
        \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.gif' -o -iname '*.webp' \) |
    sort
)

[ "${#wallpapers[@]}" -eq 0 ] && exit 1

selected_file=$(
    for file in "${wallpapers[@]}"; do
        relative_path="${file#"$WALLPAPER_DIR"/}"
        printf '%s\0icon\x1f%s\n' "$relative_path" "$file"
    done |
    rofi -dmenu -i \
        -p "Wallpaper" \
        -config "$HOME/.config/rofi/wallpaper.rasi" \
        -show-icons
)

[ -z "$selected_file" ] && exit 0

# Recover the original file path
selected_file="$WALLPAPER_DIR/$selected_file"

[ -f "$selected_file" ] || {
    echo "File not found: $selected_file"
    exit 1
}

awww img --transition-type any "$selected_file"

matugen image "$selected_file" --source-color-index 1


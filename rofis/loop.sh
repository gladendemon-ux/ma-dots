choice=$(printf "Track\nPlaylist\nNone" | rofi -dmenu -config ~/.config/rofi/rofi.rasi -p "")

case $choice in
	Track )
		playerctl loop Track 
		;;
	Playlist )
		playerctl loop Playlist
		;;
	None )
		playerctl loop None 
		;;
esac


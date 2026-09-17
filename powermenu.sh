choice=$(printf "Lock\nShutdown\nSleep\nLogout" | rofi -dmenu -config ~/.config/rofi/rofi.rasi -p "")
case $choice in
	Lock )
		hyprlock
	;;
	Shutdown)
		shutdown
	;;
	Sleep)
		systemctl sleep
	;;
	Logout)
		logout
	;;
esac

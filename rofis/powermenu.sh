choice=$(printf "Sleep\nLock\nShutdown\nLogout\nReboot" | rofi -dmenu -config ~/.config/rofi/rofi.rasi -p "" -matching fuzzy)
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
		command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'
	;;
	Reboot)
		systemctl reboot
	;;
esac

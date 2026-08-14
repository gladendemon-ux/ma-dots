
hyprctl eval 'hl.config({
    decoration = {
        active_opacity = 0,
        inactive_opacity = 0,
	blur = {
		enabled = false,
	}
    }
})'

hyprctl dispatch 'hl.dsp.submap("peek")'

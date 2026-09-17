local mainMod = "SUPER"
local file = "kitty yazi"
local browser = "firefox"
local menu = "rofi -config ~/.config/rofi/rofi.rasi -show drun -show-icons"
local terminal = "kitty"
local sway = "swaync-client -t"

hl.bind("SUPER + Super_L", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + B" ,hl.dsp.exec_cmd(browser))
hl.bind("SUPER + Q" ,hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + W" ,hl.dsp.window.close())
hl.bind("SUPER + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("SUPER + F" ,hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + E" ,hl.dsp.exec_cmd(file))
hl.bind("SUPER + D" ,hl.dsp.exec_cmd("flatpak run org.blender.Blender"))
hl.bind("SUPER + T" ,hl.dsp.exec_cmd(sway))
hl.bind("SUPER + P" ,hl.dsp.exec_cmd("hyprpicker"))
hl.bind("SUPER + X" ,hl.dsp.exec_cmd("wlogout -b 2"))
hl.bind("SUPER + SHIFT + W" ,hl.dsp.exec_cmd("bash wall.sh"))
hl.bind("SUPER + D" ,hl.dsp.exec_cmd("kitty sh -c 'yazi ~/wallpapers/'"))



hl.bind("SUPER + L" ,hl.dsp.exec_cmd("hyprlock"))



--Playerctl
hl.bind("F8", hl.dsp.exec_cmd("playerctl --player=spotify play-pause"), { locked = true })
hl.bind("F7", hl.dsp.exec_cmd("playerctl --player=spotify previous"),   { locked = true })
hl.bind("F9", hl.dsp.exec_cmd("playerctl --player=spotify next"),       { locked = true })


--cycle layouts
hl.bind("SUPER + tab", function ()
    local layouts     = { "scrolling", "dwindle", "master" }
    local workspace   = hl.get_active_workspace()
	if hl.get_active_special_workspace() then
		workspace = hl.get_active_special_workspace()
	end

    local next_layout = "dwindle"

    if not workspace then
        return
    end

    for i = 1, #layouts do
        if layouts[i] == workspace.tiled_layout then
            local next_layout_idx = (i % #layouts) + 1
            next_layout = layouts[next_layout_idx]
            break
        end
    end

	if workspace.special then
		hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
	else
		hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
	end
end)


--Audio
hl.bind("SUPER + F12" ,hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 2%+"))
hl.bind("SUPER + F11" ,hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 2%-"))


hl.bind("F10" ,hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))


--Screenshots
hl.bind("PRINT" ,hl.dsp.exec_cmd("Hyprshot/hyprshot -m output"))

hl.bind("SUPER + PRINT" ,hl.dsp.exec_cmd("Hyprshot/hyprshot -m window"))

hl.bind("SUPER + S" ,hl.dsp.exec_cmd("Hyprshot/hyprshot -m region"))


--Focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))


--Moving windows with keybinds
hl.bind(mainMod .. "+ SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. "+ SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. "+ SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. "+ SHIFT + down",  hl.dsp.window.move({ direction = "down" }))



--Moving/resizing windows
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })



--Workspaces
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end


hl.bind("SUPER + P", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + N" ,hl.dsp.focus({ workspace = "e+1" }))
hl.bind("F3", hl.dsp.exec_cmd("hyprctl reload"))


hl.bind("F1", hl.dsp.exec_cmd("eww open-many --toggle clock music-widget ram"))
--hl.bind("F1", hl.dsp.exec_cmd("eww close-all"), {release = true})
--hl.bind("F3", hl.dsp.exec_cmd("eww kill"))


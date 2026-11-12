local mainMod = "SUPER"
local file = "nautilus"
local browser = "firefox"
local menu = "rofi -show drun -config ~/.config/rofi/rofi.rasi"
local runner = "walker"
local terminal = "kitty"
local sway = "swaync-client -t"



hl.bind("SUPER + Super_L", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd(runner))
hl.bind("SUPER + B" ,hl.dsp.exec_cmd(browser))
hl.bind("SUPER + Q" ,hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + W" ,hl.dsp.window.close())
hl.bind("SUPER + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("SUPER + F" ,hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + E" ,hl.dsp.exec_cmd(file))
hl.bind("SUPER + D" ,hl.dsp.exec_cmd("flatpak run org.blender.Blender"))
hl.bind("SUPER + T" ,hl.dsp.exec_cmd(sway))
hl.bind("SUPER + X" ,hl.dsp.exec_cmd("bash ~/rofis/powermenu.sh"))
hl.bind("SUPER + SHIFT + W" ,hl.dsp.exec_cmd("bash ~/rofis/wall.sh"))
hl.bind("SUPER + D", hl.dsp.window.pseudo())



hl.bind("Alt_R + Delete" ,hl.dsp.exec_cmd("hyprlock"))


--Audio

hl.bind("XF86AudioRaiseVolume" ,hl.dsp.exec_cmd("swayosd-client --output-volume 2"))
hl.bind("XF86AudioLowerVolume" ,hl.dsp.exec_cmd("swayosd-client --output-volume -2"))
hl.bind("SUPER + equal" ,hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%+ && swayosd-client --custom-message 'vol: +'"))
hl.bind("XF86AudioMute" ,hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"))


--Spotify controls

hl.bind("SUPER + XF86AudioMute", hl.dsp.exec_cmd("playerctl --player=spotify play-pause"), { locked = true })
hl.bind("SUPER + XF86AudioLowerVolume", hl.dsp.exec_cmd("playerctl volume 0.05- --player=spotify"),   { locked = true })
hl.bind("SUPER + XF86AudioRaiseVolume", hl.dsp.exec_cmd("playerctl volume 0.05+ --player=spotify"),       { locked = true })
hl.bind("SUPER + S", hl.dsp.exec_cmd("playerctl position 0.0 --player=spotify"),       { locked = true })


hl.bind("SUPER + grave + XF86AudioLowerVolume", hl.dsp.exec_cmd("playerctl position 10-"),   { locked = true })
hl.bind("SUPER + grave + XF86AudioRaiseVolume", hl.dsp.exec_cmd("playerctl position 10+"),       { locked = true })


hl.bind("SUPER + i", hl.dsp.exec_cmd("swayosd-client --playerctl play-pause --player=spotify"), { locked = true })
hl.bind("SUPER + u", hl.dsp.exec_cmd("swayosd-client --playerctl prev --player=spotify"),   { locked = true })
hl.bind("SUPER + o", hl.dsp.exec_cmd("swayosd-client --playerctl next --player=spotify"),       { locked = true })
hl.bind("SUPER + y", hl.dsp.exec_cmd("swayosd-client --playerctl play-pause --player=firefox"), { locked = true })

hl.bind("SUPER + S + p", hl.dsp.exec_cmd("playerctl --player=spotify loop Playlist"))
hl.bind("SUPER + S + t", hl.dsp.exec_cmd("playerctl --player=spotify loop track"))
hl.bind("SUPER + S + n", hl.dsp.exec_cmd("playerctl --player=spotify loop none"))



--cycle layouts
hl.bind("SUPER + tab", function ()
    local layouts     = { "scrolling", "dwindle" }
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

	if workspace.special then hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout }) else hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
	end
end)




--Screenshots
hl.bind("PRINT" ,hl.dsp.exec_cmd("Hyprshot/hyprshot -m output"))

hl.bind("SUPER + PRINT" ,hl.dsp.exec_cmd("Hyprshot/hyprshot -m window"))

hl.bind("SUPER + SHIFT + S" ,hl.dsp.exec_cmd("Hyprshot/hyprshot -m output"))
hl.bind("SUPER + CTRL + S" ,hl.dsp.exec_cmd("Hyprshot/hyprshot -m region"))


--Focus
hl.bind(mainMod .. " + h",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j",  hl.dsp.focus({ direction = "down" }))


--Moving windows with keybinds
hl.bind(mainMod .. "+ SHIFT + h",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. "+ SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. "+ SHIFT + k",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. "+ SHIFT + j",  hl.dsp.window.move({ direction = "down" }))



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
hl.bind("SUPER + Escape" ,hl.dsp.focus({ workspace = "e+1" }))


hl.bind("F1", hl.dsp.exec_cmd("eww open-many clock music-widget ram ws-indicator"))
hl.bind("F1", hl.dsp.exec_cmd("eww close-all"), {release = true})
hl.bind("F7", hl.dsp.exec_cmd("kill -9 $(pidof eww)"))

--Discord global shortcuts
hl.bind("SUPER + CTRL + D", hl.dsp.send_shortcut({ mods = "CTRL SHIFT", key = "D", window = "class:discord" }))
hl.bind("SUPER + CTRL + M", hl.dsp.send_shortcut({ mods = "CTRL SHIFT", key = "M", window = "class:discord" }))




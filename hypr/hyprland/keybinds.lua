local mainMod = "SUPER"
local file = "nautilus"
local browser = "flatpak run app.zen_browser.zen"
local menu = "wofi --show drun"
local terminal = "kitty"
local gameeng = "/home/bnn/custom_apps/godot.sh"

hl.bind("SUPER + Super_L", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + B" ,hl.dsp.exec_cmd(browser))
hl.bind("SUPER + Q" ,hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + C" ,hl.dsp.window.close())
hl.bind("SUPER + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("SUPER + F" ,hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + E" ,hl.dsp.exec_cmd(file))
hl.bind("SUPER + D" ,hl.dsp.exec_cmd("flatpak run org.blender.Blender"))
hl.bind("SUPER + G" ,hl.dsp.exec_cmd(gameeng))
hl.bind("SUPER + P" ,hl.dsp.exec_cmd("hyprpicker"))
hl.bind("SUPER + X" ,hl.dsp.exec_cmd("wlogout"))


hl.bind("SUPER + L" ,hl.dsp.exec_cmd("hyprlock"))



--Playerctl
hl.bind("F8", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("F7", hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
hl.bind("F9", hl.dsp.exec_cmd("playerctl next"),       { locked = true })





--Audio
hl.bind("SUPER + F12" ,hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%+"))
hl.bind("SUPER + F11" ,hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%-"))


hl.bind("F10" ,hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))


--Screenshots
hl.bind("SUPER + SHIFT + S" ,hl.dsp.exec_cmd("hyprshot -m output"))

hl.bind("SUPER + PRINT" ,hl.dsp.exec_cmd("hyprshot -m window"))

hl.bind("SUPER + S" ,hl.dsp.exec_cmd("hyprshot -m region"))



--Focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))


--Moving/resizing windows
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })



--Workspaces
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end


hl.bind("ALT + grave", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("ALT + TAB" ,hl.dsp.focus({ workspace = "e+1" }))



hl.bind("F1", hl.dsp.exec_cmd("bash opacityZero.sh"))
hl.bind("F1", hl.dsp.exec_cmd("bash exitPeek.sh"), { release = true })
hl.define_submap("peek", function()
hl.bind("catchall", hl.dsp.exec_cmd("bash exit.sh"))
end)

--Widow rules
hl.window_rule({ match = { class = "Spotify" }, workspace = "10" })
hl.window_rule({ match = { class = "viber" }, workspace = "2" })
hl.window_rule({ match = { class = "discord" }, workspace = "2" })
hl.window_rule({ match = { class = "firefox" }, workspace = "1" })

--Layer rules


hl.layer_rule({ match = { namespace = "hyprpicker" }, no_anim = true })
hl.layer_rule({ match = { namespace = "hyprshot" }, no_anim = true })
hl.layer_rule({ match = { namespace = "wlogout" }, blur = true})


--Workspace rules

hl.workspace_rule({ workspace = "10", layout = "scrolling" })
hl.workspace_rule({ workspace = "2", layout = "scrolling" })


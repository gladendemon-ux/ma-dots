--Widow rules
hl.window_rule({ match = { class = "Spotify" }, workspace = "10" })


--Layer rules


hl.layer_rule({ match = { namespace = "hyprpicker" }, no_anim = true })
hl.layer_rule({ match = { namespace = "hyprshot" }, no_anim = true })
hl.layer_rule({ match = { namespace = "wofi" }, animation = "fade" })

--Workspace rules

hl.workspace_rule({ workspace = "10", layout = "scrolling" })


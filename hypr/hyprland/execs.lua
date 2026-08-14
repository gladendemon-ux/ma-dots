hl.on("hyprland.start", function ()

    hl.exec_cmd("mako")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("./gay.out")
    hl.exec_cmd("./500")


    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("eww open clock && eww open ram && eww open music-widget")

    -- Cursor
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
end)

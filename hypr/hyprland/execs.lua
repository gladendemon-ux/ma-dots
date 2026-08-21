hl.on("hyprland.start", function ()

    hl.exec_cmd("mako")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    --Open Tablet Driver
    hl.exec_cmd("systemctl --user start opentabletdriver")

    --Cursors
    hl.exec_cmd("hyprctl setcursor Future-Everforest-Green-Hyprcursor_Theme 45")
    hl.exec_cmd("flatpak override --filesystem=~/.themes:ro --filesystem=~/.icons:ro --user")

    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("eww open clock && eww open music-widget && eww open ram")

end)

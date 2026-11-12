hl.on("hyprland.start", function ()

    hl.exec_cmd("swaync")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("hypridle & disown")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("walker --gapplication-service")
    hl.exec_cmd("elephant")

    --Open Tablet Driver
    hl.exec_cmd("systemctl --user start opentabletdriver")



        hl.exec_cmd(
        "sh -c 'sleep 3; kitty +kitten panel --edge=background cava'"
    )


    hl.exec_cmd("anyrun daemon")
    hl.exec_cmd("swayosd-server & disown")

    --Cursors
    hl.exec_cmd("hyprctl setcursor Future-Everforest-Green-Hyprcursor_Theme 45")
    hl.exec_cmd("flatpak override --filesystem=~/.themes:ro --filesystem=~/.icons:ro --user")

    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("eww open-many clock ram music-widget")

   
    hl.exec_cmd("playerctl --player=spotify loop Playlist")

    --Essential apps
    hl.exec_cmd("flatpak run com.discordapp.Discord")
    hl.exec_cmd("flatpak run com.viber.Viber")
    hl.exec_cmd("firefox")
    hl.exec_cmd("spotify")

end)

Url=$(playerctl metadata mpris:artUrl)
curl -o ~/cover $Url
echo ~/cover

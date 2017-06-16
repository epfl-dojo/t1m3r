#!/bin/zsh

local image="/tmp/dojoman.png"
local deadline=${1:-300}
local music="${2:-http://www.sound-fishing.net/download.php?id=$(( $RANDOM % 12346 ))}"
if [ ! -e $image ]; then
  curl -Ls -o $image "https://github.com/epfl-dojo/dojo-design/raw/master/dojoman/dojoman.png"
fi
for date in $(seq $deadline); do
  echo -n '\r'
  echo -ne $(date -u --date @$(( $deadline - $date )) +"%H:%M:%S")
  sleep 1
done
notify-send -i $image "⚠ Whoop Whoop !" \ " ➠ Passe à ton voisin..."
echo -e "\nTime's up, playing $music"
mplayer -really-quiet $music

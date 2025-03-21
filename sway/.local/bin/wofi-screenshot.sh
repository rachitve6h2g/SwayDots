#!/bin/sh

name=$(date +%Y-%m-%d_%I:%M:%S-$RANDOM)
outfile=~/Pictures/Screenshots/$name.png
program=`wofi -d -b -- << EOF
selection
screen
window
EOF`

case $program in
	selection)
		grim -g "$(slurp)" -t png -l 9 $outfile && notify-send "Saved: $name" ;;
	screen)
		grim -t png  -l 9 $outfile && notify-send "Saved: $name" ;;
	window)
		grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.focused?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')" -t png -l 9 $outfile && notify-send "Saved: $name" ;;
esac

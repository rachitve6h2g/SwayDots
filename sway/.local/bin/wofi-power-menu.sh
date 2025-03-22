#!/usr/bin/env bash

op=$( echo -e "  Poweroff\n  Reboot\n  Suspend\n  Lock\n  Logout" | wofi -i --dmenu --width 300 --height 300 -x 1590  -y 300 | awk '{print tolower($2)}' )

case $op in 
  poweroff)
    ;&
  reboot)
    ;&
  suspend)
    systemctl $op
    ;;
  lock)
    swaylock -f -c 000000
    ;;
  logout)
    swaymsg exit
    ;;
esac

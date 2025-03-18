#!/usr/bin/env bash

# A script to get the state of swayidle
# to facilitate toggling the states using i3status-rust
# run "chmod +x idle_state_toggle.sh" in bash after copying
#
# author: noncomplete <m.labib027@gmail.com>

idle_pid="$(pidof swayidle)"

state_var="$(cat /proc/${idle_pid}/status | grep State | grep -Po '\(\K[^)]*')"

if [[ "$state_var" == "sleeping" ]]; then
	echo ""
else
	echo "swayidle is off"
fi

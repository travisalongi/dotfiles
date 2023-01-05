#!/usr/bin/bash
set -euo pipefail

dir=$HOME/Zephyrus_share/Papers
#zathura "$dir/$(du -a $dir | awk '{print $2}'|awk -F "/" '{print $6}' | dmenu -i -c -p "Academic Papers")" &
#zathura "$dir/$(du -a $dir | awk '{print $2}'|awk -F "/" '{print $6}' | rofi -dmenu -i -c -p "Academic Papers")" &
selection=$dir/$(\ls $dir --sort=time | rofi -dmenu -i -p "Academic Papers")
zathura "$selection"


#!/bin/sh
# Simple script to use rofi to select music and play in mpv
music_dir="/home/talongi/Zephyrus_share/Music"
mpv "$music_dir/$(cd $music_dir; fd -t d | rofi -dmenu -i -l 30 -p "Music")" 

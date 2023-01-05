#!/usr/bin/sh

man -k . | dmenu -i -c -p "Man Page" | awk '{print $1}' | xargs -r man -Tpdf | zathura -

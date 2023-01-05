#!/bin/sh
set -euo pipefail

search_engine="https://duckduckgo.com/?q="
#query=$(echo "The world is your oyster ..." | dmenu -c)
query=$(rofi -dmenu -p "Websearch" -l 0 -mesg "The World is Your Oyster")
query="$(echo "${query}" | jq -s -R -r @uri)"  # Use Json parser

brave $search_engine+$query &

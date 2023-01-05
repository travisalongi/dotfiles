set -euo pipefail

search_engine="https://scholar.google.com/scholar?hl=en&as_sdt=0%2C5&q="
#query=$(echo "Search the depths of the literature ..." | dmenu -c)
query=$(rofi -dmenu -p "Google Scholar Search" -l 0 -mesg "Search the depths of the literature")
query="$(echo "${query}" | jq -s -R -r @uri)"  # Use Json parser

brave $search_engine+$query &

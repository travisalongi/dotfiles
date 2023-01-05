#!/usr/bin/sh

BROWSER="firefox"

declare -a options=(
"Amazon - https://www.amazon.com"
"CVLT - http://www.cvltnation.com/"
"Earthquake News - http://temblor.net/earthquake-news/"
"Google Maps - https://maps.google.com"
"Google Scholar - https://scholar.google.com/"
"IRIS Seed Naming - https://ds.iris.edu/ds/nodes/dmc/data/formats/seed-channel-naming/"
"Monkey Type 🐵 - https://monkeytype.com"
"Professional Website - https://travisalongi.github.io"
"NAMMS - https://walrus.wr.usgs.gov/namss/search/"
"Pitchfork Music - https://pitchfork.com/"
"My Github - https://github.com/travisalongi"
"Reddit - https://reddit.com"
"Shearwater Reveal - https://www.shearwatergeo.com/9/reveal-software/client-zone/support"
"Twitter - https://twitter.com/"
"UCSC Health Messenger - https://studenthealth.ucsc.edu/home.aspx"
"UCSC class schedule - https://pisa.ucsc.edu/class_search/index.php"
"USGS Earthquakes -  https://earthquake.usgs.gov/earthquakes/map/"
"Wedding website - https://katieplustravis.info"
"Wiki - https://en.wikipedia.org"
"YouTube - https://youtube.com"
"quit"
)

choice=$(printf '%s\n' "${options[@]}" | dmenu -i -l 50 -c -p "Internet Bookmarks")

if [[ "$choice" == quit ]]; then
	echo "Program Terminated" && exit 1
elif [ "$choice" ]; then
	cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
	$BROWSER "$cfg"
else
	echo "Program Terminated" && exit 1
fi


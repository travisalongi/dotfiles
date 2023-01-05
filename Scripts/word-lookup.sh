#!/bin/bash
word=$(xclip -selection clipboard -o)
#res=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/en_US/$word")
#regex=$'"definition":"\K(.*?)(?=")'
#definitions=$(echo $res | grep -Po "$regex")
#separatedDefinition=$(sed ':a;N;$!ba;s/\n/\n\n/g' <<< "$definitions")
#definition=$(dict -d wn $word | awk 'NR > 5' | sed 2q -)
definition=$(dict -d wn $word | awk 'NR > 5')
#notify-send -u normal -t 10000 "$word" "$separatedDefinition"
dunstify $word "$definition"

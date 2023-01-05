#!/bin/sh
# symbolically linked to /usr/local/bin/fzf_get_full_path

press=$PWD
file=$(find -type f | fzf | sed 's/^..//' | tr -d '\n') 
echo $press/$file | xclip -selection c


#!/bin/sh
# script copied from  https://www.youtube.com/watch?v=hJzqEAf2U4I&list=TLPQMDIwMjIwMjK8RUiYGa-_fw&index=2

languages=`echo "python golang" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk" | tr ' ' '\n'`

selected=`printf "$languages\n\n$core_utils" | fzf`
read -p " query: " query
echo "selected $selected"

if printf $languages | grep -qs $selected; then
	tmux neww bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` | less & while [ : ]; do sleep 1; done"
else
	tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]' do sleep 1; done"
fi



#!/bin/sh

tmux new-session -s Fun -n Asciiquarium -d
tmux new-window -t Fun -d -n Weather
tmux new-window -t Fun -d -n Matrix

tmux send-keys -t Fun:Asciiquarium "asciiquarium" Enter
tmux send-keys -t Fun:Weather "weather" Enter
tmux send-keys -t Fun:Matrix "tmatrix" Enter

tmux select-window -t Fun:Matrix
tmux split-window -h
tmux send-keys -t Fun:Matrix "tmatrix -c red" Enter
tmux split-winow -v
tmux send-keys -t Fun:Matrix "tmatrix -c yellow" Enter
tmux split-window -h
tmux send-keys -t Fun:Matrix "tmatrix -c blue" Enter
tmux select-layout tiled

tmux select-window -t Fun:Asciiquarium
tmux -u attach -t Fun

#!/usr/bin/sh

tmux new-session -s ENV -n Term -d

tmux split-window -h
tmux last-pane
tmux send-keys -t ENV:TERM “emacs -nw” Enter
tmux last-pane
tmux split-window -p80
tmux last-pane
tmux split-window -h
tmux send-keys “tty-clock” Enter
tmux last-pane
tmux send-keys “cal” Enter
tmux last-pane


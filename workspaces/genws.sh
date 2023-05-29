#!/bin/sh

tmux new -d
tmux split-window -h
tmux send-keys 'exa --tree --level=2' C-m
tmux select-layout even-horizontal
tmux split-window -v
tmux select-pane -t 1
tmux resize-pane -t 1 -R 40
tmux resize-pane -t 2 -D 6
tmux send-keys 'hx' C-m 'Space' F
tmux bind -n C-o select-pane -t 3
tmux bind -n C-i select-pane -t 1
tmux unbind -n Tab
tmux a

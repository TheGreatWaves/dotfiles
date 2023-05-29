#!/bin/sh

tmux new -d
tmux split-window -h
tmux send-keys 'exa --tree --level=2' C-m
tmux select-layout even-horizontal
tmux split-window -v
tmux select-pane -t 1
tmux resize-pane -t 1 -R 40
tmux send-keys 'hx' C-m 'Space' F
tmux a

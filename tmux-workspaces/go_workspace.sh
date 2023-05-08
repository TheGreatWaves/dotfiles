#!/bin/sh

tmux new -d

if [ $# -eq 0 ] # No file specified
then
  if [ -f "main.go" ] 
  then
    # Open main by default
    tmux send-keys -t 1 "hx main.go" Enter
  else
    # Open search and find all finds in directory with .go suffix
    tmux send-keys "hx" Enter
    tmux send-keys "Space"
    tmux send-keys F
    tmux send-keys .go  
  fi
else # File specified
  if [ -f "$1" ] 
  then
    # File found, open it
    tmux send-keys -t 1 "hx $1" Enter
  else
    # Open search and find all finds in directory with .go suffix
    tmux send-keys "hx" Enter
    tmux send-keys "Space"
    tmux send-keys F
    tmux send-keys .go  
  fi
fi


tmux splitw -dhp2
tmux a

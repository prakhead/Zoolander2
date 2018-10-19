#!/bin/bash
SESSION=$USER

tmux -2 new-session -d -s $SESSION

# Setup a window for tailing log files
tmux new-window -t $SESSION:1 -n 'Logs'
tmux split-window -v
tmux select-pane -t 1 
tmux send-keys "htop" C-m
tmux select-pane -t 2
tmux send-keys "iftop" C-m
tmux split-window -v
tmux send-keys "docker stats" C-m
tmux select-pane -t 1
tmux split-window -v
tmux send-keys "tail -f /cache/steam/logs/access.log" C-m
tmux split-window -v
tmux send-keys "tail -f /cache/steam/logs/error.log" C-m
tmux attach
#tmux select-layout tiled

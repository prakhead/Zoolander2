#!/bin/bash
SESSION=$USER
TMUX_PANE_INDEX=0
tmux -2 new-session -d -s $SESSION


# Check if panes already exist
tmux select-pane -t 4
RESULT=$?
if [ $RESULT -eq 1 ]; then 
  tmux split-window -h
  tmux split-window -v
  tmux split-window -v
  tmux split-window -v
fi

# Test if we can access pane 0
tmux select-pane -t 0
RESULT=$?
if [ $RESULT -eq 1 ]; then
   TMUX_PANE_INDEX=1
fi   
tmux select-pane -t $((0 + $TMUX_PANE_INDEX))
tmux send-keys "q" C-m # We quit first just in case htop is already running
tmux send-keys "htop" C-m
tmux select-pane -t $((1 + $TMUX_PANE_INDEX))
tmux send-keys "docker stats --format \"table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}\t{{.BlockIO}}\"" C-m
tmux select-pane -t $((2 + $TMUX_PANE_INDEX))
tmux send-keys "q" C-m # We quit first just in case iftop is already running
tmux send-keys "iftop" C-m
tmux select-pane -t $((3 + $TMUX_PANE_INDEX)) 
tmux send-keys "tail -f /cache/steam/logs/access.log" C-m
tmux select-pane -t $((4 + $TMUX_PANE_INDEX))
tmux send-keys "tail -f /cache/steam/logs/error.log" C-m

tmux select-layout tiled

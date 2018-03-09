#!/usr/bin/env bash
# This script fuzzy-finds a tmux window and jumps to it.

# tmux display-message -p -F "#{pane_current_path}" -t0

local files
files=$(tmux list-windows | sort -u | fzf -m -q "$*" -1)
files=$(echo "$files" | perl -n -e '/^(\d+)/ && print $1;')
tmux select-window -t $files

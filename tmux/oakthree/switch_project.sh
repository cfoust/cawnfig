#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SESSION="$(tmux display-message -p '#S')"

project=$(tmux list-windows -t ot -F "#{window_name} [#{window_index}]" | \
           python $SCRIPT_DIR/filter_projects.py | \
           fzf -q "$*" -1 | \
           python $SCRIPT_DIR/extract_window_id.py)

if [ "$SESSION" != "ot" ]; then
  tmux switch-client -t ot\; select-window -t $project
else
  tmux select-window -t $project
fi

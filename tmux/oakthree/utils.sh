#!/usr/bin/env bash
# oakthree
# @tmux, abstracted
# A small set of common logic for working with tmux sessions and fzf.

OT_HEADER_PRE="oakthree ["
OT_HEADER_POST="]"

ot_make_header() {
  echo "$OT_HEADER_PRE$1$OT_HEADER_POST"
}

TM="tmux"
FZF="fzf --margin 40%,30% --border"

tmux_get_session() {
  # Get the current tmux session.
  echo "$($TM display-message -p '#S')"
}

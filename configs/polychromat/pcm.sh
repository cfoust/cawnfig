#!/usr/bin/env bash
# polychromat manages a set of environment variables
# that the rest of my configs respect in order to customize
# the appearance of everything with themes. Instead of just
# skinning individual applications, polychromat harmonizes
# everything into one.
# PCM -- far more curative than TCM.

# These should not be overridden.
export PCM_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#############################################
# C O N F I G U R A B L E  V A R I A B L E S 
#############################################
# All of these variables can and should be set
# by whatever polychromat theme is in use.
#############################################

# The command whose output will be used as the vim startup screen.
# It will be centered on the screen automatically.
unset PCM_VIM_SPLASH

# The vim color scheme to use.
unset PCM_VIM_THEME

#############################################

export PCM_THEME="yahtzee"

export PCM_THEME_DIR="$PCM_DIR/themes/$PCM_THEME"
APPLY="$PCM_THEME_DIR/apply"

if [ ! -f "$APPLY" ]; then
  echo "PCM theme does not exist."
fi

if [ -f "$APPLY" ]; then
  . $APPLY
fi

if [ ! -z "$TMUX" ]; then
  if [ -f "$PCM_THEME_DIR/bg" ]; then
    tmux set-option -g @ot-ui:margin-command "$PCM_THEME_DIR/bg"
  fi
fi

# Computes the hex version of the background color of the Konsole scheme wal
# generates and sets the tmux pane borders to it. This is so we don't see any
# pane borders.
set_tmux_pane_border() {
  theme_file="$HOME/.cache/wal/colors-konsole.colorscheme"

  if ! [ -f "$theme_file" ]; then
    return 0
  fi

  color_line=$(sed "8q;d" "$theme_file")
  [[ "$color_line" =~ ([0-9]+),([0-9]+),([0-9]+) ]]
  r="${BASH_REMATCH[1]}"
  g="${BASH_REMATCH[2]}"
  b="${BASH_REMATCH[3]}"
  hex=\#$(printf "%02X%02X%02X" $r $g $b)
  tmux set -g pane-active-border-style fg="$hex",bg="$hex"
  tmux set -g pane-border-style fg="$hex",bg="$hex"
}

if [ ! -z "$TMUX" ]; then
  set_tmux_pane_border 

  if [ -f "$PCM_THEME_DIR/bg" ]; then
    tmux set-option -g @ot-ui:margin-command "$PCM_THEME_DIR/bg"
  fi

  for letter in {A..Z}; do
    lower=$(echo "$letter" | tr '[:upper:]' '[:lower:]')
    tmux bind $letter run-shell "bash $HOME/.tmux/plugins/tmux-oakthree/bin/quick-project $lower"
  done
fi

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

# The konsole color scheme to use.
unset PCM_KONSOLE_THEME

#############################################

export PCM_THEME="kontrolyor"

export PCM_THEME_DIR="$PCM_DIR/themes/$PCM_THEME"
APPLY="$PCM_THEME_DIR/apply"

if [ ! -f "$APPLY" ]; then
  echo "PCM theme does not exist."
fi

if [ -f "$APPLY" ]; then
  . $APPLY
fi

# Computes the hex version of the background color of the
# iTerm scheme and sets the tmux pane borders to it.
# This is so we don't see any pane borders.
set_tmux_pane_border() {
  theme_file="$PCM_DIR/../../submodules/iTerm2-Color-Schemes/konsole/$PCM_KONSOLE_THEME.colorscheme"
  color_line=$(sed "7q;d" "$theme_file")
  [[ "$color_line" =~ ([0-9]+),([0-9]+),([0-9]+) ]]
  r="${BASH_REMATCH[1]}"
  g="${BASH_REMATCH[2]}"
  b="${BASH_REMATCH[3]}"
  hex=\#$(printf "%02X%02X%02X" $r $g $b)
  tmux set -g pane-active-border-style fg="$hex",bg="$hex"
  tmux set -g pane-border-style fg="$hex",bg="$hex"
}

if [ ! -z "$TMUX" ]; then
  # Set the pane borders to the background color of the konsole theme.
  if [ ! -z "$PCM_KONSOLE_THEME" ]; then
    set_tmux_pane_border
  fi

  if [ -f "$PCM_THEME_DIR/bg" ]; then
    tmux set-option -g @ot-ui:margin-command "$PCM_THEME_DIR/bg"
  fi
fi

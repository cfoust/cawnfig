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

export PCM_THEME="krz"

export PCM_THEME_DIR="$PCM_DIR/themes/$PCM_THEME"
APPLY="$PCM_THEME_DIR/apply"

if [ ! -f "$APPLY" ]; then
  echo "PCM theme does not exist."
fi

if [ -f "$APPLY" ]; then
  . $APPLY
fi

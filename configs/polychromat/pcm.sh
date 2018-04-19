#!/usr/bin/env bash
# polychromat manages a set of environment variables
# that the rest of my configs respect in order to customize
# the appearance of everything with themes. Instead of just
# skinning individual applications, polychromat harmonizes
# everything into one.
# PCM -- far more curative than TCM.

export PCM_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PCM_VIM_STARTUP="toilet -f future STRENGTH"
export PCM_VIM_THEME="base16-cupcake"

tmux set-option -g @ot-ui:margin-command \
  "bash $PCM_DIR/themes/means_of_production"

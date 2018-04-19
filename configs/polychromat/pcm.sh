#!/usr/bin/env bash
# polychromat manages a set of environment variables
# that the rest of my configs respect in order to customize
# the appearance of everything with themes. Instead of just
# skinning individual applications, polychromat harmonizes
# everything into one.
# PCM -- far more curative than TCM.

# These should not be overridden.
export PCM_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PCM_VIM_STARTUP_SCRIPT="$PCM_DIR/vim_splash"

# This is the command that's run to generate the vim splash screen.
# polychromat assumes that the output of this command is 80 characters
# wide so that it can center it on the screen.
export PCM_VIM_STARTUP="toilet -f smmono9 Призрак бродит по Европе - призрак коммунизма."
export PCM_VIM_THEME="base16-cupcake"
export PCM_VIM_THEME="wal"

tmux set-option -g @ot-ui:margin-command \
  "bash $PCM_DIR/themes/means_of_production"

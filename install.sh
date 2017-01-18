# Caleb Foust
# cfoust@sqweebloid.com

# This build script installs everything in cawnfig
# assuming that it's in your home directory.
# Yeah, this should be in your home directory.
CAWNFIG=$HOME/cawnfig

# vim
ln -s $CAWNFIG/vim/.vim $HOME/.vim
ln $CAWNFIG/vim/.vimrc $HOME/.vimrc

# tmux
ln $CAWNFIG/tmux/.tmux.conf $HOME/.tmux.conf

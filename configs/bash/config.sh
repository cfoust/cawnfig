SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$SCRIPT_DIR/osc133.bash"

if [[ $- == *i* ]]; then
  stty -ixon
fi

PS1='\[\033Pcy\033\\\] \[\e[0;31m\]▸▸\W▹\[\e[0m\] \[\e[0;31m\]\[\e[0m\]\[\033[00m\]'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export OS="macos"

# Like there's any other editor.
export VISUAL=vim
export EDITOR="$VISUAL"

# Holds all repositories.
export DEV_DIR="$HOME/Developer"
export CAWNFIG_DIR="$HOME/cawnfig"
export PATH="$PATH:$CAWNFIG_DIR/bin"

################
# A L I A S E S
################
# Borrow some `ls` aliases.
alias ll='ls -alhF --color=auto'
alias la='ls -A'
alias l='ll'

# Easy directory changes.
alias c='cd .. && pwd && ls'
md() {
  mkdir $1; cd $1
}

###################
# G I T  S T U F F
###################
# Ultrafast git aliases
alias g='git'
alias gs='git status'
alias gb='git branch'
alias ga='git add'
alias gn='git checkout -b'
alias gc='git commit'
alias gp='git push origin HEAD'
alias gpp='git push private HEAD'
alias garb='git absorb --and-rebase'
alias v='vim'

# Pretty git log
gl() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}

# Quickly clone new git repos to $DEV_DIR
gg() {
  CURRENT=$(pwd)
  cd "$DEV_DIR"
  git clone ${1}
  cd $CURRENT
}

gr() {
  branch=$(git rev-parse --abbrev-ref HEAD)
  git remote update && git reset --hard origin/$branch
}

gsu() {
  git submodule update --init
}

gnb() {
  tag="$1"
  if [[ $tag == caleb/* ]]; then
    tag=${tag:6}
  fi
  git checkout -b caleb/$(date +'%d-%m-%y')/$tag
}

script() {
  if [ -f "$1" ]; then
    echo "File $1 already exists."
    return 1
  fi

  echo '#!/usr/bin/env bash' > "$1"
  chmod u+x "$1"
}

#####################
# B A S H  T R A S H
#####################
alias grab='sudo apt-get install'

# Re-source bashrc
rs() {
  source ~/.bashrc
}

BASH_PRIVATE="$HOME/.bash-private"

if [ ! -f "$BASH_PRIVATE" ]; then
  cp "$SCRIPT_DIR/private-blank.sh" "$BASH_PRIVATE"
fi

source "$BASH_PRIVATE"

# use ag for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# all are taken from https://github.com/junegunn/fzf/wiki/examples

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -maxdepth 3 -path '*/\.*' -prune \
    -o -type d -print 2> /dev/null | fzf +m) &&
    cd "$dir"
}

# fgb - checkout git branch (including remote branches)
# Lets you switch git branches via fuzzy search.
fgb() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
    branch=$(echo "$branches" |
    fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fgb_recent() {
  local branches=$(git reflog | grep 'moving from .\+' | head -n 30 | perl -n -e '/to ([\/-\w]+)/ && print "$1\n"' | sort -u)
  local branch=$(echo "$branches" | fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m)
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

if [[ $- == *i* ]]; then
  bind '"\C-g": "fgb\n"'
  bind '"\C-h": "fgb_recent\n"'
  bind '"\C-k": "doc\n"'
fi

source "$SCRIPT_DIR/../polychromat/pcm.sh"

source "$HOME/.dolly/source.sh"
alias d="dolly"

copy_ssh() {
  cat $HOME/.ssh/id_rsa.pub | xsel -b
}

if [ -x "$(command -v gh)" ]; then
  eval "$(gh completion -s bash)"
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$SCRIPT_DIR/bash-preexec.sh"

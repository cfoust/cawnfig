# Includes things like my PS2 and simple aliases that I use often.
stty -ixon

PS1=' \[\e[0;31m\]▸▸$(basename $(pwd))▹\[\e[0m\] \[\e[0;31m\]\[\e[0m\]\[\033[00m\]'

# If we're in tmux, we don't need to put the basename
# in the PS1. Just drop it on the tmux window.
#if [ -n "$TMUX" ]; then
  #PS1=' \[\e[0;31m\]▸▸$(tmux rename-window $(basename $(pwd)))▹\[\e[0m\] \[\e[0;31m\]\[\e[0m\]\[\033[00m\]'
#fi

#export TERM='xterm-256color'

# Like there's any other editor.
export VISUAL=vim
export EDITOR="$VISUAL"

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
alias v='vim'

# Pretty git log
gl() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}

# Quickly clone new git repos to ~/Developer
gg() {
  CURRENT=$(pwd)
  cd ~/Developer
  git clone ${1}
  cd $CURRENT
}

#####################
# B A S H  T R A S H
#####################

alias grab='sudo apt-get install'

# Re-source bashrc
rs() {
  source ~/.bashrc
}

# Jump to dotfiles and start a fuzzy search
cawn() {
  cd ~/cawnfig
  vim -c :CtrlP
}

# Convert all .heic images to jpg
tifig-transform() {
  find *.heic -exec tifig -i {} -o {}.jpg \;
}

##################
# B I N D I N G S
##################
# If we have fzf, set up some helpful bindings.
if command -v fzf > /dev/null; then
  # use ag for fzf
  export FZF_DEFAULT_COMMAND='ag -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

  # all are taken from https://github.com/junegunn/fzf/wiki/examples

  # fd - cd to selected directory
  fd() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
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

  # v - open files in ~/.viminfo
  fv() {
    local files
    files=$(grep '^>' ~/.viminfo | cut -c3- |
    while read line; do
      [ -f "${line/\~/$HOME}" ] && echo "$line"
    done | fzf-tmux -d -m -q "$*" -1) && vim ${files//\~/$HOME}
  }


  # Change to a recent Git repository and open vim.
  f() {
    local files
    files=$(grep '^>' ~/.viminfo | cut -c3- |
    while read line; do
      local repo
      repo=$(dirname ${line/\~/$HOME})
      [ -d "$repo/.git" ] && echo "$repo"
    done |
    sort -u |
    fzf-tmux -d -m -q "$*" -1) && cd ${files//\~/$HOME} && clear
  }

  # Change to development dir
  d() {
    local dirs
    dirs=$(ls -p1 ~/Developer/ |
    sort -u |
    fzf-tmux -d -m -q "$*" -1) && cd ~/Developer/${dirs} && clear
  }

  # Fuzzy find tmux windows
  w() {
    local files
    files=$(tmux list-windows | sort -u |
    fzf-tmux -d -m -q "$*" -1)
    files=$(echo "$files" | perl -n -e '/^(\d+)/ && print $1;')
    echo $files
    tmux select-window -t $files
  }
fi

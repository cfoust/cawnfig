# Includes things like my PS2 and simple aliases that I use often.
stty -ixon

# Assume color prompt support. I can't imagine I'll ever work on a
# terminal without it.
PS1=' \[\e[30;47m\] \[\033[01;233m\]$(basename \w)$(tmux rename-window $(basename \w)) \[\e[0m\] \[\033[00m\]'

#export TERM='xterm-256color'

# Like there's any other editor.
export VISUAL=vim
export EDITOR="$VISUAL"

################
# A L I A S E S
################
# Borrow some `ls` aliases.
alias ll='ls -alF --color=auto'
alias la='ls -A'
alias l='ll'

# Easy directory changes.
alias c='cd ..'

# Faster
alias g='git'
alias gs='git status'
alias gb='git branch'
alias gc='git commit'
alias gp='git push origin HEAD'
alias v='vim'

rs() {
  source ~/.bashrc
}

function cawn() {
  cd ~/cawnfig
  vim -c :CtrlP
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

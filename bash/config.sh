# Includes things like my PS1 and simple aliases that I use often.
stty -ixon

# Assume color prompt support. I can't imagine I'll ever work on a
# terminal without it.
PS1=' \[\e[30;47m\] \[\033[01;233m\]$(basename \w)$(tmux rename-window $(basename \w)) \[\e[0m\] \[\033[00m\]'

# Like there's any other editor.
export VISUAL=vim
export EDITOR="$VISUAL"

################
# A L I A S E S
################
# Borrow some `ls` aliases.
alias ll='ls -alF --color=auto'
alias la='ls -A'
alias l='ls -CF --color=auto'

# Easy directory changes.
alias c='cd ..'

function cawn() {
  cd ~/cawnfig
  vim
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
  v() {
    local files
    files=$(grep '^>' ~/.viminfo | cut -c3- |
    while read line; do
      [ -f "${line/\~/$HOME}" ] && echo "$line"
    done | fzf-tmux -d -m -q "$*" -1) && vim ${files//\~/$HOME}
  }
fi

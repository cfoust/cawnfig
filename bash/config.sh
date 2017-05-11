# Includes things like my PS1 and simple aliases that I use often.


# Assume color prompt support. I can't imagine I'll ever work on a
# terminal without it.
PS1='\e[30;48;5;245m \[\033[01;233m\]$(basename \w) \e[0m \[\033[00m\]'

# Like there's any other editor.
export VISUAL=vim
export EDITOR="$VISUAL"

################
# A L I A S E S 
################
# Borrow some `ls` aliases.
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Easy directory changes.
alias c='cd ..'

##################
# B I N D I N G S 
##################
# If we have fzf, set up some helpful bindings.
if command -v fzf>/dev/null; then
  # use ag for fzf
  export FZF_DEFAULT_COMMAND='ag -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

  # fgb - checkout git branch (including remote branches)
  # taken from https://github.com/junegunn/fzf/wiki/examples
  # Lets you switch git branches via fuzzy search.
  fgb() {
    local branches branch
    branches=$(git branch --all | grep -v HEAD) &&
      branch=$(echo "$branches" |
    fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
      git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
  }
fi


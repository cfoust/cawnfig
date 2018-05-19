set fish_greeting ""

# Set the cursor shapes for the different vi modes.
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

# Like there's any other editor.
set -x VISUAL "vim"
set -x EDITOR "$VISUAL"

set -x DEV_DIR "$HOME/Developer"
set -x CAWNFIG_DIR "$HOME/cawnfig"
set -x FZF_DEFAULT_COMMAND 'ag -g ""'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"


# General functions
# ===============
function c --description "Move up a directory."
  cd ..; and pwd; and ls
end

function md --description "Make a directory and change to it."
  mkdir $1; and cd $1
end

function grab
  sudo apt-get install $argv
end

# Borrow some `ls` aliases.
function ll
  ls -alhF --color=auto
end

function l
  ll
end

# Git aliases
# ===============
function gs
  git status
end

function gb
  git branch
end

function ga
  git add $argv
end

function gp
  git push origin HEAD
end

function gl
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
end

function gg
  set current (pwd)
  cd "$DEV_DIR"
  git clone $argv[1]
  cd "$current"
end

function fd
  set dir (find . -path '*/\.*' -prune \
    -o -type d -print 2> /dev/null | fzf +m)
  cd "$dir"
end

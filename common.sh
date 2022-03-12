#!/bin/bash

# Houses all of the cloned-down repositories
export DEV_DIR="$HOME/Developer"
export CAWNFIG_DIR="$HOME/cawnfig"

no_need() {
  echo "No need to $1."
}

missing() {
  ! [ -x "$(command -v $1)" ]
}

_sudo() {
  if missing "sudo"; then
    $@
  else
    sudo $@
  fi
}

apt() {
  _sudo apt-get -qq $@
}

grab() {
  apt -y install $@
}

clone() {
  if [ -z "$SSH_AGENT_PID" ]; then
    git clone https://github.com/$1.git
  else
    git clone git@github.com:$1.git
  fi
}

in_gitpod() {
  ! [ -z "$GITPOD_WORKSPACE_ID" ]
}

missing_package() {
  ! dpkg -l | grep "\s$1\s" > /dev/null 2>&1
}

ensure_package() {
  if missing_package "$1"; then
    grab "$1"
  fi
}

# Ensures that a symlink exists from $2 to $1.
ensure_link() {
  if [ ! -L "$2" ] || [ ! "$(readlink $2)" -ef "$1" ]; then
    rm -rf "$2"
    ln -s "$1" "$2"
  fi
}

# Looks for install scripts matching "install$1" in the
# config folders and runs them.
install() {
  installer_name="install"

  if [ ! -z "$1" ]; then
    installer_name+="_$1"
  fi

  for item in configs/*; do
    cd "$CAWNFIG_DIR"

    [ -e "$item" ] || [ -d "$item" ] || continue

    INSTALLER="$item/$installer_name"

    if [ ! -f "$INSTALLER" ]; then
      continue
    fi

    . $INSTALLER
  done
}

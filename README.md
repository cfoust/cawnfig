Cawnfig
=======

Contains my configurations for various Linux utilities.

Feel free to pick and choose things you like (without attribution!)

Below are some notes on the individual configurations.

## vim
Too much of this is taken from random sources for me to attribute each
individual change. The setup doesn't deviate too much from vim's defaults
other than a higher emphasis on tabs as opposed to buffers:

`t` Opens a new tab.

`,t` Lets you open a file relative to the current directory in a new tab.

`,e` Same thing, but in the current tab. 

`,T` Does a :Texplore.

You can also move between tabs with `C-h` and `C-l`.

## terminator

This (along with the colors for `tmux`) were taken from 
[this Reddit post](https://www.reddit.com/r/unixporn/comments/3cn5gi/tmux_is_my_wm_on_os_x/).
It reminded me a lot of the computer terminals in the Portal series.

## tmux

Since I rebind Caps Lock to Ctrl, this config is based around using `C-a` 
as a leader for tmux commands. There's too much to cover in this file, but
generally my config changes a lot of the default bindings to be more logical.

## i3

i3's default bindings require a lot of strange-looking hand positions, so I
put most of them into a separate binding mode called `vimlike` that you invoke
with `C-j`. After entering that mode you can switch desktops with `jkl;`. See
the config file for more details. Generally it's designed to emphasize full
screen, borderless windows as opposed to floating, smaller windows.

This is because lots of floating windows aren't very conducive to keyboard
navigation.

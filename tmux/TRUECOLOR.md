Tmux has some stupid problems with getting True Color to work.
I've debugged this enough times on enough systems to write a small guide
for myself here on how to fix it again.

First of all, ensure your TERM outside of tmux is set to xterm-256color.
The colors.conf file in this directory should have a matching this:
```
set-option -ga terminal-overrides ",xterm-256color:Tc"
```
Which indicates to tmux that it can output true color ANSI codes.

You can do `tmux info | grep Tc` to check whether everything is set up correctly.
Usually if it says `[missing]` either your TERM outside is not set right
or you aren't setting the terminal-overrides according to the template above.

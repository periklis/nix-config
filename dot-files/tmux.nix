{}: ''
set -g default-terminal "xterm-256color"
set -g default-shell "/run/current-system/sw/bin/zsh"
set -g default-command "reattach-to-user-namespace -l /run/current-system/sw/bin/zsh"
set -g monitor-activity off
set -g visual-activity off
set -g visual-bell off
set -g visual-silence off
set -g bell-action none

bind | split-window -h
bind - split-window -v
unbind '"'
unbind %
''

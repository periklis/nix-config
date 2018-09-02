{}: ''
set -g default-terminal "xterm-256color"
set -g default-shell "/run/current-system/sw/bin/zsh"
set -g default-command "reattach-to-user-namespace -l /run/current-system/sw/bin/zsh"
set -g monitor-activity off
set -g visual-activity off
set -g visual-bell off
set -g visual-silence off
set -g bell-action none
set -g mode-keys emacs
set -g status-keys emacs
set -g status-interval 5
setw -g aggressive-resize on
set -g base-index 1
set -g pane-base-index 1
set -g prefix C-z

# length of tmux status line
set -g status-left-length 30
set -g status-right-length 150

set -g pane-active-border-fg colour8
set -g status-position bottom
set -g status-left '#[bg=colour8]#[fg=colour7] #S #[bg=colour3]#[fg=colour8] '
set -g status-right '#[fg=colour8]#[bg=colour3]#[fg=colour7]#[bg=colour8] #H #[bg=colour3]#[fg=colour0] %a %D %T '

# Set the background color
set -g status-bg colour3

bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
unbind '"'
unbind %
''

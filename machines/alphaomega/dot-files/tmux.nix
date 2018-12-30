{ bash }: ''
set -g default-terminal "screen-256color"
set -g default-shell "/run/current-system/sw/bin/zsh"
set -g escape-time 10
set -g focus-events on
set -g monitor-activity off
set -g visual-activity off
set -g visual-bell off
set -g visual-silence off
set -g bell-action none
setw -g mode-keys emacs
set -g history-limit 5000
set -g status-keys emacs
set -g status-interval 5
set -g base-index 1
set -g pane-base-index 1
set -g prefix C-z

# Set the length of the right status line
set -g status-right-length 150

# Set the background color of the status line
set -g status-bg black

# Setup left and right status lines
set -g status-left "#[fg=black,bg=colour3,bold] #S #[fg=colour3,bg=black,nobold,noitalics,nounderscore]"
set -g status-right "#(${bash}/bin/bash ~/.tmux/plugins/kube.tmux white white white)#[fg=brightblack,bg=black,nobold,noitalics,nounderscore]#[fg=white,bg=brightblack] %Y-%m-%d #[fg=white,bg=brightblack,nobold,noitalics,nounderscore]#[fg=white,bg=brightblack] %H:%M #[fg=colour3,bg=brightblack,nobold,noitalics,nounderscore]#[fg=black,bg=colour3,bold] #H "

# Set window status format
set -g window-status-format "#[fg=black,bg=brightblack,nobold,noitalics,nounderscore] #[fg=white,bg=brightblack]#I #[fg=white,bg=brightblack,nobold,noitalics,nounderscore] #[fg=white,bg=brightblack]#W #F #[fg=brightblack,bg=black,nobold,noitalics,nounderscore]"
set -g window-status-current-format "#[fg=black,bg=colour3,nobold,noitalics,nounderscore] #[fg=black,bg=colour3]#I #[fg=black,bg=colour3,nobold,noitalics,nounderscore] #[fg=black,bg=colour3]#W #F #[fg=colour3,bg=black,nobold,noitalics,nounderscore]"
set -g window-status-separator ""

bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
unbind '"'
unbind %
''

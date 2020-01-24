
# vi: filetype=tmux

# ==============================================================================
# NAVIGATION
# ==============================================================================

# Switch Session <M-S-Number>
bind-key -n 'M-!' run-shell '~/.tmux/bin/switch-session.bash next 1'
bind-key -n 'M-@' run-shell '~/.tmux/bin/switch-session.bash next 2'
bind-key -n 'M-#' run-shell '~/.tmux/bin/switch-session.bash next 3'
bind-key -n 'M-$' run-shell '~/.tmux/bin/switch-session.bash next 4'
bind-key -n 'M-%' run-shell '~/.tmux/bin/switch-session.bash next 5'
bind-key -n 'M-^' run-shell '~/.tmux/bin/switch-session.bash next 6'
bind-key -n 'M-&' run-shell '~/.tmux/bin/switch-session.bash next 7'
bind-key -n 'M-*' run-shell '~/.tmux/bin/switch-session.bash next 8'
bind-key -n 'M-(' run-shell '~/.tmux/bin/switch-session.bash next 9'
bind-key -n 'M-)' run-shell '~/.tmux/bin/switch-session.bash next 0'

# Switch to next/previous window with <M-S-h/l>
bind-key -n M-H previous-window
bind-key -n M-L     next-window

# Switch to last window
bind-key -n M-- select-window -l

# Select Windows <M-#>
bind-key -n M-1 select-window -t 1
bind-key -n M-2 select-window -t 2
bind-key -n M-3 select-window -t 3
bind-key -n M-4 select-window -t 4
bind-key -n M-5 select-window -t 5
bind-key -n M-6 select-window -t 6
bind-key -n M-7 select-window -t 7
bind-key -n M-8 select-window -t 8
bind-key -n M-9 select-window -t 9
bind-key -n M-0 select-window -t 10

# Switch panes with <M-h/j/k/l>
bind-key -n M-k resize-pane -y 1 \; select-pane -U \; resize-pane -y 999
bind-key -n M-j resize-pane -y 1 \; select-pane -D \; resize-pane -y 999
bind-key -n M-h select-pane -L
bind-key -n M-l select-pane -R

# Toggle zoom
bind-key -n M-f resize-pane -Z


# ==============================================================================
# NEW/MODIFY/KILL
# ==============================================================================

# Rename session
bind-key -n M-R command-prompt 'rename-session %%'

# New window
bind-key -n M-N new-window -c '#{pane_current_path}'

# Swap window with <M-Shift-Arrow>
bind-key -n S-M-Left  swap-window -t -1 \; select-window -t -1
bind-key -n S-M-Right swap-window -t +1 \; select-window -t +1

# I no longer kill windows, instead I kill each pane individually
# Close window <M-Shift-W>
#bind-key -n M-W confirm-before -p "kill-window #W? (y/n)" kill-window
#bind-key -n M-W kill-window

# Rename window
bind-key -n M-r command-prompt 'rename-window %%'

# New pane with <M-S/s/V/v>
bind-key -n M-S split-window -vf -c '#{pane_current_path}' \; resize-pane -y 999
bind-key -n M-s split-window -v  -c '#{pane_current_path}' \; resize-pane -y 999
bind-key -n M-V split-window -hf -c '#{pane_current_path}'
bind-key -n M-v split-window -h  -c '#{pane_current_path}'

# Resize pane with <M-Arrow>
bind-key -n M-Left  resize-pane -L
bind-key -n M-Right resize-pane -R
# Basically useless because my panes are always being vertically resized
#bind-key -n M-Up    resize-pane -U
#bind-key -n M-Down  resize-pane -D

# Swap pane with pane above/below with <M-PageUp/PageDown>
bind-key -n M-PPage swap-pane -U \; resize-pane -y 999
bind-key -n M-NPage swap-pane -D \; resize-pane -y 999

# Close pane using kill-pane.bash
# kill-pane.bash prevents killing panes if certain processes are running
bind-key -n M-w run-shell ~/.tmux/bin/kill-pane.bash \; resize-pane -y 999

# Even layout
bind-key -n M-= select-layout -E

# I accidentally press these key combination way too much and screw up my layout
# So instead I am now using next/previous window:
# Select next/previous layout with <M-</>>
#bind-key -n M-> next-layout
#bind-key -n M-< previous-layout
bind-key -n M-> rotate-window -D
bind-key -n M-< rotate-window -U


# ==============================================================================
# WINDOWS
# ==============================================================================

# Synchronize panes on/off with with <M-Z/z>
bind-key -n M-Z set-window-option synchronize-panes on
bind-key -n M-z set-window-option synchronize-panes off


# ==============================================================================
# PANES
# ==============================================================================

# Copy pane directory <M-d>
bind-key -n M-d run-shell -b ~/.tmux/bin/copy-pane-path.bash

# Enter "vim-mode" <M-F>
bind-key -n M-F run-shell -b "$HOME/.tmux/plugins/tmux-scratchpad/scripts/scratch_pane.bash '~/.tmux/bin/vim-pane.bash #{pane_id}'"


# ==============================================================================
# MISC
# ==============================================================================

# Reload .tmux.conf
bind-key -n M-F5 source-file ~/.tmux.conf

# TODO: Choose new key-bindings, these are replaced with switch-session
# Choose colorscheme <M-S-1/2/3/4/5/6>
#bind-key -n 'M-!' run-shell '~/.tmux/bin/colorscheme.zsh red'
#bind-key -n 'M-@' run-shell '~/.tmux/bin/colorscheme.zsh yellow'
#bind-key -n 'M-#' run-shell '~/.tmux/bin/colorscheme.zsh green'
#bind-key -n 'M-$' run-shell '~/.tmux/bin/colorscheme.zsh blue'
#bind-key -n 'M-%' run-shell '~/.tmux/bin/colorscheme.zsh purple'
#bind-key -n 'M-^' run-shell '~/.tmux/bin/colorscheme.zsh black'


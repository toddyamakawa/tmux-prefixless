#!/usr/bin/env bash
declare -r CURRENT_DIR=$(dirname $(readlink -f ${BASH_SOURCE[0]}))

# ==============================================================================
# CLIENT
# ==============================================================================
tmux bind-key -n M-Q detach-client


# ==============================================================================
# NAVIGATION
# ==============================================================================

# Choose a session
tmux \
	bind-key -n M-a choose-session \; \
	bind-key -n M-A run-shell "$CURRENT_DIR/bin/choose-session.bash"

# Switch to next/previous session with <M-S-j/k>
tmux \
	bind-key -n M-J switch-client -n \; \
	bind-key -n M-K switch-client -p

# Switch to last session
tmux bind-key -n M-_ switch-client -l

# Switch Session <M-S-Number>
tmux \
	bind-key -n 'M-!' run-shell "$CURRENT_DIR/bin/switch-session.bash next 1" \; \
	bind-key -n 'M-@' run-shell "$CURRENT_DIR/bin/switch-session.bash next 2" \; \
	bind-key -n 'M-#' run-shell "$CURRENT_DIR/bin/switch-session.bash next 3" \; \
	bind-key -n 'M-$' run-shell "$CURRENT_DIR/bin/switch-session.bash next 4" \; \
	bind-key -n 'M-%' run-shell "$CURRENT_DIR/bin/switch-session.bash next 5" \; \
	bind-key -n 'M-^' run-shell "$CURRENT_DIR/bin/switch-session.bash next 6" \; \
	bind-key -n 'M-&' run-shell "$CURRENT_DIR/bin/switch-session.bash next 7" \; \
	bind-key -n 'M-*' run-shell "$CURRENT_DIR/bin/switch-session.bash next 8" \; \
	bind-key -n 'M-(' run-shell "$CURRENT_DIR/bin/switch-session.bash next 9" \; \
	bind-key -n 'M-)' run-shell "$CURRENT_DIR/bin/switch-session.bash next 0"

# Switch to next/previous window with <M-S-h/l>
tmux \
	bind-key -n M-< previous-window \;
	bind-key -n M-> next-window     \; \
	bind-key -n M-H previous-window \; \
	bind-key -n M-L next-window

# Switch to last window
tmux bind-key -n M-- select-window -l

# Select Windows <M-#>
tmux \
	bind-key -n M-1 select-window -t 1 \; \
	bind-key -n M-2 select-window -t 2 \; \
	bind-key -n M-3 select-window -t 3 \; \
	bind-key -n M-4 select-window -t 4 \; \
	bind-key -n M-5 select-window -t 5 \; \
	bind-key -n M-6 select-window -t 6 \; \
	bind-key -n M-7 select-window -t 7 \; \
	bind-key -n M-8 select-window -t 8 \; \
	bind-key -n M-9 select-window -t 9 \; \
	bind-key -n M-0 select-window -t 10

# Switch panes with <M-h/j/k/l>
tmux \
	bind-key -n M-k 'resize-pane -y 1 ; select-pane -U ; resize-pane -y 999' \; \
	bind-key -n M-j 'resize-pane -y 1 ; select-pane -D ; resize-pane -y 999'
tmux \
	bind-key -n M-h select-pane -L \; \
	bind-key -n M-l select-pane -R

# Toggle zoom
tmux bind-key -n M-f resize-pane -Z


# ==============================================================================
# SESSION
# ==============================================================================

# Rename session with <M-R>
tmux bind-key -n M-R command-prompt 'rename-session %%'

# I no longer kill windows, instead I kill each pane individually
# Close window <M-Shift-W>
#bind-key -n M-W confirm-before -p "kill-window #W? (y/n)" kill-window
#bind-key -n M-W kill-window

# New pane with <M-S/s/V/v>
tmux bind-key -n M-S "split-window -vf -c '#{pane_current_path}' ; resize-pane -y 999"
tmux bind-key -n M-s "split-window -v  -c '#{pane_current_path}' ; resize-pane -y 999"
tmux bind-key -n M-V "split-window -hf -c '#{pane_current_path}'"
tmux bind-key -n M-v "split-window -h  -c '#{pane_current_path}'"

# Resize pane with <M-Arrow>
tmux \
	bind-key -n M-Left  resize-pane -L \; \
	bind-key -n M-Right resize-pane -R \; \
	bind-key -n M-Up    resize-pane -U \; \
	bind-key -n M-Down  resize-pane -D

# Swap pane with pane above/below with <M-PageUp/PageDown>
tmux \
	bind-key -n 'M-PPage swap-pane -U ; resize-pane -y 999' \; \
	tmux bind-key -n 'M-NPage swap-pane -D ; resize-pane -y 999'

# Close pane using kill-pane.bash
# kill-pane.bash prevents killing panes if certain processes are running
tmux bind-key -n M-w "run-shell $CURRENT_DIR/bin/kill-pane.bash ; resize-pane -y 999"

# ==============================================================================
# WINDOWS
# ==============================================================================

# New/rename/swap window with <M-N/r/S-Left/S-Right>
tmux \
	bind-key -n M-N       new-window -c '#{pane_current_path}'       \; \
	bind-key -n M-r       command-prompt 'rename-window %%'          \; \
	bind-key -n S-M-Left  'swap-window -t -1 \; select-window -t -1' \; \
	bind-key -n S-M-Right 'swap-window -t +1 \; select-window -t +1'

# Synchronize panes on/off with with <M-Z/z>
tmux \
	bind-key -n M-Z set-window-option synchronize-panes on \; \
	bind-key -n M-z set-window-option synchronize-panes off

# Make layout even with <M-=>
tmux bind-key -n M-= select-layout -E


# ==============================================================================
# PANES
# ==============================================================================

# Copy pane directory <M-d>
tmux bind-key -n M-d "run-shell -b $CURRENT_DIR/bin/copy-pane-path.bash"

# TODO: Unhardcode scratch path
# Enter "vim-mode" <M-F>
tmux bind-key -n M-F run-shell -b "$HOME/.tmux/plugins/tmux-scratchpad/scripts/scratch_pane.bash '~/.tmux/bin/vim-pane.bash #{pane_id}'"


# ==============================================================================
# MISC
# ==============================================================================

# Reload .tmux.conf
tmux bind-key -n M-F5 source-file ~/.tmux.conf

# TODO: Choose new key-bindings, these are replaced with switch-session
# Choose colorscheme <M-S-1/2/3/4/5/6>
#bind-key -n 'M-!' run-shell '~/.tmux/bin/colorscheme.zsh red'
#bind-key -n 'M-@' run-shell '~/.tmux/bin/colorscheme.zsh yellow'
#bind-key -n 'M-#' run-shell '~/.tmux/bin/colorscheme.zsh green'
#bind-key -n 'M-$' run-shell '~/.tmux/bin/colorscheme.zsh blue'
#bind-key -n 'M-%' run-shell '~/.tmux/bin/colorscheme.zsh purple'
#bind-key -n 'M-^' run-shell '~/.tmux/bin/colorscheme.zsh black'


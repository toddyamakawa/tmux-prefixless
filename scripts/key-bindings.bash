#!/usr/bin/env bash
declare -r CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#set -e

# Map everything into a key table instead of root
keytable=prefixless


# ==============================================================================
# CLIENT
# ==============================================================================
tmux bind-key -T "$keytable" M-Q detach-client


# ==============================================================================
# NAVIGATION
# ==============================================================================

# Choose a session
tmux \
	bind-key -T "$keytable" M-a choose-session -O name\; \
	bind-key -T "$keytable" M-A run-shell 'tmux-switch pane'

# Switch to next/previous session with <M-S-j/k>
tmux \
	bind-key -T "$keytable" M-J switch-client -n \; \
	bind-key -T "$keytable" M-K switch-client -p

# Switch to last session
tmux bind-key -T "$keytable" M-_ switch-client -l

# Switch Session <M-S-Number>
tmux \
	bind-key -T "$keytable" 'M-!' run-shell "$CURRENT_DIR/bin/switch-session.bash next 1" \; \
	bind-key -T "$keytable" 'M-@' run-shell "$CURRENT_DIR/bin/switch-session.bash next 2" \; \
	bind-key -T "$keytable" 'M-#' run-shell "$CURRENT_DIR/bin/switch-session.bash next 3" \; \
	bind-key -T "$keytable" 'M-$' run-shell "$CURRENT_DIR/bin/switch-session.bash next 4" \; \
	bind-key -T "$keytable" 'M-%' run-shell "$CURRENT_DIR/bin/switch-session.bash next 5" \; \
	bind-key -T "$keytable" 'M-^' run-shell "$CURRENT_DIR/bin/switch-session.bash next 6" \; \
	bind-key -T "$keytable" 'M-&' run-shell "$CURRENT_DIR/bin/switch-session.bash next 7" \; \
	bind-key -T "$keytable" 'M-*' run-shell "$CURRENT_DIR/bin/switch-session.bash next 8" \; \
	bind-key -T "$keytable" 'M-(' run-shell "$CURRENT_DIR/bin/switch-session.bash next 9" \; \
	bind-key -T "$keytable" 'M-)' run-shell "$CURRENT_DIR/bin/switch-session.bash next 0"

# Switch to next/previous window with <M-S-h/l>
tmux \
	bind-key -T "$keytable" 'M-<' previous-window \; \
	bind-key -T "$keytable" 'M->' next-window     \; \
	bind-key -T "$keytable" 'M-H' previous-window \; \
	bind-key -T "$keytable" 'M-L' next-window

# Switch to last window
tmux bind-key -T "$keytable" 'M--' select-window -l

# Select Windows <M-#>
tmux \
	bind-key -T "$keytable" M-1 select-window -t 1 \; \
	bind-key -T "$keytable" M-2 select-window -t 2 \; \
	bind-key -T "$keytable" M-3 select-window -t 3 \; \
	bind-key -T "$keytable" M-4 select-window -t 4 \; \
	bind-key -T "$keytable" M-5 select-window -t 5 \; \
	bind-key -T "$keytable" M-6 select-window -t 6 \; \
	bind-key -T "$keytable" M-7 select-window -t 7 \; \
	bind-key -T "$keytable" M-8 select-window -t 8 \; \
	bind-key -T "$keytable" M-9 select-window -t 9 \; \
	bind-key -T "$keytable" M-0 select-window -t 10

# Switch panes with <M-h/j/k/l>
tmux \
	bind-key -T "$keytable" M-k 'resize-pane -y 1 ; select-pane -U ; resize-pane -y 999' \; \
	bind-key -T "$keytable" M-j 'resize-pane -y 1 ; select-pane -D ; resize-pane -y 999'
tmux \
	bind-key -T "$keytable" M-h select-pane -L \; \
	bind-key -T "$keytable" M-l select-pane -R

# Toggle zoom
tmux bind-key -T "$keytable" M-f resize-pane -Z


# ==============================================================================
# SESSION
# ==============================================================================

# Rename session with <M-R>
tmux bind-key -T "$keytable" M-R command-prompt 'rename-session %%'

# I no longer kill windows, instead I kill each pane individually
# Close window <M-Shift-W>
#bind-key -T "$keytable" M-W confirm-before -p "kill-window #W? (y/n)" kill-window
#bind-key -T "$keytable" M-W kill-window

# New pane with <M-S/s/V/v>
tmux bind-key -T "$keytable" M-S "split-window -vf -c '#{pane_current_path}' ; resize-pane -y 999"
tmux bind-key -T "$keytable" M-s "split-window -v  -c '#{pane_current_path}' ; resize-pane -y 999"
tmux bind-key -T "$keytable" M-V "split-window -hf -c '#{pane_current_path}'"
tmux bind-key -T "$keytable" M-v "split-window -h  -c '#{pane_current_path}'"

# Resize pane with <M-Arrow>
tmux \
	bind-key -T "$keytable" M-Left  resize-pane -L \; \
	bind-key -T "$keytable" M-Right resize-pane -R \; \
	bind-key -T "$keytable" M-Up    resize-pane -U \; \
	bind-key -T "$keytable" M-Down  resize-pane -D

# Swap pane with pane above/below with <M-PageUp/PageDown>
tmux \
	bind-key -T "$keytable" 'M-PPage' 'swap-pane -U ; resize-pane -y 999' \; \
	bind-key -T "$keytable" 'M-NPage' 'swap-pane -D ; resize-pane -y 999'

# Close pane using kill-pane.bash
# kill-pane.bash prevents killing panes if certain processes are running
tmux bind-key -T "$keytable" M-w "run-shell $CURRENT_DIR/bin/kill-pane.bash ; resize-pane -y 999"


# ==============================================================================
# WINDOWS
# ==============================================================================

# New/rename/swap window with <M-N/r/S-Left/S-Right>
tmux \
	bind-key -T "$keytable" M-N         "run-shell -b $CURRENT_DIR/bin/new-window-menu.bash" \; \
	bind-key -T "$keytable" M-n         "run-shell -b $CURRENT_DIR/bin/new-window.bash" \; \
	bind-key -T "$keytable" 'S-M-Left'  'swap-window -t -1 ; select-window -t -1' \; \
	bind-key -T "$keytable" 'S-M-Right' 'swap-window -t +1 ; select-window -t +1' \; \
	bind-key -T "$keytable" M-r         "command-prompt 'rename-window %%'"

# Synchronize panes on/off with with <M-Z/z>
tmux \
	bind-key -T "$keytable" M-Z set-window-option synchronize-panes on \; \
	bind-key -T "$keytable" M-z set-window-option synchronize-panes off

# Make layout even with <M-=>
tmux bind-key -T "$keytable" M-= select-layout -E


# ==============================================================================
# PANES
# ==============================================================================

# Copy pane directory <M-d>
tmux bind-key -T "$keytable" M-d "run-shell -b $CURRENT_DIR/bin/copy-pane-path.bash"

# TODO: Unhardcode scratch path
# Enter "vim-mode" <M-F>
tmux bind-key -T "$keytable" M-F run-shell -b "$HOME/.tmux/plugins/tmux-scratchpad/scripts/scratch_pane.bash '~/.tmux/bin/vim-pane.bash #{pane_id}'"

# Mark pane
tmux bind-key -T "$keytable" M-m select-pane -m


# ==============================================================================
# COPY-MODE-VI
# ==============================================================================
tmux set-window-option -g mode-keys vi

# Use tmux-picker plugin
plugin_dir="$HOME/.tmux/plugins"
tmux_picker="$plugin_dir/tmux-picker/tmux-picker.sh"
if [[ -x "$tmux_picker" ]]; then
	tmux bind-key -T "$keytable" M-y run-shell "$tmux_picker"
fi

# Enter copy mode
tmux bind-key -T "$keytable" M-Y copy-mode

# Select from paste-buffer
tmux bind-key -n M-P choose-buffer "paste-buffer -b %%"

# Copy Selection to System Clipboard <y>
if (type copy-osc52 &>/dev/null); then
	# https://medium.com/free-code-camp/tmux-in-practice-integration-with-system-clipboard-bcd72c62ff7b
	tmux set-option -g set-clipboard on
	tmux bind-key -T copy-mode-vi y send-keys -X copy-pipe copy-osc52
elif (type xclip &>/dev/null); then
	tmux bind-key -T copy-mode-vi y send-keys -X copy-pipe xclip
else
	tmux bind-key -T copy-mode-vi y send-keys -X copy-pipe xclip
fi

# Page up/down <K/J>
tmux \
	bind-key -T copy-mode-vi K   "run-shell -b '$CURRENT_DIR/bin/smooth-scroll.bash   up    5'" \; \
	bind-key -T copy-mode-vi J   "run-shell -b '$CURRENT_DIR/bin/smooth-scroll.bash down    5'" \; \
	bind-key -T copy-mode-vi C-u "run-shell -b '$CURRENT_DIR/bin/smooth-scroll.bash   up half'" \; \
	bind-key -T copy-mode-vi C-d "run-shell -b '$CURRENT_DIR/bin/smooth-scroll.bash down half'"

# End of Line <L>
tmux bind-key -T copy-mode-vi L send-keys -X end-of-line

# Start of Line <H>
tmux bind-key -T copy-mode-vi H send-keys -X start-of-line


# ==============================================================================
# MISC
# ==============================================================================

# Reload .tmux.conf
tmux bind-key -T "$keytable" M-F5 source-file ~/.tmux.conf

tmux bind-key -T "$keytable" M-: command-prompt
tmux bind-key -T "$keytable" M-P choose-buffer "paste-buffer -b %%"

# TODO: Choose new key-bindings, these are replaced with switch-session
# Choose colorscheme <M-S-1/2/3/4/5/6>
#bind-key -T "$keytable" 'M-!' run-shell '~/.tmux/bin/colorscheme.zsh red'
#bind-key -T "$keytable" 'M-@' run-shell '~/.tmux/bin/colorscheme.zsh yellow'
#bind-key -T "$keytable" 'M-#' run-shell '~/.tmux/bin/colorscheme.zsh green'
#bind-key -T "$keytable" 'M-$' run-shell '~/.tmux/bin/colorscheme.zsh blue'
#bind-key -T "$keytable" 'M-%' run-shell '~/.tmux/bin/colorscheme.zsh purple'
#bind-key -T "$keytable" 'M-^' run-shell '~/.tmux/bin/colorscheme.zsh black'


# ==============================================================================
# SET KEY-TABLE
# ==============================================================================
tmux set-option -gs key-table "$keytable"

# Enable/disable prefixless
tmux bind-key -T "root" M-o "set-option -gs key-table $keytable"
tmux bind-key -T "$keytable" M-i "set-option -gs key-table root"


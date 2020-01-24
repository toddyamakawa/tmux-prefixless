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
	bind-key -n M-H previous-window \; \
	bind-key -n M-L     next-window

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




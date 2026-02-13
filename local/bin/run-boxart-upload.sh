#!/usr/bin/env bash

# Absolute path to your boxart upload script
BOXART_UPLOAD="$HOME/.local/bin/retrofi-boxart-refresh.sh"

# Detect a usable terminal
TERM_CMD=$(command -v gnome-terminal  command -v konsole  command -v xfce4-terminal || command -v xterm)

# Fallback to xterm
[[ -z "$TERM_CMD" ]] && TERM_CMD="xterm"

# Make sure HOME is set (needed if launched from rofi)
export HOME="$HOME"

# Launch the boxart uploader with sudo inside the terminal
$TERM_CMD -e "bash -l -c 'sudo \"$BOXART_UPLOAD\"; exec bash'"

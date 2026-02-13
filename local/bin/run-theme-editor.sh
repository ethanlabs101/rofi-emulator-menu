#!/usr/bin/env bash

# Absolute path to your theme manager
THEME_MANAGER="$HOME/.local/bin/rofi-theme-manager.sh"

# Detect a usable terminal
TERM_CMD=$(command -v gnome-terminal  command -v konsole  command -v xfce4-terminal || command -v xterm)

# Fallback to xterm
[[ -z "$TERM_CMD" ]] && TERM_CMD="xterm"

# Make sure HOME is set (needed if launched from rofi)
export HOME="$HOME"

# Launch the theme manager with sudo inside the terminal
$TERM_CMD -e "bash -l -c 'sudo \"$THEME_MANAGER\"; exec bash'"

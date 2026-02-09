#!/usr/bin/env bash

### -------- CONFIG --------

# Resolve real user even under sudo
REAL_USER="${SUDO_USER:-$USER}"
REAL_HOME="$(getent passwd "$REAL_USER" | cut -d: -f6)"

THEME_DIR="/usr/share/rofi/themes"
BG_DIR="$THEME_DIR/backgrounds"
ACTIVE_BG="$THEME_DIR/ethanlabs101.png"

RASI_FILE="$REAL_HOME/.config/rofi/game-theme/ethanlabs101.rasi"

### -------- ROOT CHECK --------
if [[ $EUID -ne 0 ]]; then
  echo "Run with sudo or pkexec."
  exit 1
fi

mkdir -p "$BG_DIR"

pause() { read -rp "Press Enter to continue..."; }

### -------- COLORS --------
COLORS=(
  "Cyan:#00FEFC"
  "White:#FFFFFF"
  "Soft Pink:#FFB7C5"
  "Neon Blue:#1E90FF"
  "Purple:#A855F7"
  "Red:#FF5555"
  "Orange:#FF9F1C"
  "Yellow:#FACC15"
  "Green:#22C55E"
  "Ice Blue:#7DD3FC"
  "Teal:#14B8A6"
  "Sky:#38BDF8"
  "Rose:#FB7185"
  "Violet:#8B5CF6"
  "Amber:#F59E0B"
  "Lime:#84CC16"
  "Emerald:#10B981"
  "Indigo:#6366F1"
  "Slate:#CBD5E1"
  "Magenta:#EC4899"
)

### -------- APPLY BACKGROUND --------
apply_background() {
  local IMG="$1"
  if [[ ! -f "$IMG" ]]; then
    echo "Image not found."
    pause
    return
  fi
  rm -f "$ACTIVE_BG"
  cp "$IMG" "$ACTIVE_BG"
  echo "Background applied."
  pause
}

### -------- SELECT BACKGROUND --------
select_background() {
  mapfile -t FILES < <(ls "$BG_DIR" 2>/dev/null)
  [[ ${#FILES[@]} -eq 0 ]] && echo "No backgrounds found." && pause && return

  echo "Select background:"
  for i in "${!FILES[@]}"; do
    echo "$((i+1))) ${FILES[$i]}"
  done
  echo "0) Cancel"

  read -rp "> " IDX
  [[ "$IDX" == "0" ]] && return

  INDEX=$((IDX-1))
  [[ -z "${FILES[$INDEX]}" ]] && echo "Invalid choice." && pause && return
  apply_background "$BG_DIR/${FILES[$INDEX]}"
}

### -------- IMPORT BACKGROUND --------
import_background() {
  # Get the real user even when running under sudo
  REAL_USER="${SUDO_USER:-$USER}"
  REAL_HOME="$(getent passwd "$REAL_USER" | cut -d: -f6)"

  read -rp "Full path to image: " RAW

  # Expand ~ using the real user's home
  IMG="${RAW/#\~/$REAL_HOME}"

  if [[ ! -f "$IMG" ]]; then
    echo "File does not exist."
    pause
    return
  fi

  EXT="${IMG##*.}"
  EXT="${EXT,,}"  # lowercase
  [[ ! "$EXT" =~ ^(png|jpg|jpeg)$ ]] && echo "Invalid image type." && pause && return

  DEST="$BG_DIR/$(basename "$IMG")"

  # Copy and fix ownership so the user can see/use it later
  cp "$IMG" "$DEST" && chown "$REAL_USER":"$REAL_USER" "$DEST"

  echo "Imported to $DEST"
  read -rp "Apply now? (y/N): " APPLY
  [[ "$APPLY" =~ ^[Yy]$ ]] && apply_background "$DEST"
}

### -------- PATCH RASI --------
patch_rasi() {
  local COLOR="$1"
  local FONT="$2"

  [[ ! -f "$RASI_FILE" ]] && echo "Theme file missing." && pause && return
  sed -i '/text-color:/d' "$RASI_FILE"
  sed -i '/font:/d' "$RASI_FILE"

  sed -i "/\* {/a\    text-color: $COLOR;" "$RASI_FILE"
  sed -i "/\* {/a\    font: \"$FONT\";" "$RASI_FILE"

  echo "Text updated."
  pause
}

### -------- TEXT MENU (COLOR + FONT) --------
text_menu() {
  # Choose color first
  echo "Choose text color:"
  for i in "${!COLORS[@]}"; do
    NAME="${COLORS[$i]%%:*}"
    echo "$((i+1))) $NAME"
  done
  echo "0) Cancel"
  read -rp "> " IDX
  [[ "$IDX" == "0" ]] && return

  COLOR_PAIR="${COLORS[$((IDX-1))]}"
  [[ -z "$COLOR_PAIR" ]] && echo "Invalid choice." && pause && return
  COLOR="${COLOR_PAIR##*:}"

  # --- DYNAMIC FONT SELECTION ---
  mapfile -t SYSTEM_FONTS < <(fc-list :family | sort -u)
  SYSTEM_FONTS+=("Info")

  echo "Select font:"
  select FONT_NAME in "${SYSTEM_FONTS[@]}"; do
    if [[ "$FONT_NAME" == "Info" ]]; then
      echo
      echo "INFO:"
      echo "All system-wide fonts appear here. Install fonts and reopen this menu to see them."
      pause
      return
    fi
    [[ -n "$FONT_NAME" ]] && break
  done

  # Font size
  read -rp "Font Size (8-24): " SIZE
  [[ ! "$SIZE" =~ ^[0-9]+$ ]] && SIZE=12
  (( SIZE < 8 )) && SIZE=8
  (( SIZE > 24 )) && SIZE=24

  # Bold
  read -rp "Bold? (Y/n): " B
  [[ "$B" =~ ^[Yy]$ ]] && FONT_NAME+=" Bold"

  # Italic
  read -rp "Italic? (Y/n): " I
  [[ "$I" =~ ^[Yy]$ ]] && FONT_NAME+=" Italic"

  # Combine font and size
  FONT_STYLE="$FONT_NAME $SIZE"

  patch_rasi "$COLOR" "$FONT_STYLE"
}

### -------- MAIN MENU --------
while true; do
  clear
  echo "▓█████▄▄▄█████▓ ██░ ██  ▄▄▄       ███▄    █  ██▓    ▄▄▄       ▄▄▄▄     ██████  ██▓ ▒█████   ██▓";
echo "▓█   ▀▓  ██▒ ▓▒▓██░ ██▒▒████▄     ██ ▀█   █ ▓██▒   ▒████▄    ▓█████▄ ▒██    ▒ ▓██▒▒██▒  ██▒▓██▒";
echo "▒███  ▒ ▓██░ ▒░▒██▀▀██░▒██  ▀█▄  ▓██  ▀█ ██▒▒██░   ▒██  ▀█▄  ▒██▒ ▄██░ ▓██▄   ▒██▒▒██░  ██▒▒██▒";
echo "▒▓█  ▄░ ▓██▓ ░ ░▓█ ░██ ░██▄▄▄▄██ ▓██▒  ▐▌██▒▒██░   ░██▄▄▄▄██ ▒██░█▀    ▒   ██▒░██░▒██   ██░░██░";
echo "░▒████▒ ▒██▒ ░ ░▓█▒░██▓ ▓█   ▓██▒▒██░   ▓██░░██████▒▓█   ▓██▒░▓█  ▀█▓▒██████▒▒░██░░ ████▓▒░░██░";
echo "░░ ▒░ ░ ▒ ░░    ▒ ░░▒░▒ ▒▒   ▓▒█░░ ▒░   ▒ ▒ ░ ▒░▓  ░▒▒   ▓▒█░░▒▓███▀▒▒ ▒▓▒ ▒ ░░▓  ░ ▒░▒░▒░ ░▓  ";
echo " ░ ░  ░   ░     ▒ ░▒░ ░  ▒   ▒▒ ░░ ░░   ░ ▒░░ ░ ▒  ░ ▒   ▒▒ ░▒░▒   ░ ░ ░▒  ░ ░ ▒ ░  ░ ▒ ▒░  ▒ ░";
echo "   ░    ░       ░  ░░ ░  ░   ▒      ░   ░ ░   ░ ░    ░   ▒    ░    ░ ░  ░  ░   ▒ ░░ ░ ░ ▒   ▒ ░";
echo "   ░  ░         ░  ░  ░      ░  ░         ░     ░  ░     ░  ░ ░            ░   ░      ░ ░   ░  ";
echo "                                                                   ░                           ";
echo "                       ┌───────────────────────────────────────────────┐                       ";
echo "                       │        ROFI RETRO GAMING THEME EDITOR         │                       ";
echo "                       └───────────────────────────────────────────────┘                       ";
  echo "1) Select background"
  echo "2) Import background"
  echo "3) Change text style (color/font/size/bold/italic)"
  echo "4) Exit"
  echo
  read -rp "> " CHOICE
  case "$CHOICE" in
    1) select_background ;;
    2) import_background ;;
    3) text_menu ;;
    4) exit 0 ;;
*) echo "Invalid option." && pause ;;
  esac
done

#!/usr/bin/env bash
# ==============================
# RetroFi Box Art Refresh Script
# ==============================

REAL_USER="${SUDO_USER:-$USER}"
REAL_HOME="$(eval echo "~$REAL_USER")"

SOURCE_DIR="$REAL_HOME/Pictures/retro-games"
CACHE_DIR="$REAL_HOME/.cache/rofi-game-icons"

mkdir -p "$CACHE_DIR"

# ---------------- MENU ----------------
function show_menu() {
while true; do 
    clear
    echo "                                                                                                                              ";
echo "                                                                                                                              ";
echo "█████▄ ▄████▄ ██  ██ ▄████▄ █████▄  ██████   █████▄  ██████ ██████ █████▄  ██████ ▄█████ ██  ██   ██████ ▄████▄ ▄████▄ ██     ";
echo "██▄▄██ ██  ██  ████  ██▄▄██ ██▄▄██▄   ██     ██▄▄██▄ ██▄▄   ██▄▄   ██▄▄██▄ ██▄▄   ▀▀▀▄▄▄ ██████     ██   ██  ██ ██  ██ ██     ";
echo "██▄▄█▀ ▀████▀ ██  ██ ██  ██ ██   ██   ██     ██   ██ ██▄▄▄▄ ██     ██   ██ ██▄▄▄▄ █████▀ ██  ██     ██   ▀████▀ ▀████▀ ██████ ";
echo "                                                                                                                              ";
    echo
    echo "┌───────────────────────────────────────────────────────────┐ "
    echo "│ Source Folder : $SOURCE_DIR         │ "
    echo "│ Cache Folder  : $CACHE_DIR       │ "
    echo "└───────────────────────────────────────────────────────────┘ "
    echo
    echo "┌────────────────────┐ "
    echo "│1) Instructions     │ "
    echo "│2) Refresh Box Art  │ "
    echo "│3) Exit             │ "
    echo "└────────────────────┘ "
    echo
    read -rp "Choose an option: " CHOICE
    case "$CHOICE" in
        1) show_instructions ;;
        2) refresh_boxart ;;
        3) clear; break ;;
        *) echo "Invalid choice."; sleep 1; show_menu ;;
    esac
done

clear
echo "Exiting Boxart Refresher..."
sleep 0.2

# Relaunch Retro Games Menu
exec sudo -u "$REAL_USER" \
  HOME="$REAL_HOME" \
  USER="$REAL_USER" \
  LOGNAME="$REAL_USER" \
  nohup "$REAL_HOME/.local/bin/retro-games" >/dev/null 2>&1 & disown

exit 0
}

# ---------------- INSTRUCTIONS ----------------
function show_instructions() {
    clear
    echo "================ Instructions ================"
    echo
    echo "1. Place all your box art images in:"
    echo "   $SOURCE_DIR"
    echo
    echo "2. Each file must match the game's name exactly"
    echo "   (without the extension)."
    echo
    echo "3. Supported formats: png, jpg, jpeg, webp, avif"
    echo
    echo "4. The script will copy new or updated images"
    echo "   to the cache folder at:"
    echo "   $CACHE_DIR"
    echo
    echo "5. Existing images in the cache are never deleted."
    echo
    read -rp "Press Enter to return to the menu..." _
    show_menu
}

# ---------------- REFRESH BOX ART ----------------
function refresh_boxart() {
    clear
    echo "Refreshing box art..."
    echo

    mapfile -t IMAGES < <(find "$SOURCE_DIR" -maxdepth 1 -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" -o -iname "*.avif" \))

    if [[ "${#IMAGES[@]}" -eq 0 ]]; then
        echo "No images found in $SOURCE_DIR"
        sleep 1.2
        show_menu
        return
    fi

    echo "Found ${#IMAGES[@]} image(s)."
    echo

    for IMG in "${IMAGES[@]}"; do
        BASENAME="$(basename "$IMG")"
        cp -u "$IMG" "$CACHE_DIR/$BASENAME"  # Only copy if newer/missing
        echo "✓ $BASENAME"
    done

    echo
    echo "Box art refresh complete! ✅"
    echo "New/updated images are in $CACHE_DIR"
    sleep 1.2
    read -rp "Press Enter to return to the menu..." _
    show_menu
}

# ---------------- START ----------------
show_menu

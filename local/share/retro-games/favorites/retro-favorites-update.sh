#!/usr/bin/env bash
set -e
shopt -s nullglob

# ---------------- HARD ENV ----------------
REAL_USER="${SUDO_USER:-$USER}"
REAL_HOME="$(getent passwd "$REAL_USER" | cut -d: -f6)"
GAMES_ROOT="$REAL_HOME/Games"
FAV_DIR="$REAL_HOME/.local/share/retro-games/favorites"
mkdir -p "$FAV_DIR"

# ---------------- FAVORITE SYSTEMS ----------------
FAVORITE_SYSTEMS=("SUPER NINTENDO" "NES" "NINTENDO DS" "GAMEBOY ADVANCE" "GAMEBOY COLOR" "NINTENDO GAMEBOY" "PLAYSTATION 2" "NINTENDO GAMECUBE" "NINTENDO WII" "NINTENDO 3DS")

# ---------------- SYSTEMS ----------------
declare -A SYSTEMS=(
    ["SUPER NINTENDO"]="$GAMES_ROOT/SNES:sfc,smc"
    ["NES"]="$GAMES_ROOT/NES:nes"
    ["NINTENDO DS"]="$GAMES_ROOT/DS:nds"
    ["GAMEBOY ADVANCE"]="$GAMES_ROOT/GBA:gba"
    ["GAMEBOY COLOR"]="$GAMES_ROOT/GBC:gbc"
    ["NINTENDO GAMEBOY"]="$GAMES_ROOT/GB:gb"
    ["PLAYSTATION 2"]="$GAMES_ROOT/PS2:iso"
    ["GAMECUBE"]="$GAMES_ROOT/GAMECUBE:iso,rvz"
    ["WII"]="$GAMES_ROOT/WII:wbfs,iso,rvz"
    ["NINTENDO 3DS"]="$GAMES_ROOT/3DS:3ds,cxi,cfa"
)

# ---------------- MENU ----------------
function show_menu() {
    while true; do
    clear
    echo "                                                                                             ";
echo "                                                                                             ";
echo "██████ ▄████▄ ██  ██ ▄████▄ █████▄  ██ ██████ ██████ ▄█████   ██▄  ▄██ ██████ ███  ██ ██  ██ ";
echo "██▄▄   ██▄▄██ ██▄▄██ ██  ██ ██▄▄██▄ ██   ██   ██▄▄   ▀▀▀▄▄▄   ██ ▀▀ ██ ██▄▄   ██ ▀▄██ ██  ██ ";
echo "██     ██  ██  ▀██▀  ▀████▀ ██   ██ ██   ██   ██▄▄▄▄ █████▀   ██    ██ ██▄▄▄▄ ██   ██ ▀████▀ ";
echo "                                                                                             ";
echo "                       ┌───────────────────────────────────────────────┐                       ";
echo "                       │        RETRO-FI FAVORITES MENU EDITOR         │                       ";
echo "                       └───────────────────────────────────────────────┘                       ";


    echo "";
    echo "┌──────────────────────────────┐    ";
    echo "│ 1) List compatible consoles  │ "
    echo "│ 2) Add favorites             │ "
    echo "│ 3) Delete favorites          │ "
    echo "│ 4) Exit                      │ "
    echo "└──────────────────────────────┘ "
    echo
    read -rp "Choose an option: " CHOICE
    case "$CHOICE" in
        1) list_consoles ;;
        2) add_favorites ;;
        3) delete_favorites ;;
        4) break ;;
        *) echo "Invalid choice."; sleep 1 ; show_menu ;;
    esac
done

clear
echo "Exiting Favorites Updater..."
sleep 0.2

# Relaunch Retro Games Menu
exec sudo -u "$REAL_USER" \
  HOME="$REAL_HOME" \
  USER="$REAL_USER" \
  LOGNAME="$REAL_USER" \
  nohup "$REAL_HOME/.local/bin/retro-games" >/dev/null 2>&1 & disown

exit 0
}

# ---------------- LIST COMPATIBLE CONSOLES ----------------
function list_consoles() {
    echo
    echo "Compatible consoles for favorites:"
    for SYS in "${FAVORITE_SYSTEMS[@]}"; do
        echo "- $SYS"
    done
    echo
    read -rp "Press Enter to return to menu..." _
    show_menu
}

# ---------------- ADD FAVORITES ----------------
function add_favorites() {
    declare -a GAME_NAMES
    declare -a GAME_PATHS
    INDEX=1

    echo
    echo "Select a console to add favorites from:"
    for i in "${!FAVORITE_SYSTEMS[@]}"; do
        printf "%2d) %s\n" "$((i+1))" "${FAVORITE_SYSTEMS[$i]}"
    done
    read -rp "Choose console number: " SYS_CHOICE
    if [[ ! "$SYS_CHOICE" =~ ^[0-9]+$ ]] || [[ "$SYS_CHOICE" -lt 1 ]] || [[ "$SYS_CHOICE" -gt "${#FAVORITE_SYSTEMS[@]}" ]]; then
        echo "Invalid choice."
        sleep 1
        show_menu
    fi

    SELECTED_SYS="${FAVORITE_SYSTEMS[$((SYS_CHOICE-1))]}"
    IFS=":" read -r ROM_DIR EXTS <<< "${SYSTEMS[$SELECTED_SYS]}"
    [[ ! -d "$ROM_DIR" ]] && { echo "Directory does not exist: $ROM_DIR"; sleep 1; show_menu; }

    for ext in ${EXTS//,/ }; do
        for rom in "$ROM_DIR"/*.$ext; do
            [[ ! -f "$rom" ]] && continue
            GAME_NAMES+=("$(basename "$rom")")
            GAME_PATHS+=("$rom")
            printf "%4d) %s\n" "$INDEX" "$(basename "$rom")"
            ((INDEX++))
        done
    done

    [[ "${#GAME_NAMES[@]}" -eq 0 ]] && { echo "No games found for $SELECTED_SYS"; sleep 1; show_menu; }

    echo
    read -rp "Enter game numbers to favorite (comma-separated, q to quit): " INPUT
    [[ "$INPUT" == "q" ]] && show_menu
    IFS="," read -ra PICKS <<< "$INPUT"

    for pick in "${PICKS[@]}"; do
        pick="$(echo "$pick" | xargs)"
        [[ ! "$pick" =~ ^[0-9]+$ ]] && continue
        idx=$((pick - 1))
        [[ -z "${GAME_PATHS[$idx]:-}" ]] && continue
        src="${GAME_PATHS[$idx]}"
        name="${GAME_NAMES[$idx]}"
        ln -sfn "$src" "$FAV_DIR/$name"

        # ---------------- SYMLINK SAVE FILE ----------------
        SAV_EXTS=("sav" "srm" "state")
        for ext in "${SAV_EXTS[@]}"; do
            savefile="${src%.*}.$ext"
            [[ -f "$savefile" ]] && ln -sfn "$savefile" "$FAV_DIR/$(basename "$savefile")"
        done

        echo "✓ Added: $name"
    done

    echo
    read -rp "Favorites updated.
Press Enter to return to menu..." _
    show_menu
}

# ---------------- DELETE FAVORITES ----------------
function delete_favorites() {
    local files=("$FAV_DIR"/*)
    [[ "${#files[@]}" -eq 0 ]] && { echo "No favorites to delete."; sleep 1; show_menu; }

    echo
    echo "Favorites:"
    INDEX=1
    for f in "${files[@]}"; do
        [[ "$(basename "$f")" == "retro-favorites-update.sh" ]] && continue
        printf "%4d) %s\n" "$INDEX" "$(basename "$f")"
        ((INDEX++))
    done

    echo
    read -rp "Enter numbers to delete (comma-separated), or 'a' to wipe all, q to quit: " DEL
    [[ "$DEL" == "q" ]] && show_menu

    if [[ "$DEL" == "a" ]]; then
        for f in "${files[@]}"; do
            [[ "$(basename "$f")" == "retro-favorites-update.sh" ]] && continue
            rm -f "$f"
        done
        echo "All favorites deleted."
    else
        IFS="," read -ra PICKS <<< "$DEL"
        INDEX=1
        for f in "${files[@]}"; do
            [[ "$(basename "$f")" == "retro-favorites-update.sh" ]] && continue
            for pick in "${PICKS[@]}"; do
                pick="$(echo "$pick" | xargs)"
                [[ ! "$pick" =~ ^[0-9]+$ ]] && continue
                [[ "$pick" -eq "$INDEX" ]] && rm -f "$f"
            done
            ((INDEX++))
        done
        echo "Selected favorites deleted."
    fi
    sleep 1
    show_menu
}

# ---------------- START ----------------
show_menu

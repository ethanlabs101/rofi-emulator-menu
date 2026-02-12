# Retro-Fi 🎮 (Rofi + Retro Gaming Platform Launcher)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)

[![License: MIT](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-blue)](https://github.com/ethanlabs101/neowave-lua)
[![Stars](https://img.shields.io/github/stars/ethanlabs101/rofi-emulator-menu?style=social)](https://github.com/ethanlabs101/rofi-emulator-menu/stargazers)

---

## Retro-Fi is a lightweight, fully-featured retro gaming launcher for Linux.
## Manage your favorites, launch games across 30+ emulators, customize themes, and refresh box art - all from a sleek, native Linux, Rofi-powered interface.

---

![rofi-image](https://github.com/ethanlabs101/rofi-emulator-menu/blob/main/rofi-emulator-menu.png)

---
## Features 📋

✨ Easy plug-and-play setup  
Clone directly to ~ and start playing immediately — no complex installation needed.  

🎮 Compatible with 30+ retro consoles  
Check out the [CONSOLE LIST](https://github.com/ethanlabs101/Retro-Fi/blob/main/console-list.md) for the full supported list.  

⭐️ Favorites management  
Automatic ROM *and save file symlinks* for smooth game launching.  

🎨 Theme Editor  
Customize *backgrounds, and text*, fully integrated into Retro-Fi.  

🖼️ Box art refresh tool  
Refresh and manage your box art cache with ease.  

🖌️ Ships with high-quality console PNG Icons  
*All with transparent backgrounds* for a sleek UI.  

🗂️ Custom console → games folder structure  
Keeps your library organized and clean.  

🎨 Custom `.rasi` Rofi theme  
Designed for Retro-Fi, fully included.  

🖥️ 6x4 transparent grid layout  
Displays *box arts & game descriptions* in a visually appealing way.  

🔍 Per-system and per-game search method  
Quickly find and launch any title in your library.  

🎨 Custom theme isolated from global Rofi config  
Safe to tweak without affecting other Rofi setups.  

💻 Written entirely in pure Bash  
*Minimal dependencies, fully transparent, and modifiable*.

---
## Requirements & Dependencies ⚙️

To run Retro-Fi, your system should have the following installed:

### Core Dependencies
- Git - to clone this repository
- Bash – version 5.x recommended  
- Rofi – for the graphical menu interface  
- Flatpak – for certain emulators and runtime support
- Flathub - via flatpak to be able to install emulators
- RetroArch – for multi-system emulation support  

### Optional / System Emulators
- Various retro emulators are optional and depend on which consoles you want to use:  
  - Some are installed via your terminal package manager (apt, pacman, etc.).  
  - Others require Flatpak.  
  - Some use RetroArch cores (downloadable via terminal or [buildbot.libretro.com](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)).
  - Some systems (e.g., PS1, PS2, Sega CD, XBOX) require BIOS files for proper emulation.  

> ⚠️ Retro-Fi itself does not install emulators automatically. Make sure the emulators you intend to use are installed and accessible via your PATH or Flatpak.  
> Favorites, box art, and launch functionality require the corresponding emulator to be present for the selected system.

> Tested on Arch Linux (Other OSes should work)

---

# ⚠️ WARNING: This repository is designed to be cloned directly into your home directory (~). 
# All scripts, assets, and caches rely on this explicit structure. Cloning elsewhere may break Retro-Fi. 
# Please read the documentation before running any setup scripts.

---

# Installation ⚡

---

## 1. Install Git (If not already installed - if installed skip to step 2)

- Arch

```html
sudo pacman -S git
```
- Ubuntu/Debian

```html
sudo apt update && sudo apt install git
```
- Fedora

```html
sudo dnf install git
```

---

## 2. Clone this repository directly to your home directory

```html
git clone https://github.com/ethanlabs101/Retro-Fi.git ~
```

> ⚠️ Retro-Fi expects the directory structure to match ~/Games/Console for full functionality.

---

## 3. Install system dependencies

- Arch

```html
sudo pacman -S rofi flatpak retroarch
```

- Ubuntu/Debian

```html
sudo apt install rofi flatpak retroarch
```

- Fedora

```html
sudo dnf install rofi flatpak retroarch
```

- Install flathub via flatpak

```html
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

---

## 4. Add Rofi theme + backgrounds & system icons (Requires sudo)

- Create the directory for the backgrounds/system icons if it doesnt exist

```html
sudo mkdir -p /usr/share/rofi/themes/
```

- Move the main current background

```html
sudo cp ~/retro-fi.png /usr/share/rofi/themes/
```

- Copy all extra backgrounds & system icons

```html
sudo cp -r ~/retro-fi-backgrounds /usr/share/rofi/themes
```

- Make directory for rofi theme file

```html
mkdir ~/.config/rofi/game-theme
```

- Copy Rofi theme file 

```html
cp ~/retro-fi.rasi ~/.config/rofi/game-theme
```

---

## 5. Make scripts executable

```html
chmod +x ~/.local/bin/retro-games
chmod +x ~/.local/bin/run-theme-editor.sh
chmod +x ~/.local/bin/rofi-theme-manager.sh
chmod +x ~/.local/bin/run-favorites-update.sh
chmod +x ~/.local/share/retro-games/favorites/retro-favorites-update.sh
chmod +x ~/.local/bin/retrofi-boxart-refresh.sh
```

---

## 6. Verify ~/.local/bin is in your PATH

Run:

```html
echo $PATH | grep -q "$HOME/.local/bin" && echo "PATH is OK" || echo "PATH missing ~/.local/bin"
```

If you see ~/.local/bin skip to step 7 if not, continue step 6a.

- 6a. Add the following snippet to your shell to fix PATH

If your shell is Bash use:

```html
nano ~/.bashrc
```
Then paste this at the end of the file

```html
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```
If your shell is Zsh use:

```html
nano ~/.zshrc
```
Then paste this at the end of the file

```html
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```
---

## 7. Install Emulators 🕹️

Retro-Fi does not automatically install emulators or cores.
Some systems use:
- Native package manager installs (pacman / dnf /apt)
- Flatpak (via Flathub)
- RetroArch cores (terminal or manual buildbot install)
- ➡️ See the full setup guide here: [Emulator Setup Guide]()

---

## 8. Add your ROMs & Box Art

- 8a. ROMs

   - This launcher expects games to be stored in the ~/Games directory with a correctly named sub-folder for each system. 
   - Use the provided Game and console sub folders and add your roms to the correct folder.
   - Example: ~/Games/DS holds all the .nds Nintendo DS ROMs

- 8b. Box art

Box art images go in:

`~/Pictures/retro-games`

Then run the boxart uploader script:

```html
./retrofi-boxart-refresh.sh
```

Alternatively, you can launch the script inside the Rofi menu by selecting the Upload Boxart option.

- The supported formats are .avif, .png, .jpeg, and .jpg
- Boxart names much match the game name exactly minus extension.
- (ex. MarioKartDS.nds MarioKartDS.png)

---

## 9. First Launch and Testing

Once all steps have been followed thoroughly run the command:

```html
retro-games
```

- The retro games menu should appear with the custom theme.
- Custom console icons should display.
- Navigate with arrow keys or search for a console , select console, then search for a game.
- The selected game will display a dark grey background behind the selected entry.
- Selecting a game should launch it with the correct emulator.
- Select Theme editor to edit theme and text.
- Launch a game then close and select Recently Played to return to your game.
- Select Update favorites to edit your favorites list.
- Select Favorites List to view and launch your current favorite games.
- Select Upload Boxart to upload your boxart to the cache.
 
---

## Troubleshooting

- Menu appears empty: Check that your ~/Games directory exists and contains correct folders and ROMs
- Icons missing: make sure box art images are in ~/.cache/rofi-game-icons and named exactly like ROM file (Minus game extension)
- Emulator not launching: verify the emulators are installed with the command: which emulator (example: which fceux)

> Once confirmed , consider adding a keybind to your WM or DE to launch the menu instantly, or type retro-games in terminal for easy access.

---

## File Structure & Locations 📂

RetroFi uses a specific directory layout.

### Core Scripts
~/.local/bin/retro-games  
~/.local/share/retro-games/favorites/retro-favorites-update.sh  
~/.local/bin/rofi-theme-manager.sh  
~/.local/bin/retrofi-boxart-refresh.sh

### Console ROM Structure
~/Games/<console>/

### Favorites List (Populated by retro-favorites-update.sh)
~/.local/share/retro-games/favorites/

### Boxart Source
~/Pictures/retro-games/

### Boxart Cache
~/.cache/rofi-game-icons/

### Rofi Theme
~/.config/rofi/game-theme/retro-fi.rasi

### Backgrounds & System Icons
/usr/share/rofi/themes/retro-fi-backgrounds/

---

## Favorites & Recently Played 📌

Favorites and Recently Played are supported for most disc-based and cartridge systems.

However, behavior may vary depending on:

- Emulator used
- Core configuration
- Save file location
- Flatpak vs native install

Some systems have limitations.

➡️ Full compatibility breakdown:  
[View Favorites Compatibility →](./docs/FAVORITES_COMPATIBILITY.md)

➡️ Recently Played behavior details:  
[View Recently Played Info →](./docs/RECENTLY_PLAYED.md)

---

## Modifications & Customization 🎨

RetroFi ships modular. Each component can be customized independently.

### 🖌 [Theme Editor](./docs/THEME_EDITOR.md)
Interactive helper script that allows:
- Background switching
- Text color adjustments
- Custom Fonts
- Italics / Bold text modifier

Does not modify your global Rofi configuration.

---

### 🌌 [Backgrounds](./docs/BACKGROUNDS.md)
RetroFi includes:
- High-quality stock backgrounds
- Translucent console PNG system icons
- Support for user-added backgrounds

Background assets are located in:
/usr/share/rofi/themes/backgrounds/

You can add your own PNG files and select them using the Theme Editor.

---

### ⭐️ [Favorites Updater](./docs/FAVORITES.md)
Manages:
- Favorites list generation
- ROM symlink creation
- Save file linking (where supported)

Keeps your favorites structured without duplicating ROM data.

---

### 🖼 [Boxart Uploader](./docs/BOXART.md)
Refresh tool that:
- Pulls images from ~/Pictures/retro-games
- Updates RetroFi cache
- Cleans invalid entries
- Preserves naming structure

Supports:
.png, .jpg, .jpeg, .webp, .avif

---

## Platform Scope 🚫

RetroFi intentionally supports systems up to:

- PlayStation 2
- GameCube / Wii
- PSP
- Original Xbox
- Nintendo 3DS

### ❌ Not Supported (and will not be added)

- PlayStation 3
- Xbox 360
- Nintendo Switch
- Modern-generation consoles

This project focuses on lightweight, efficient retro and early 3D systems.

High-end emulation platforms are outside the scope of RetroFi by design.

---

## Legal Notice ⚖️

RetroFi does not provide:

- BIOS files
- ROM downloads
- Direct download links
- Piracy guidance

Users are responsible for legally obtaining their own:

- Game ROMs
- Required BIOS files
- Disc images

This project is a launcher and management interface only.

---

## 📜 License

This project is open source and released under the MIT License. See [LICENSE](https://github.com/ethanlabs101/rofi-emulator-menu/blob/main/LICENSE) for details.

---

## 🌐 Contact

[![GitHub](https://img.shields.io/badge/GitHub-ethanlabs101-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ethanlabs101)
[![Email](https://img.shields.io/badge/Email-ProtonMail-blue?style=for-the-badge&logo=protonmail&logoColor=white)](mailto:ethanlabs101@proton.me)
[![Discord](https://img.shields.io/badge/Discord-Chat-7289DA?style=for-the-badge&logo=discord&logoColor=white)](https://discord.com/users/1460827490762363001)
[![Instagram](https://img.shields.io/badge/Instagram-ethanlabs101-E4405F?style=for-the-badge&logo=instagram&logoColor=white)](https://www.instagram.com/ethanlabs101/)

---

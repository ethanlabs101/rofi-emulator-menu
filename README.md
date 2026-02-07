# Rofi Emulator Menu 🎮
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)

[![License: MIT](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-blue)](https://github.com/ethanlabs101/neowave-lua)
[![Stars](https://img.shields.io/github/stars/ethanlabs101/rofi-emulator-menu?style=social)](https://github.com/ethanlabs101/rofi-emulator-menu/stargazers)

---

A lightweight, keyboard-driven retro game launcher built with Rofi. Designed for Linux power users who want a fast, offline, low-bloat retro gaming menu.
---

![rofi-image](https://github.com/ethanlabs101/rofi-emulator-menu/blob/main/rofi-emulator-menu.png)

---
## Features 📋

- A clean lightweight Rofi-based retro game launcher
- Custom .rasi Rofi theme
- 6x4 transparent grid layout with box arts & description
- Per-system and per-game search method
- Custom theme isolated from global Rofi config
- Currently Supports (GBA, GBC, GB, DS, SNES, NES, and SEGA GENESIS)
---
## Requirements / Dependencies 🔧
- Rofi
- Bash
- Flatpak (for mGBA to run GBA, GBC, GB)
- RetroArch (for Sega Genesis, requires genesis core)
- fceux (for NES)
- snes9x (for SNES)
- desmume (for DS)

> Tested on Arch Linux (Other OSes should work)
---
## Installation

1. Download Rofi (Skip to step 2 if downloaded)

Arch

```html
sudo pacman -S rofi
```

Debian/Ubuntu

```html
sudo apt install rofi
```

Fedora 

```html
sudo dnf install rofi
```

> Note: If your rofi build does not support icons box art will not show, please download the most recent version for best user experience.

---

2. Install the launcher script

2a. Make ~/.local/bin directory for script (if exists skip to step 2b.)

```html
mkdir -p ~/.local/bin
```
2b. Download retro-games script from this repo 

2c. Copy retro-games and move it to ~/.local/bin directory
   
```html
cp retro-games ~/.local/bin
```
2d. Make retro-games script executable
   
```html
chmod +x ~/.local/bin/retro-games
```

---

3. Verify ~/.local/bin is in your PATH

Run:

```html
echo $PATH
```

If you see ~/.local/bin skip to step 4 if not, continue step 3.

3a. Add the following snippet to your shell to fix PATH

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

4. Install Flathub (If already installed skip to step 5)

This retro gaming rofi launcher currently utilizes flatpak for mGBA so it can run GBA, GBC and GB. If you dont want to use any of these systems feel free to skip ahead and if not please follow along. Also, emulators are configurable see the [Modifications] Page on how to add or change emulators to your configs. 

Arch

```html
sudo pacman -S flatpak
```

Debian / Ubuntu

```html
sudo apt install flatpak
```

Fedora

```html
sudo dnf install flatpak
```

Now install flathub

```html
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```
---

5. Install Emulators

This rofi emulator menu supports multiple emulators. They must be installed in the specified ways to work properly.

- Arch

```html
sudo pacman -S snes9x fceux desmume retroarch
```

```html
sudo pacman -S retroarch libretro-genesis-plus-gx
```

```html
flatpak install flathub io.mgba.mGBA
```

- Debian / Ubuntu

```html
sudo apt install snes9x fceux desmume retroarch
```

```html
sudo apt install libretro-genesis
```

```html
flatpak install flathub io.mgba.mGBA
```

- Fedora

```html
sudo dnf install snes9x fceux desmume retroarch
```

```html
sudo dnf install libretro-genesis-plus-gx
```

```html
flatpak install flathub io.mgba.mGBA
```

---

6. Organize Game ROMs

This launcher expects games to be stored in the ~/Games directory with a correctly named folder for each system. 
Create the folders like this:

```html
mkdir -p ~/Games
```

```html
mkdir -p ~/Games/{DS,GBA,GBC,GB,GENESIS,NES,SNES}
```
- DS -> Nintendo DS ROMs (.nds)
- GBA -> Game Boy Advance ROMs (.gba)
- GBC -> Game Boy Color ROMs (.gbc)
- GB -> Game Boy ROMs (.gb)
- GENESIS -> Sega Genesis ROMs (.bin/.gen)
- NES -> Nintendo Entertainment System ROMs (.nes)
- SNES -> Super Nintendo ROMs (.smc/.sfc)

Once the folders exist, place the correct ROMs in each folder. The script will automatically detect the games in these directories.


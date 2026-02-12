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

## Installation ⚡

---

# ⚠️ WARNING: This repository is designed to be cloned directly into your home directory (~). 
# All scripts, assets, and caches rely on this explicit structure. Cloning elsewhere may break Retro-Fi. 
# Please read the documentation before running any setup scripts.

---

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
2b. Download retro-games script from this repo and rename it to retro-games without .txt or .sh extension

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

This retro gaming rofi launcher currently utilizes flatpak for mGBA so it can run GBA, GBC and GB. If you dont want to use any of these systems feel free to skip ahead and if not please follow along. Also, emulators are configurable see the [modifications](https://github.com/ethanlabs101/rofi-emulator-menu?tab=readme-ov-file#modification--customization) section at the end of this ReadME on how to add or change emulators to your configs. 

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
sudo pacman -S libretro-genesis-plus-gx
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

---

7. Install the Rofi Theme

This retro games launcher uses a custom Rofi theme stored seperately so your global Rofi config remains untouched.

7a. Create the theme directory

```html
mkdir -p ~/.config/rofi/game-theme
```
7b. Download the theme file from this repo (ethanlabs101.rasi)

7c. Copy the theme file to correct directory for script

```html
cp ethanlabs101.rasi ~/.config/rofi/game-theme/
```
7d. Download the theme background image from this repo (ethanlabs101.png)

7e. Copy the background image to correct directory

```html
sudo cp ethanlabs101.png /usr/share/rofi/themes/
```
---

8. Box Arts

Each game can have a custom box art icon. The supported formats are .avif, .png, .jpeg, and .jpg

8a. Download desired box art images and rename them so they match name of the game (ex: MarioKart.nds MarioKart.png)

8b. Create the icon cache directory

```html
mkdir -p ~/.cache/rofi-game-icons
```
8c. Add your box art images to this directory (Make sure to follow step 8a!)

> The launcher will automatically detect icons in this folder when displaying the menu.

---

9. First Launch and Testing

Once all steps have been followed thoroughly run the command: retro-games

- The retro games menu should appear with the custom theme.
- Navigate with arrow keys or search for a game.
- The selected game will display a dark grey background behind the selected entry.
- Selecting a game should launch it with the correct emulator.

---

Troubleshooting

- Menu appears empty: Check that your ~/Games directory exists and contains correct folders and ROMs
- Icons missing: make sure box are images are in ~/.cache/rofi-game-icons and named exactly like ROM file (Minus game extension)
- Emulator not launching: verify the emulators are install with the command: which emulator (example: which fceux)

> Once confirmed , consider adding a keybind to your WM or DE to launch the menu instantly, or type retro-games in terminal for easy access.

---

## Modification & Customization

Change the background
1. download new desired background image and rename it to ethanlabs101.png
2. next, delete old ethanlabs.png image use:

```html
sudo rm -f /usr/share/rofi/themes/ethanlabs101.png
```
3. now copy new image to directory

```html
sudo cp -r ethanlabs101.png /usr/share/rofi/themes/
```
> Background Customization Complete!

---

Add new emulators

1. Install new emulator
2. Open launcher script

```html
nano ~/.local/bin/retro-games
```

3. Add a new entry to the SYSTEMS array with:
- System name
- ROM/Game path
- Emulator name
- Supported file extensions

Example:
- Current: ["NES"]="$HOME/Games/NES:fceux:nes"
- New: ["3DS"]="$HOME/Games/3DS:citra:3ds"

4. Save and exit

---

Change text color
1. Open ethanlabs101.rasi theme file
2. Edit line 12 where it says text-color: #00FEFC;
3. Replace with color names (example: red) or hex color codes (example: #ff0000)
4. Save and Exit

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

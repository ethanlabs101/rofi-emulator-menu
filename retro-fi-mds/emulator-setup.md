# 🕹️ Emulators / Cores Setup Guide

Welcome to the RetroFi Emulator Setup Guide!  
This guide will walk you through installing and configuring all supported consoles for RetroFi.  
Follow the instructions carefully to get the cores, BIOS, and emulators set up properly.

---

## Table of Contents

- [SNES](#snes)  
- [NES](#nes)  
- [Nintendo DS](#nintendo-ds)  
- [GBA](#gba)  
- [GBC](#gbc)  
- [GB](#gb)  
- [Sega Genesis](#sega-genesis)  
- [Sega Master System](#sega-master-system)  
- [Sega GameGear](#sega-gamegear)  
- [Sega SG-1000](#sega-sg-1000)  
- [Sega-CD](#sega-cd)  
- [Sega 32X](#sega-32x)  
- [Sega Saturn](#sega-saturn)  
- [Sega Dreamcast](#sega-dreamcast)  
- [PlayStation 1](#playstation-1)  
- [Nintendo 64](#nintendo-64)  
- [Mattel Intellivision](#mattel-intellivision)  
- [Colecovision](#colecovision)  
- [SNK Neo Geo Pocket](#snk-neo-geo-pocket)  
- [SNK Neo Geo](#snk-neo-geo)  
- [Pokemon Mini](#pokemon-mini)  
- [Bandai Wonderswan](#bandai-wonderswan)  
- [TurboGrafx-16](#turbografx-16)  
- [CD-i](#cd-i)  
- [Amstrad CPC](#amstrad-cpc)  
- [SNK Neo Geo MVS](#snk-neo-geo-mvs)  
- [Atari 2600](#atari-2600)  
- [Atari 5200](#atari-5200)  
- [Atari 7800](#atari-7800)  
- [Atari Lynx](#atari-lynx)  
- [Atari Jaguar](#atari-jaguar)  
- [Atari Jaguar-CD](#atari-jaguar-cd)  
- [Nintendo Virtual Boy](#nintendo-virtual-boy)  
- [Commodore 64](#commodore-64)  
- [PlayStation 2](#playstation-2)  
- [Xbox](#xbox)  
- [PSP](#psp)  
- [GameCube](#gamecube)  
- [Nintendo Wii](#nintendo-wii)  
- [Nintendo 3DS](#nintendo-3ds)  

---

## How to Use This Guide

1. Each console section below provides instructions for installing cores, BIOS requirements, and any quirks.  
2. Some cores are available via Libretro Buildbot, some through RetroArch, and some require Flatpak or manual compilation.  
3. Multi-disc games are not supported in RetroFi — play them directly in your emulator.  
4. No ROM or BIOS files are provided; you must supply your own.  

---

## SNES
- Emulator - Snes9x
- BIOS - NO
- Favorites Supported? - YES
- Notes: Installed locally via package manager
- ROM Extensions: sfc, smc, zip

Arch Installation
 
```html
sudo pacman -S snes9x
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## NES
- Emulator - fceux
- BIOS - NO
- Favorites Supported? - YES
- Notes: Installed locally via package manager
- ROM Extensions: nes, zip

Arch Installation
 
```html
sudo pacman -S fceux
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## Nintendo DS
- Emulator - desmume
- BIOS - NO
- Favorites Supported? - YES
- Notes: Installed locally via package manager
- ROM Extensions: nds, zip

Arch Installation
 
```html
sudo pacman -S desmume
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## GBA
- Emulator - mGBA
- BIOS - NO
- Favorites Supported? - YES
- Notes: Installed via Flatpak/Flathub
- ROM Extensions: gba, zip

Arch Installation
 
```html
flatpak install flathub io.mgba.mGBA
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## GBC
- Emulator - mGBA
- BIOS - NO
- Favorites Supported? - YES
- Notes: Installed via Flatpak/Flathub
- ROM Extensions: gbc, zip

Arch Installation
 
```html
flatpak install flathub io.mgba.mGBA
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## GB
- Emulator - mGBA
- BIOS - NO
- Favorites Supported? - YES
- Notes: Installed via Flatpak/Flathub
- ROM Extensions: gb, zip

Arch Installation
 
```html
flatpak install flathub io.mgba.mGBA
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## Sega Genesis
- Emulator - RetroArch
- Core - genesis_plus_gx_libretro.so
- BIOS - Optional
- Favorites Supported? - NO
- Notes: Installed locally via package manager
- ROM Extensions: gen, bin, md, zip

Arch Installation
 
```html
sudo pacman -S libretro-genesis-plus-gx
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## Sega Master System
- Emulator - RetroArch
- Core - genesis_plus_gx_libretro.so
- BIOS - Optional
- Favorites Supported? - NO
- Notes: Installed locally via package manager
- ROM Extensions: sms, zip

Arch Installation
 
```html
sudo pacman -S libretro-genesis-plus-gx
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## Sega GameGear
- Emulator - RetroArch
- Core - genesis_plus_gx_libretro.so
- BIOS - NO
- Favorites Supported? - NO
- Notes: Installed locally via package manager
- ROM Extensions: gg, zip

Arch Installation
 
```html
sudo pacman -S libretro-genesis-plus-gx
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## Sega SG-1000
- Emulator - RetroArch
- Core - genesis_plus_gx_libretro.so
- BIOS - NO
- Favorites Supported? - NO
- Notes: Installed locally via package manager
- ROM Extensions: sg, zip

Arch Installation
 
```html
sudo pacman -S libretro-genesis-plus-gx
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## Sega-CD
- Emulator - RetroArch
- Core - picodrive_libretro.so
- BIOS - YES
- Favorites Supported? - NO
- Notes: Installed locally via package manager
- ROM Extensions: cue, iso, zip

Arch Installation
 
```html
sudo pacman -S libretro-picodrive
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## Sega 32X
- Emulator - RetroArch
- Core - picodrive_libretro.so
- BIOS - NO
- Favorites Supported? - NO
- Notes: Installed locally via package manager
- ROM Extensions: 32x, bin, zip

Arch Installation
 
```html
sudo pacman -S libretro-picodrive
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## Sega Saturn
- Emulator - RetroArch
- Core - yabause_libretro.so
- BIOS - YES
- Favorites Supported? - NO
- Notes: Installed locally via package manager
- ROM Extensions: cue, iso, zip

Arch Installation
 
```html
sudo pacman -S libretro-yabause
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## Sega Dreamcast
- Emulator - RetroArch
- Core - flycast_libretro.so
- BIOS - Optional
- Favorites Supported? - NO
- Notes: Installed locally via package manager
- ROM Extensions: cue, iso, zip

Arch Installation
 
```html
sudo pacman -S libretro-flycast
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## PlayStation 1
- Emulator - RetroArch
- Core - mednafen_psx_libretro.so
- BIOS - YES
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: cue, iso, zip

Installation

 1. Click the build bot link and find the core named "mednafen_psx_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## Nintendo 64
- Emulator - RetroArch
- Core - parallel_n64_libretro.so
- BIOS - NO
- Favorites Supported? - NO
- Notes: Installed locally via package manager
- ROM Extensions: n64, v64, z64 zip

Arch Installation
 
```html
sudo pacman -S libretro-parallel-n64
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## Mattel Intellivision
- Emulator - RetroArch
- Core - freeintv_libretro.so
- BIOS - YES
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: int, rom, bin, zip

Installation

 1. Click the build bot link and find the core named "freeintv_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## Colecovision
- Emulator - RetroArch
- Core - bluemsx_libretro.so
- BIOS - YES
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: col, rom, bin, zip

Installation

 1. Click the build bot link and find the core named "bluemsx_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## SNK Neo Geo Pocket
- Emulator - RetroArch
- Core - mednafen_ngp_libretro.so
- BIOS - NO
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: ngc, ngp, zip

Installation

 1. Click the build bot link and find the core named "mednafen_ngp_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## SNK Neo Geo
- Emulator - RetroArch
- Core - fbneo_libretro.so
- BIOS - YES
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: chd, zip

Installation

 1. Click the build bot link and find the core named "fbneo_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## Pokemon Mini
- Emulator - RetroArch
- Core - pokemini_libretro.so
- BIOS - Optional
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: pmm, min, zip

Installation

 1. Click the build bot link and find the core named "pokemini_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## Bandai Wonderswan
- Emulator - RetroArch
- Core - mednafen_wswan_libretro.so
- BIOS - Optional
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: ws, wsc, zip

Installation

 1. Click the build bot link and find the core named "mednafen_wswan_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## TurboGrafx-16
- Emulator - RetroArch
- Core - mednafen_pce_libretro.so
- BIOS - YES
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: pce, vpc, cue, zip

Installation

 1. Click the build bot link and find the core named "mednafen_pce_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## CD-i
- Experimental: May not function properly
- Emulator - RetroArch
- Core - same_cdi_libretro.so
- BIOS - YES/Firmware
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: cue, zip

Installation

 1. Click the build bot link and find the core named "same_cdi_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## Amstrad CPC
- Emulator - RetroArch
- Core - cap32_libretro.so
- BIOS - Optional
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: dsk, cdt, zip

Installation

 1. Click the build bot link and find the core named "cap32_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## SNK Neo Geo MVS
- Emulator - RetroArch
- Core - fbneo_libretro.so
- BIOS - YES
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: zip

Installation

 1. Click the build bot link and find the core named "fbneo_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## Atari 2600
- Emulator - RetroArch
- Core - stella_libretro.so
- BIOS - NO
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: a26, zip

Installation

 1. Click the build bot link and find the core named "stella_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## Atari 5200
- Emulator - RetroArch
- Core - a5200_libretro.so
- BIOS - YES
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: a52, zip

Installation

 1. Click the build bot link and find the core named "a5200_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## Atari 7800
- Emulator - RetroArch
- Core - prosystem_libretro.so
- BIOS - Optional
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: bin, rom, zip

Installation

 1. Click the build bot link and find the core named "prosystem_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## Atari Lynx
- Emulator - RetroArch
- Core - handy_libretro.so
- BIOS - YES
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: lyx, zip

Installation

 1. Click the build bot link and find the core named "handy_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## Atari Jaguar
- Emulator - RetroArch
- Core - virtualjaguar_libretro.so
- BIOS - Optional
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: j64, zip

Installation

 1. Click the build bot link and find the core named "virtualjaguar_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## Atari Jaguar-CD
- Experimental - Currently not functioning properly
- Emulator - RetroArch
- Core - virtualjaguar_libretro.so
- BIOS - YES
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: cue, zip

Installation

 1. Click the build bot link and find the core named "virtualjaguar_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## Nintendo Virtual Boy
- Emulator - RetroArch
- Core - mednafen_vb_libretro.so
- BIOS - NO
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: vb, zip

Installation

 1. Click the build bot link and find the core named "mednafen_vb_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## Commodore 64
- Emulator - RetroArch
- Core - vice_x64_libretro.so
- BIOS - NO
- Favorites Supported? - NO
- Notes: Installed via [buildbot](https://buildbot.libretro.com/nightly/linux/x86_64/latest/)
- ROM Extensions: d64, tap, prg, zip

Installation

 1. Click the build bot link and find the core named "vice_x64_libretro.so"
 2. Download and extract the file 
 3. Move extracted .so file to /usr/lib/libretro/
 4. Done Retro-Fi will handle the rest.

---

## PlayStation 2
- Emulator - pcsx2
- BIOS - YES
- Favorites Supported? - YES
- Notes: Installed via Flatpak/Flathub
- ROM Extensions: iso, zip

Arch Installation
 
```html
flatpak install flathub net.pcsx2.PCSX2
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## Xbox
- Emulator - xemu
- BIOS - YES
- Favorites Supported? - NO
- Notes: Installed via Flatpak/Flathub
- Extra Notes: XBOX Requires additional files See [Xemu](https://xemu.app/docs/required-files/) for more.
- ROM Extensions: none (XBOX CAN ONLY LAUNCH EMULATOR NOT INDIVIDUAL GAMES DUE TO XEMU/XBOX ARCHITECTURE)

Arch Installation
 
```html
flatpak install flathub app.xemu.xemu
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## PSP
- Emulator - ppsspp
- BIOS - Optional
- Favorites Supported? - NO
- Notes: Installed via Flatpak/Flathub
- ROM Extensions: iso, cso, pbp, zip

Arch Installation
 
```html
flatpak install flathub org.ppsspp.PPSSPP
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## GameCube
- Emulator - dolphin
- BIOS - Optional
- Favorites Supported? - YES
- Notes: Installed locally via package manager
- ROM Extensions: iso, ciso, nkit.iso, rvz, zip

Arch Installation
 
```html
sudo pacman -S dolphin-emu
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## Nintendo Wii
- Emulator - dolphin
- BIOS - Optional
- Favorites Supported? - YES
- Notes: Installed locally via package manager
- ROM Extensions: iso, wbfs, rvz, zip

Arch Installation
 
```html
sudo pacman -S dolphin-emu
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## Nintendo 3DS
- Emulator - citra
- BIOS - NO
- Favorites Supported? - YES
- Notes: Installed via flatpak/flathub
- ROM Extensions: 3ds, cia, cci, zip

Arch Installation
 
```html
flatpak install flathub org.citra_emu.citra
```
> Note: Commands are tested on Arch Linux. If you are on another distribution, please use your package manager.

---

## 🔗 Links  
- [Main README](https://github.com/ethanlabs101/Retro-Fi/tree/main) – go back to the main page.  
- [Emulator Setup](https://github.com/ethanlabs101/Retro-Fi/blob/main/retro-fi-mds/emulator-setup.md) – detailed instructions for each system, cores, and emulator installation.

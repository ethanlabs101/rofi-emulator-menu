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
- BIOS - NO
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
- BIOS - NO
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
<!-- Fill in installation instructions here -->

## Sega 32X
<!-- Fill in installation instructions here -->

## Sega Saturn
<!-- Fill in installation instructions here -->

## Sega Dreamcast
<!-- Fill in installation instructions here -->

## PlayStation 1
<!-- Fill in installation instructions here -->

## Nintendo 64
<!-- Fill in installation instructions here -->

## Mattel Intellivision
<!-- Fill in installation instructions here -->

## Colecovision
<!-- Fill in installation instructions here -->

## SNK Neo Geo Pocket
<!-- Fill in installation instructions here -->

## SNK Neo Geo
<!-- Fill in installation instructions here -->

## Pokemon Mini
<!-- Fill in installation instructions here -->

## Bandai Wonderswan
<!-- Fill in installation instructions here -->

## TurboGrafx-16
<!-- Fill in installation instructions here -->

## CD-i
<!-- Fill in installation instructions here -->

## Amstrad CPC
<!-- Fill in installation instructions here -->

## SNK Neo Geo MVS
<!-- Fill in installation instructions here -->

## Atari 2600
<!-- Fill in installation instructions here -->

## Atari 5200
<!-- Fill in installation instructions here -->

## Atari 7800
<!-- Fill in installation instructions here -->

## Atari Lynx
<!-- Fill in installation instructions here -->

## Atari Jaguar
<!-- Fill in installation instructions here -->

## Atari Jaguar-CD
<!-- Fill in installation instructions here -->

## Nintendo Virtual Boy
<!-- Fill in installation instructions here -->

## Commodore 64
<!-- Fill in installation instructions here -->

## PlayStation 2
<!-- Fill in installation instructions here -->

## Xbox
<!-- Fill in installation instructions here -->

## PSP
<!-- Fill in installation instructions here -->

## GameCube
<!-- Fill in installation instructions here -->

## Nintendo Wii
<!-- Fill in installation instructions here -->

## Nintendo 3DS
<!-- Fill in installation instructions here -->

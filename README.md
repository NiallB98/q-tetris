# qTetris

## Requirements
* `bash`
* `q/kdb+` (Tested in version 4.0)
* The Linux command `tput` (If wanting to have the game's interface centered in the window)

## Introduction

A text-based Tetris game written in Kx System's (https://kx.com/) programming language Q

## How to Play
To start the game execute the `run.sh` script. The game's controls are all displayed in-game except for special commands listed in the [Commands](#commands) section

## Commands

### Global
* `menu` - Go to main menu
* `quit`/`exit` - Quit game
* `fps XX` - Set the game FPS to double-digit amount XX

### In-Game
- `p` - Pause game

## Extras
* The game's default FPS can be configured in `config.env`
* Setting too high an fps value will make the game hard to see due to limitations on how fast q/kdb+ can write to stdout

## Screenshots

### Menu
![Screenshot](resources/screenshots/menu.png)

### Pre-Game Config
![Screenshot](resources/screenshots/pre_game_config.png)

### Gameplay
![Screenshot](resources/screenshots/gameplay.png)
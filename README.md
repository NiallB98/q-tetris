# qTetris

## Table of Contents
- [qTetris](#qtetris)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Introduction](#introduction)
  - [How to Play](#how-to-play)
  - [Commands](#commands)
    - [Global](#global)
    - [In-Game](#in-game)
  - [Extra Tips](#extra-tips)
  - [Screenshots](#screenshots)
    - [Menu](#menu)
    - [Pre-Game Config](#pre-game-config)
    - [Gameplay](#gameplay)

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

## Extra Tips
* The game's default FPS can be configured in `config.env`
* Setting too high an FPS value will make the game hard to see due to limitations on how fast q/kdb+ can write to stdout

## Screenshots

### Menu
![Screenshot](resources/screenshots/menu.png)

### Pre-Game Config
![Screenshot](resources/screenshots/pre_game_config.png)

### Gameplay
![Screenshot](resources/screenshots/gameplay.png)

Keyboard
========

[![Build Status](https://travis-ci.org/creasty/Keyboard.svg?branch=master)](https://travis-ci.org/creasty/Keyboard)
[![GitHub release](https://img.shields.io/github/release/creasty/Keyboard.svg)](https://github.com/creasty/Keyboard/releases)
[![License](https://img.shields.io/github/license/creasty/Keyboard.svg)](./LICENSE)

Master of keyboard is master of automation.

Minimum Karabiner-esque feature implementation in Swift 3.  
It aims at porting my own custom settings in Karabiner and its [private.xml](https://github.com/creasty/dotfiles/blob/d8b54873c6de27f1244ea10c7e290d1f248ea8ff/app/karabiner/private.xml).


Installation
------------

```
$ brew cask install creasty/tools/keyboard
```


List of hacks
-------------

### Window/space navigations

`S` acts as "super key" that doesn't require any modifier keys.

<details>

<summary>Requirements</summary>

Open "System Preferences" and set the following shortcuts:

- Mission Control
  - "Move left a space" `Ctrl-LeftArrow`
  - "Move right a space" `Ctrl-RightArrow`
- Keyboard
  - "Move focus to next window" `Cmd-Backtick`

Don't mind to create new entry if missing.

| 1 | 2 |
|---|---|
| ![](https://cloud.githubusercontent.com/assets/1695538/26527997/3df11bf8-43db-11e7-975b-6f14aeb2e4a2.png) | ![](https://cloud.githubusercontent.com/assets/1695538/26527998/3e289ec0-43db-11e7-991b-a107a7f16231.png) |

</details>
<br>

| Key | Description |
|:---|:---|
| `S+H` | Move to left space |
| `S+L` | Move to right space |
| `S+J` | Switch to next application |
| `S+K` | Switch to previous application |
| `S+N` | Switch to next window |
| `S+B` | Switch to previous window |

### Emacs mode

| Key | Description | Shift allowed |
|:---|:---|:---|
| `Ctrl-C` | Escape | NO |
| `Ctrl-D` | Forward delete | NO |
| `Ctrl-H` | Backspace | NO |
| `Ctrl-J` | Enter | NO |
| `Ctrl-P` | ↑ | YES |
| `Ctrl-N` | ↓ | YES |
| `Ctrl-B` | ← | YES |
| `Ctrl-F` | → | YES |
| `Ctrl-A` | Beginning of line | YES |
| `Ctrl-E` | End of line | YES |

### Window resizing/positioning

| Key | Description |
|:---|:---|
| `Cmd-Alt-/` | Full |
| `Cmd-Alt-Left` | Left |
| `Cmd-Alt-Up` | Top |
| `Cmd-Alt-Right` | Right |
| `Cmd-Alt-Down` | Bottom |
| `Shift-Cmd-Alt-Left` | Top-left |
| `Shift-Cmd-Alt-Up` | Top-right |
| `Shift-Cmd-Alt-Right` | Bottom-right |
| `Shift-Cmd-Alt-Down` | Bottom-left |

### Fool-safe "Quit Application"

Press `Cmd-Q` twice to quit application.

| Key | Description |
|:---|:---|
| `Cmd-Q` | Noop |
| `Cmd-Q Cmd-Q` | Invokes `Cmd-Q`. Quit application |

### Switch input source with Escape key

For Vim, leave insert mode with EISUU in order to avoid IME from capturing key strokes.

| Key | Description |
|:---|:---|
| `Ctrl-C` | Invokes `EISUU, Escape` |
| `Escape` | Invokes `EISUU, Escape` |

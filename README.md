Keyboard
========

[![Build Status](https://travis-ci.org/creasty/Keyboard.svg?branch=master)](https://travis-ci.org/creasty/Keyboard)
[![GitHub release](https://img.shields.io/github/release/creasty/Keyboard.svg)](https://github.com/creasty/Keyboard/releases)
[![License](https://img.shields.io/github/license/creasty/Keyboard.svg)](./LICENSE)

Master of keyboard is master of automation.


Installation
------------

```
$ brew cask install creasty/tools/keyboard
```


List of actions
---------------

### Window/space navigation

| Key | Description |
|:---|:---|
| `S+H` | Move to left space |
| `S+L` | Move to right space |
| `S+J` | Switch to next application |
| `S+K` | Switch to previous application |
| `S+N` | Switch to next window |
| `S+B` | Switch to previous window |

*`S` acts as a 'super key' that doesn't require any modifier keys.*

<details><summary>Requirements</summary>

Open "System Preferences" and set the following shortcuts:

- Mission Control
  - "Move left a space" `Ctrl-LeftArrow`
  - "Move right a space" `Ctrl-RightArrow`
- Keyboard
  - "Move focus to next window" `Cmd-F1`

| 1 | 2 |
|---|---|
| ![](https://user-images.githubusercontent.com/1695538/50548207-12b02800-0c8c-11e9-8dd9-527d4aed2b69.png) | ![](https://user-images.githubusercontent.com/1695538/50548209-1643af00-0c8c-11e9-9bf8-1e86ca13f4fb.png) |

</details>

### Window resizing/positioning

| Key | Description |
|:---|:---|
| `S+D+F` | Full screen |
| `S+D+H` | Left half |
| `S+D+J` | Bottom half |
| `S+D+K` | Top half |
| `S+D+L` | Right half |

*`S` acts as a 'super key' that doesn't require any modifier keys.*

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

### Switch input source

| Key | Description |
|:---|:---|
| `Ctrl-;` | Selects next source in the input menu |

### Switch input source with Escape key

Change the input source to English as you leave 'insert mode' in Vim with `Escape` key so it can prevent IME from capturing key strokes in 'normal mode'.

| Key | Description |
|:---|:---|
| `Ctrl-C` | Invokes `EISUU, Escape` |
| `Escape` | Invokes `EISUU, Escape` |

### Switch between apps

| Key | App | Bundle ID | URL |
|:---|:---|:---|:---|
| `;+F` | Finder | `com.apple.finder` | N/A |
| `;+M` | iTerm 2 | `com.googlecode.iterm2` | https://www.iterm2.com |
| `;+T` | Things | `com.culturedcode.ThingsMac` | https://culturedcode.com/things |
| `;+B` | Bear | `net.shinyfrog.bear` | https://bear.app |

*`;` acts as a 'super key' that doesn't require any modifier keys.*

# Installation
I'm very forgetful so I tried my best to simply the installation process as much as possible. The `source` isn't ideal, but currently because of my hack-fix for the install script, it must be done. **Beware**, this has only been tested on ubuntu docker containers.  
> Please note that `git` and `curl` is required. 
```shell
curl -L https://raw.githubusercontent.com/TheGreatWaves/dotfiles/master/install.sh | bash && source ~/.bashrc
```


# Tmux Config

This configuration is used in conjunction with `Helix` and `WSL 2`.

## General
Panes and windows start from index `1`.

## Keybinds

> **Note**: The __**prefix**__ is binded to `Ctrl + Space`.

### General
`Alt + l` Clear screen. \
`Alt + Shift + c` Kill server. \
`Alt + Shift + i` Install plugins \
`<Prefix> r` Reload configuration. \
`<Prefix> e` Edit configuration. \
`<Prefix> X` Force kill pane. 

### Pane nagivation
`Ctrl + h` Move to the pane to the left.\
`Ctrl + j` Move to the pane below.\
`Ctrl + k` Move to the pane above.\
`Ctrl + l` Move to the pane to the right.

### Pane creation
`<Prefix> |` Split window horizontally. (Same directory) \
`<Prefix> -` Split window vertically. (Same directory)

### Window navigation
`Ctrl + LeftArrow` Previous window.\
`Ctrl + RightArrow` Next window

### Vi mode in terminal
`<Prefix> [` Activate vi mode in terminal. (You can navigate and yank text as normal)

# Helix Config
`Ctrl + s` Write to file. \
`Ctrl + w` Save jump selection. \
`Space, w, c` Open vscode. \
`Alt + t` Open tmux actions. \
`Alt + h` Tmux split screen with horizontal line. \
`Alt + v` Tmux split screen with vertical line. \
`V` Select current line and trim. \
`D` Select from the current position of the cursor until the end of the line. 

## Helix Notes:
`i` and `a` is configured to not enter select mode by default. \
`x`'s extend direction is based on the anchor which can be switched via `Alt-;`. \
`;` collapses selection and returns you to normal mode right away.




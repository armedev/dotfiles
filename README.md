# .dotfiles

This repo consists of all the configuration files needed to get going

the term .dotfiles is a folder in the $HOME directory.

> [!important]
> clone this repo in home directory and use symlinks to link the files to configs

```bash
ln -s target-folder symnlink-name
```

## nvim-custom

nvim custom has config files for the neovim with nvchad as a manager.

### steps:

- install nvchad
- in config folder cd into lua directory
- create a symnlink with `custom` as name to this folder

## tmux

tmux has config files and plugins for the tmux to work seamless
install tmux and symnlink this folder from the configs directory

### steps:

- install tmux
- create a symnlink with `tmux` name in config dir

## wezterm

wezterm is a terminal alternative built on rust. this folder contains configs for the wezterm
install wezterm and symnlink this folder in config directory

### steps:

- install wezterm
- create a symnlink with `wezterm` name in config dir

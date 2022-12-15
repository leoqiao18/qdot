# Leo's Dotfiles

This repo uses [stow][] to manage the symlinks, but you don't **have** to --
you can also just individually symlink the contents of each directory directly
into your home.

If you want to use stow, clone this repository into `~/qdot` and do `./qstow PACKAGE` for any package you would like to install.

## Requirements

- GNU Stow

### LunarVim

- neovim (>= 0.8.0)
- node, npm: install with `nvm`
- git, make
- pip, python
- cargo: install with `rustup`
- LunarVim

### Starship

- starship

### Kitty

- kitty

### tmux

- tmux

### ZSH

- zsh
- exa
- starship
- fzf: install by `git clone` and call install script

After installation, add the following lines:
- in `$HOME/.zshenv`, add

```zsh
#!/usr/bin/env zsh

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# load my zshenv
source $ZDOTDIR/zshenv
```

- in `$ZDOTDIR/.zshrc`, add

```zsh
source $ZDOTDIR/zshrc
```

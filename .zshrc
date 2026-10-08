# ~/.zshrc
# ---------------------------------------------------------------------------
# Sourced by INTERACTIVE shells only (after .zprofile for login shells).
# This is where interactive-only configuration lives: the prompt, plugins,
# aliases and key bindings.
#
#   PATH / environment  -> .zshenv + .zexports
#   per-login tool init -> .zprofile
# ---------------------------------------------------------------------------

# --- oh-my-zsh -------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

# Theme. Set ZSH_THEME="random" to load a random one each time (then run
# `echo $RANDOM_THEME` to see which was picked).
ZSH_THEME="robbyrussell"

# Plugins (built-in ones live in $ZSH/plugins, custom in $ZSH_CUSTOM/plugins).
# Every plugin adds startup time, so keep this list short.
plugins=(git)

source "$ZSH/oh-my-zsh.sh"

# --- User configuration ----------------------------------------------------
# Put aliases, functions and interactive options below this line.

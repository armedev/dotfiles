# ~/.zshenv
# ---------------------------------------------------------------------------
# Sourced by *every* zsh process: login shells, interactive shells, tmux panes
# and non-interactive scripts (`zsh -c ...`). Keep it small and side-effect
# free — it runs more often than any other startup file.
#
# zsh startup order:
#   .zshenv    -> always
#   .zprofile  -> login shells only
#   .zshrc     -> interactive shells only
#   .zlogin    -> login shells only (after .zshrc)
#
# PATH and exported environment live here (via .zexports) so commands are
# available everywhere, including inside tmux, subshells and scripts, and can
# never "go missing".
# ---------------------------------------------------------------------------

# `path` (array) mirrors $PATH (scalar). The -U (unique) attribute makes zsh
# drop duplicate entries automatically, so nested shells and tmux panes cannot
# stack the same directory onto PATH over and over.
# -U is needed on BOTH: shell code tends to assign the `path` array, while
# tools like Homebrew and nvm assign the scalar `PATH`.
typeset -U path
typeset -U PATH

# Prepend directories to PATH, skipping ones that do not exist. Duplicates are
# removed automatically thanks to `typeset -U path` above.
# Directories are kept in the order given, so the FIRST argument has the
# HIGHEST priority — callers read top-to-bottom as "wins first".
path_prepend() {
  local dir
  local -a dirs
  for dir in "$@"; do
    [[ -d "$dir" ]] && dirs+=("$dir")
  done
  path=("${dirs[@]}" $path)
}

# PATH and environment variables shared by every shell.
[[ -f "$HOME/.zexports" ]] && source "$HOME/.zexports"

# Machine-local overrides and secrets (never committed). Sourced here so
# EDITOR, API keys, etc. are available in every shell, scripts included.
[[ -s "$HOME/.zlocal" ]] && source "$HOME/.zlocal"

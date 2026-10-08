# ~/.zprofile
# ---------------------------------------------------------------------------
# Sourced by LOGIN shells only (after .zshenv).
# This is where per-login tool initialization belongs: commands that spawn
# processes, load completions, or should only run once per login.
#
# PATH is already set by .zshenv / .zexports before this file runs, so it is
# not repeated here.
# ---------------------------------------------------------------------------

# Homebrew (sets HOMEBREW_* and adds its bin/sbin dirs to PATH)
[[ -s "/opt/homebrew/bin/brew" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew prepends its own bin dirs above everything, which would let e.g.
# /opt/homebrew/bin/psql (postgresql@14) shadow the postgresql@16 installed by
# .zexports. Re-apply .zexports so user overrides keep priority over Homebrew.
[[ -f "$HOME/.zexports" ]] && source "$HOME/.zexports"

# nvm (Node Version Manager). $NVM_DIR is exported in .zexports.
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# Bun shell integration
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# Google Cloud SDK
[[ -f "$HOME/applications3party/google-cloud-sdk/path.zsh.inc" ]] && source "$HOME/applications3party/google-cloud-sdk/path.zsh.inc"
[[ -f "$HOME/applications3party/google-cloud-sdk/completion.zsh.inc" ]] && source "$HOME/applications3party/google-cloud-sdk/completion.zsh.inc"

# OrbStack
[[ -s "$HOME/.orbstack/shell/init.zsh" ]] && source "$HOME/.orbstack/shell/init.zsh"

# Dart CLI completion
[[ -f "$HOME/.dart-cli-completion/zsh-config.zsh" ]] && source "$HOME/.dart-cli-completion/zsh-config.zsh"

# Auto-start tmux and ssh-agent (login shells only)
[[ -s "$HOME/.zau" ]] && source "$HOME/.zau"

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH="$PATH:$HOME/applications3party/flutter/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/scripts"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/armedev/applications3party/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/armedev/applications3party/google-cloud-sdk/path.zsh.inc';
fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/armedev/applications3party/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/armedev/applications3party/google-cloud-sdk/completion.zsh.inc';
fi

if [ -z "$TMUX" ]; then tmux attach -t default || tmux new -s default
fi

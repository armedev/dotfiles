# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

source $HOME/.zcustom

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/armedev/applications3party/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/armedev/applications3party/google-cloud-sdk/path.zsh.inc';
fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/armedev/applications3party/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/armedev/applications3party/google-cloud-sdk/completion.zsh.inc';
fi


# Added by OrbStack: command-line tools and integration
[ -s "~/.orbstack/shell/init.zsh" ] && source ~/.orbstack/shell/init.zsh 2>/dev/null || :

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/monster/.dart-cli-completion/zsh-config.zsh ]] && . /Users/monster/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

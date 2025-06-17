[ -s "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)" || : # This loads brew
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env" || : # This loads cargo

[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm from brew
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion from brew
[ -s "/usr/share/nvm/nvm.sh" ] && \. "/usr/share/nvm/nvm.sh"  # This loads nvm from system
[ -s "/usr/share/nvm/bash_completion" ] && \. "/usr/share/nvm/bash_completion"  # This loads nvm bash_completion from system

[ -s "/Users/armedev/.bun/_bun" ] && source "/Users/armedev/.bun/_bun" # This loads bun

if [ -f '/Users/armedev/applications3party/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/armedev/applications3party/google-cloud-sdk/path.zsh.inc';
fi

if [ -f '/Users/armedev/applications3party/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/armedev/applications3party/google-cloud-sdk/completion.zsh.inc';
fi

[ -s "~/.orbstack/shell/init.zsh" ] && source ~/.orbstack/shell/init.zsh 2>/dev/null || : # This loads orbstack

[[ -f /Users/monster/.dart-cli-completion/zsh-config.zsh ]] && . /Users/monster/.dart-cli-completion/zsh-config.zsh || : # This loads dart

source $HOME/.zexports
source $HOME/.zau

[ -s "$HOME/.zlocal" ] && source $HOME/.zlocal || : # This loads .zlocal if any

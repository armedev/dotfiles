if [ -z "$TMUX" ]; then tmux new-session -A -s default
fi

if [ "$SSH_AUTH_SOCK" = "" -a -x /usr/bin/ssh-agent ]; then
  eval `/usr/bin/ssh-agent` > /dev/null || :
fi

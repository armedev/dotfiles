# start tmux only on pseudo terminals and avoid tty and interactive shells
if [[ -z "$TMUX" && "$-" == *i* ]]; then
    tty=$(tty)
    if [[ "$tty" == /dev/pts/* ]]; then
      tmux new-session -A -s default
    fi
fi

if [ "$SSH_AUTH_SOCK" = "" -a -x /usr/bin/ssh-agent ]; then
  eval `/usr/bin/ssh-agent` > /dev/null || :
fi

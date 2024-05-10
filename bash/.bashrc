[[ $- != *i* ]] && return

source ~/.bash_env
source ~/.bash_aliases

export HISTCONTROL=erasedups

set -o vi

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'


# check 3 conditions - tmux is present in system, we are in an interactive shell and we are not in tmux currently. Run tmux if all conditions are satisfied
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
fi

# Set up zoxide
eval "$(zoxide init bash)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
source ~/.keychain/$HOSTNAME-sh

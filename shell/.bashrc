[[ $- != *i* ]] && return

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#cad3f5,fg+:#d0d0d0,bg:#24273a,bg+:#262626
  --color=hl:#ed8796,hl+:#5fd7ff,info:#c6a0f6,marker:#f4dbd6
  --color=prompt:#c6a0f6,spinner:#f4dbd6,pointer:#f4dbd6,header:#ed8796
  --color=border:#b8aac8,label:#aeaeae,query:#d9d9d9
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer="◆" --separator="─" --scrollbar="│"
  --info="right"'

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

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
source ~/.keychain/$HOSTNAME-sh

# Set up zoxide
eval "$(zoxide init bash)"

# starship prompt
eval "$(starship init bash)"

# Created by `pipx` on 2024-07-05 09:32:43
export PATH="$PATH:/home/ak/.local/bin"
if [ -f "/home/ak/.config/fabric/fabric-bootstrap.inc" ]; then . "/home/ak/.config/fabric/fabric-bootstrap.inc"; fi
alias nnvim=/home/ak/nvim/usr/bin/nvim

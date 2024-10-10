eval "$(starship init zsh)"

source ~/.bash_aliases
source ~/.bash_env

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#cad3f5,fg+:#d0d0d0,bg:#24273a,bg+:#262626
  --color=hl:#ed8796,hl+:#5fd7ff,info:#c6a0f6,marker:#f4dbd6
  --color=prompt:#c6a0f6,spinner:#f4dbd6,pointer:#f4dbd6,header:#ed8796
  --color=border:#b8aac8,label:#aeaeae,query:#d9d9d9
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer="◆" --separator="─" --scrollbar="│"
  --info="right"'

plugins=(git zsh-autosuggestions fzf)

# Set up zoxide
eval "$(zoxide init zsh)"

source $ZSH/oh-my-zsh.sh

# check 3 conditions - tmux is present in system, we are in an interactive shell and we are not in tmux currently. Run tmux if all conditions are satisfied
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Created by `pipx` on 2024-08-24 12:45:00
export PATH="$PATH:/home/ak/.local/bin"

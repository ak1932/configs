#
# ~/.bash_profile
#
 
[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"

# catppuccin colors for fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

export PATH=$PATH:/home/ak/.spicetify

# Created by `pipx` on 2024-07-05 09:32:43
export PATH="$PATH:/home/ak/.local/bin"
if [ -f "/home/ak/.config/fabric/fabric-bootstrap.inc" ]; then . "/home/ak/.config/fabric/fabric-bootstrap.inc"; fi
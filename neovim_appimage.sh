
#!/bin/bash

read -p "Download latest neovim appimage for linux? [y/n] " download
if [[ $download == "y" ]]; then
cd /tmp
mkdir -p nvim
cd nvim

wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x nvim.appimage
./nvim.appimage --appimage-extract
mv squashfs-root $HOME/nvim
read -p "Add downloaded appimage alias to bashrc? [y/n] " add_to_bash
if [[ $add_to_bash == "y" ]]; then
echo "alias nvim=$HOME/nvim/usr/bin/nvim" >> $HOME/.bashrc
fi
fi

cd /tmp
mkdir -p nvim
cd nvim
git clone https://github.com/ak1932/configs
if [[ -d $HOME/.config/nvim ]]; then 
    echo "Neovim config detected...backing up it to $HOME/.config/nvim.bak"
    mv $HOME/.config/nvim $HOME/.config/nvim.bak;
fi
cd configs
mv nvim $HOME/config

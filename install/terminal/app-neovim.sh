cd /tmp
wget -O nvim.tar.gz "https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"
tar -xf nvim.tar.gz
sudo install nvim-linux64/bin/nvim /usr/local/bin/nvim
sudo cp -R nvim-linux64/lib /usr/local/
sudo cp -R nvim-linux64/share /usr/local/
rm -rf nvim-linux64 nvim.tar.gz
cd -

if [ ! -d "$HOME/.config/nvim" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    mkdir -p ~/.config/nvim
    cp -r  ~/.local/share/poposetup/configs/neovim/.config/nvim ~/.config
fi

# TODO Add desktop icon for alacritty
# https://github.com/basecamp/omakub/blob/master/install/terminal/app-neovim.sh

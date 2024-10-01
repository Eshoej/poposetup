sudo apt install i3 i3blocks picom feh compton rofi dmenu


if [ ! -d "$HOME/.config/i3" ]; then
    mkdir -p ~/.config/i3
    cp -r  ~/.local/share/poposetup/configs/i3/i3 ~/.config
fi


if [ ! -d "$HOME/.config/i3blocks" ]; then
    mkdir -p ~/.config/i3blocks
    cp -r  ~/.local/share/poposetup/configs/i3blocks/i3blocks ~/.config
fi

if [ ! -d "$HOME/.config/picom" ]; then
    mkdir -p ~/.config/picom
    cp -r  ~/.local/share/poposetup/configs/picom/picom ~/.config
fi


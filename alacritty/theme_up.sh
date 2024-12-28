#!/bin/bash

if [ $(cat $HOME/.config/alacritty/theme.log) == 1 ];then
	xx=132
	echo "132" > $HOME/.config/alacritty/theme.log
else
	x=$(cat $HOME/.config/alacritty/theme.log)
	xx=$(($x-1))
	echo "$(($x - 1))" > $HOME/.config/alacritty/theme.log
fi

y=$(sed -n "${xx}p" $HOME/.config/alacritty/theme)

echo "[general]" > $HOME/.config/alacritty/alacritty.toml
echo "import = [" >> $HOME/.config/alacritty/alacritty.toml
echo "$y" >> $HOME/.config/alacritty/alacritty.toml
echo "]" >> $HOME/.config/alacritty/alacritty.toml
echo "[font]" >> $HOME/.config/alacritty/alacritty.toml
echo "size = 16.00" >> $HOME/.config/alacritty/alacritty.toml

opacity=$(cat $HOME/.config/alacritty/opacity.log)

echo "[window]" >> $HOME/.config/alacritty/alacritty.toml
echo "opacity = $opacity" >> $HOME/.config/alacritty/alacritty.toml



#!/usr/bin/env bash

if [ ! -f /usr/share/X11/xkb/symbols/real-prog-dvorak ]; then
	echo "real-prog-dvorak doesn't exist, copying over"
    sudo cp ~/.local/share/poposetup/resources/real-prog-dvorak /usr/share/X11/xkb/symbols
fi


if grep -q "real-prog-dvorak" /usr/share/X11/xkb/rules/evdev.xml; then
	echo "evdev.xml already has real-prog-dvorak layout definition"
	exit 0
fi

dvorak_env="
<layout>
      <configItem>
        <name>real-prog-layout</name>
        <shortDescription>epd</shortDescription>
        <description>Prime English (US)</description>
      </configItem>
      <variantList>
	<variant>
	    <configItem>
		<name>real-prog-dvorak</name>
		<description>English (Real Programmers Dvorak)</description>
		<vendor>MichaelPaulson</vendor>
	    </configItem>
	</variant>
      </variantList>
</layout>
"

layout_list=$(cat /usr/share/X11/xkb/rules/evdev.xml | grep "<layoutList>" -n  | cut -f1 -d:)
total_lines=$(cat /usr/share/X11/xkb/rules/evdev.xml | wc -l)
tail_lines=$(($total_lines - $layout_list))

up_to=$(cat /usr/share/X11/xkb/rules/evdev.xml | head -$layout_list)
remaining=$(cat /usr/share/X11/xkb/rules/evdev.xml | tail -$tail_lines)

echo "$up_to
$dvorak_env
$remaining
" | sudo tee -a /usr/share/X11/xkb/rules/evdev.xml

echo "don't forget to log out to let these changes take effect"

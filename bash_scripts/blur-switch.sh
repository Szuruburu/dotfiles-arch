#!/bin/bash
commpres=$(cat /home/szu/.config/picom/picom.conf | grep "#blur-method = \"kawase\"")
echo $commpres

if [[ -n $commpres ]]; then
	sed -i 's/#blur-method = "kawase"/blur-method = "kawase"/' /home/szu/.config/picom/picom.conf
	notify-send "Blur on"
else
	sed -i 's/blur-method = "kawase"/#blur-method = "kawase"/' /home/szu/.config/picom/picom.conf
	notify-send "Blur off"
fi

#!/usr/bin/env bash
# called from $HOME/.config/sway/config.d/applications.conf

choice=$(wofi --dmenu <<< $'joker\nbootleg\nlofi\nC418\npiano\nmetal\nchiptune\ndnb\nifeellikemyself')

case "$choice" in
	joker)
		(mpv "https://www.youtube.com/watch?v=Uq7kyf1T_lk" > /dev/null 2>&1 &) && kitty -e cava
		;;
	bootleg)
		(mpv --shuffle "https://music.youtube.com/playlist?list=PLQN1NbOMpBk6daJUzOSqDIVQBTv6RYrm_" > /dev/null 2>&1 &) && kitty -e cava
		;;
	lofi)
		(mpv "https://www.youtube.com/watch?v=jfKfPfyJRdk" > /dev/null 2>&1 &) && kitty -e cava
		;;
	C418)
		(mpv "https://www.youtube.com/watch?v=2xg71fa1CfI" > /dev/null 2>&1 &) && kitty -e cava
		;;
	piano)
		(mpv "https://www.youtube.com/watch?v=csxo1flT530" > /dev/null 2>&1 &) && kitty -e cava
		;;
	metal)
		(mpv "https://www.youtube.com/watch?v=9kGTJfwPSzI" > /dev/null 2>&1 &) && kitty -e cava
		;;
	chiptune)
		(mpv "https://www.youtube.com/watch?v=kYxMjsKT5Wk" > /dev/null 2>&1 &) && kitty -e cava
		;;
	dnb)
		(mpv "https://www.youtube.com/watch?v=GDtrDeaKpPc" > /dev/null 2>&1 &) && kitty -e cava
		;;
	ifeellikemyself)
		(mpv "https://www.youtube.com/watch?v=XGTIVDt7CfU" > /dev/null 2>&1 &) && kitty -e cava
		;;
esac
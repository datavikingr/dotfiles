#!/bin/bash

# definitely deprecated by now, considering KDE has moved way past this

sudo apt install kde-standard
#sudo apt install kde-full

# Rounded Corners; source: https://github.com/matinlotfali/KDE-Rounded-Corners
echo "Now, let's start with the desktop. How about some rounded corners to your windows? They're very aesthetic, and don't serve"
echo "any other purpose. Still, they're very nice to look at. This will install from https://github.com/matinlotfali/KDE-Rounded-Corners"
echo
read -p "Would you like to install rounded corners? [y/n]" varRoundCorners
if [ $varRoundCorners == 'y']; then
	sudo apt install git cmake g++ gettext extra-cmake-modules qttools5-dev libqt5x11extras5-dev libkf5configwidgets-dev libkf5crash-dev libkf5globalaccel-dev libkf5kio-dev libkf5notifications-dev kinit-dev kwin-dev
	cd ~
	mkdir src
	cd src
	git clone https://github.com/matinlotfali/KDE-Rounded-Corners
	cd KDE-Rounded-Corners
	mkdir qt5build
	cd qt5build
	cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DQT5BUILD=ON
	make
	sudo make install
	cd ~
	echo
	echo "This requires reboot to take effect, so you won't see rounded corners yet."
	echo "If you decline to restart later (not-recommended), run > kwin_x11 --replace & < to activate them. And then restart."
	echo
fi
echo

# Krohnkite TWM; source: https://github.com/esjeon/krohnkite
echo "Would you like a tiling window manager? Tiling window managers are famous on reddit (see www.reddit.com/r/unixporn for examples),"
echo "for their efficient, sleek designs maximizing usable screen real estate. We'll be going with Krohnkite here,"
echo "but feel to try bismuth, or other WMs later! A word of advice: Keybinds aren't essential, but come highly recommended."
echo "This isn't everyone's cup of tea, but it is ours - we love it."
echo "So be sure and verify you keyboard shortcuts after reboot. This will install from https://github.com/esjeon/krohnkite"
echo
read -p "Would you like to install Krohnkite tiling window manager for KDE Plasma? [y/n]" varKrohn
if [ $varKrohn == 'y']; then
	plasmapkg2 -t kwinscript -i krohnkite.kwinscript
	mkdir -p ~/.local/share/kservices5/
	ln -s ~/.local/share/kwin/scripts/krohnkite/metadata.desktop ~/.local/share/kservices5/krohnkite.desktop
	echo
	echo "This may have activated now, it may not have. If you're screen looks weird, head to the system settings after restart."
	echo "System Settings > Window Management > KWin Scripts; there you'll see Krohnkite and it's little settings gear to the right."
	echo "We took the the liberty of installing the settings button, which isn't default for some reason, for easy access."
	echo "And if you hate it, just turn it off from the same menu."
	echo
	sleep 5s
fi
echo

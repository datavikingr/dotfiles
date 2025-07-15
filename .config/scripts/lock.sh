#!/usr/bin/env bash
# called from $HOME/.config/sway/config.d/idle.conf

swaylock \
  --clock \
  --indicator \
  --indicator-radius 200 \
  --indicator-thickness 16 \
  --ring-color 8839ef \
  --ring-ver-color 1e66f5 \
  --ring-wrong-color d20f39 \
  --ring-clear-color 40a02b \
  --font FiraCodeNerdFont \
  --font-size 48 \
  --text-color 04a5e5 \
  --image $HOME/pictures/wallpapers/greatwavesunset.jpeg \
  --effect-blur 16x4 \
  --effect-vignette .2:.8
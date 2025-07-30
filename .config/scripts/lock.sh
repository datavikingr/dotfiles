#!/usr/bin/env bash
# called from $HOME/.config/sway/config.d/idle.conf

swaylock \
  --clock \
  --indicator \
  --indicator-radius 200 \
  --indicator-thickness 16 \
  --ring-color 8839ef \
  --inside-color 000000cc \
  --ring-ver-color 1e66f5ff \
  --inside-ver-color 1e66f544 \
  --ring-wrong-color d20f39ff \
  --inside-wrong-color d20f3944 \
  --ring-clear-color 40a02bff \
  --inside-clear-color 40a02b44 \
  --font FiraCodeNerdFont \
  --font-size 48 \
  --text-color 04a5e5 \
  --image $HOME/pictures/wallpapers/greatwavesunset.jpeg \
  --effect-blur 16x4 \
  --effect-vignette .2:.8
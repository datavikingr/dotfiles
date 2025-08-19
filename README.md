# what

I'm tracking my dotfiles on github again. These are for sway/swayfx, purpose-built on my custom-firmware Acer R13 running Arch. Which is a neat piece of kit that I'm really proud of, but actually can't run anything more intense than sway on arch. I can still game dev on it though.

&& I'm beginning to really like caps-lock-super.

# why

I like the form factor (small, but not tiny), the keyboard (good spacing), the case (no flex), and stickers (sentimental sticker bomb) of this particular hardware. Google rendered it obsolete, so I flashed a custom firmware (coreboot), and kept it alive. Everything after that is an exercise in digital minimalism, and seeing how can I pipe different data around.

# how

```
cd $HOME
git clone https://github.com/datavikingr/dotfiles
cd dotfiles
stow .
```

install dependencies from `requirements.txt` and you're off to the races (includes dumps from yay -Qe & pipx list, sp batteries are not included).

# when

check the commit history for this run, I'm not sure.

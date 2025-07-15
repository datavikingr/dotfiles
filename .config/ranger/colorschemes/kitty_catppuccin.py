#!/usr/bin/env python

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class KittyCustom(ColorScheme):
    progress_bar_color = 5  # primary

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                fg = 1
            if context.border:
                fg = 8
            if context.image:
                fg = 6  # secondary
            if context.video:
                fg = 1
            if context.audio:
                fg = 6
            if context.document:
                fg = 2
            if context.container:
                attr |= bold
                fg = 5  # primary
            if context.directory:
                attr |= bold
                fg = 5  # primary
            elif context.executable and not any((context.media, context.container, context.fifo, context.socket)):
                attr |= bold
                fg = 6  # secondary
            if context.socket:
                fg = 13
                attr |= bold
            if context.fifo or context.device:
                fg = 3
                if context.device:
                    attr |= bold
            if context.link:
                fg = 5 if context.good else 1
            if context.bad:
                bg = 1
            if context.tag_marker and not context.selected:
                attr |= bold
                fg = 1
            if not context.selected and (context.cut or context.copied):
                fg = 8
                attr |= dim
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = 6  # secondary
            if context.badinfo:
                fg = 1

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = 5 if context.bad else 6
            elif context.directory:
                fg = 5  # primary
            elif context.tab:
                if context.good:
                    bg = 6
            elif context.link:
                fg = 6

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = 2
                elif context.bad:
                    fg = 1
            if context.marked:
                attr |= bold | reverse
                fg = 6
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 1
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = 6
                attr &= ~bold
            if context.vcscommit:
                fg = 3
                attr &= ~bold

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = 6
            if context.selected:
                attr |= reverse
            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = 1
            elif context.vcschanged:
                fg = 3
            elif context.vcsunknown:
                fg = 1
            elif context.vcsstaged:
                fg = 2
            elif context.vcssync:
                fg = 2
            elif context.vcsignored:
                fg = 8

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync:
                fg = 2
            elif context.vcsbehind:
                fg = 1
            elif context.vcsahead:
                fg = 6
            elif context.vcsdiverged:
                fg = 1
            elif context.vcsunknown:
                fg = 1

        return fg, bg, attr
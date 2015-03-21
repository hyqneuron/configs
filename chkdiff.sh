#!/bin/sh

diff $@ i3/config           ~/.config/i3/config
diff $@ i3status/config     ~/.config/i3status/config
diff $@ .vimrc              ~/.vimrc

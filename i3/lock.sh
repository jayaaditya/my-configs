#!/bin/bash
scrot -e 'mv $f ~/wallpapers/temp1.png'
convert ~/wallpapers/temp1.png -blur 0x08 ~/wallpapers/logo_ubuntu.png -gravity center -composite ~/wallpapers/lock.png
rm ~/wallpapers/temp1.png
i3lock -i ~/wallpapers/lock.png -e -f

#!/bin/sh

xrandr \
  --output DisplayPort-0 --mode 900x1440 --pos 0x0 --rotate left\
  --output HDMI-A-0 --mode 1920x1080 --pos 900x0 --rotate normal \
  --output DVI-D-0 --off \
  --output DVI-I-1 --off

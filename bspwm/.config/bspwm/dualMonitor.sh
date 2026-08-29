#!/bin/sh
xrandr \
  --output DisplayPort-0 --off \
  --output DVI-D-0 --mode 1440x900 --pos 0x0 --rotate right \
  --output HDMI-A-0 --mode 1920x1080 --pos 900x0 --rotate normal \
  --output DVI-I-1 --off

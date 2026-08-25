#!/bin/sh

xrandr \
  --output DisplayPort-0 --off \
  --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal \
  --output DVI-D-0 --mode 1440x900 --pos 198x1080 --rotate normal \
  --output DVI-I-1 --off

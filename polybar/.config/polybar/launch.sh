#!/bin/bash

killall -q polybar

MONITOR=HDMI-A-0 polybar example &
#MONITOR=DVI-0 polybar secondary &

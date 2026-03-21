#!/bin/bash

killall -q polybar

MONITOR=HDMI-0 polybar example &
MONITOR=DVI-0 polybar secondary &

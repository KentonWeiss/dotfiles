#!/bin/sh

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

COLOR=$CRUST
ICON=$CLOCK_ICON

sketchybar --set "$NAME" label="$(date '+%I:%M:%S %p')" icon=$ICON icon.color=$COLOR 

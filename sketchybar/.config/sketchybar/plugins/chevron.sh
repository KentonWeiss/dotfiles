#!/bin/sh

# Color and Icon Variables
source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

format=(
    # Icon
    icon=$CHEVRON
    icon.color=$BLUE

    # Label
    label.drawing=off

    # Background
    background.drawing=off
)

sketchybar --set $NAME "${format[@]}"

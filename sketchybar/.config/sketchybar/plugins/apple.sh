#!/bin/sh

# Color and Icon Variables
source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

# Formatting
format=(
    # Icon
    icon=$APPLE_LOGO
    icon.color=$CRUST
    icon.padding_left=8
    icon.padding_right=9
    icon.y_offset=-1

    # Label
    label.drawing=off

    # Background
    background.color=$TEAL
    background.corner_radius=5
)

sketchybar --set $NAME "${format[@]}"

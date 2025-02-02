#!/bin/sh

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

icon_format=(
    icon=$APPLE_LOGO
    color=$CRUST
    icon.padding_left=9
    icon.padding_right=9
    label.drawing=off
)

background=(
    background.color=$TEAL
    background.height=26
    background.corner_radius=5
)

sketchybar --set $NAME "${icon_format[@]}" \
           --set $NAME "${background[@]}"

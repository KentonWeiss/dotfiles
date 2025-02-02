#!/bin/sh

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

icon_format=(
    icon=$APPLE_LOGO
    color=$CRUST
)

background=(
    background.color=$TEAL
    background.height=26
    background.corner_radius=9
)

sketchybar --set $NAME "${icon_format[@]}" \
           --set $NAME "${background[@]}"

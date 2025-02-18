#!/bin/sh

# Icon and Color Variables
source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

# Formatting
format=(
    # Icon
    icon.drawing=off

    # Label
    # The label variable executes a bash command to get the window name from the Aerospace WM
    label="$(aerospace list-windows --focused --format "%{app-name} - %{window-title}")"
    label.color=$CRUST
    label.max_chars=50

    # Background
    background.color=$YELLOW
    background.corner_radius=5
)

# Set/Update the name when the app is switched
if [ "$SENDER" = "front_app_switched" ]; then
    sketchybar --set $NAME "${format[@]}"
fi

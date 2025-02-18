#!/bin/sh

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

logo_format=(
    # General
    padding_right=2

    # Icon
    icon=$CALENDAR
    icon.color=$CRUST
    icon.padding_left=5

    # Icon Background
    icon.background.color=$BLUE
    icon.background.height=23
    icon.background.corner_radius=4
    icon.background.padding_right=10

    # Label
    label.drawing=off

    # Background
    background.drawing=off
)

label_format=(
    # General
    padding_left=2

    # Icon
    icon.drawing=off

    # Label
    label="$(date -I)"

    # Label Background
    label.background.color=$SURFACE_1
    label.background.height=23
    label.background.corner_radius=4
    label.background.padding_right=100

    # Background
    background.drawing=off
)

# Set the calendar label's formatting
sketchybar --set calendar "${label_format[@]}"

# Add the logo to the left of the label
sketchybar --add item calendar_logo right \
           --set calendar_logo "${logo_format[@]}" \
           --move calendar_logo after calendar

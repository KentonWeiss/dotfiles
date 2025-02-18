
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

    # Label Background
    label="WiFi"
    label.background.color=$SURFACE_1
    label.background.height=23
    label.background.corner_radius=4
    label.background.padding_right=100

    # Background
    background.drawing=off
)

if [ "$SENDER" = "wifi_change" ]; then
    # Set the calendar label's formatting
    sketchybar --set wifi "${label_format[@]}" label="$INFO"

    # Add the logo to the left of the label
    sketchybar --add item wifi_logo right \
               --set wifi_logo "${logo_format[@]}" \
               --move wifi_logo after wifi
fi

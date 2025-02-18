#!/bin/sh

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

# Get the battery percentage and whether it is charging
PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

# Background color variable, changes based on battery percentage/charging
BACKGROUND_COLOR=$GREEN

case "${PERCENTAGE}" in
  # 90-100%:
  #     Set icon to the full battery
  9[0-9]|100) ICON=$BATTERY_100
  ;;
  # 60-80%:
  #     Set icon to the 75% full battery
  [6-8][0-9]) ICON=$BATTERY_75
  ;;
  # 30-59%:
  #     Set icon to 50% full battery
  [3-5][0-9]) ICON=$BATTERY_50
  ;;
  # 10-29%:
  #     Set icon to 25% full battery
  #     Change background color to yellow
  [1-2][0-9]) ICON=$BATTERY_25; BACKGROUND_COLOR=$YELLOW
  ;;
  # 0-10%:
  #     Set icon to empty
  #     Change background color to red
  *) ICON=$BATTERY_0; BACKGROUND_COLOR=$RED
esac

# If the battery is charging:
#   Set icon to charging
#   Change background color to green
if [[ "$CHARGING" != "" ]]; then
  ICON=$BATTERY_CHARGING
  BACKGROUND_COLOR=$GREEN
fi

# Logo formatting
logo_format=(
    # General
    padding_right=2

    # Icon
    icon=$ICON
    icon.color=$CRUST
    icon.padding_left=5

    # Icon Background
    icon.background.color=$BACKGROUND_COLOR
    icon.background.height=23
    icon.background.corner_radius=4
    icon.background.padding_right=10

    # Label
    label.drawing=off

    # Background
    background.drawing=off
)

# Label formatting
label_format=(
    # General
    padding_left=2

    # Icon
    icon.drawing=off

    # Label
    label="${PERCENTAGE}%"

    # Label Background
    label.background.color=$SURFACE_1
    label.background.height=23
    label.background.corner_radius=4
    label.background.padding_right=100

    # Background
    background.drawing=off
)

# Set the battery label's formatting
sketchybar --set battery "${label_format[@]}"

# Add the logo to the left of the label
sketchybar --add item battery_logo right \
           --set battery_logo "${logo_format[@]}" \
           --move battery_logo after battery

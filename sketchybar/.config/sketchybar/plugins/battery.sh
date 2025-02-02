#!/bin/sh

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

DRAWING=on
COLOR=$CRUST

case "${PERCENTAGE}" in
  9[0-9]|100) ICON=$BATTERY_100; DRAWING=off
  ;;
  [6-8][0-9]) ICON=$BATTERY_75; DRAWING=off
  ;;
  [3-5][0-9]) ICON=$BATTERY_50
  ;;
  [1-2][0-9]) ICON=$BATTERY_25
  ;;
  *) ICON=$BATTERY_0
esac

if [[ "$CHARGING" != "" ]]; then
  ICON=$BATTERY_CHARGING
fi

sketchybar --set $NAME drawing=$DRAWING icon="$ICON" label="${PERCENTAGE}%" icon.color=$COLOR

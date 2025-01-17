#!/bin/sh

# No battery detected
if [ -z "$(shopt -s nullglob; echo /sys/class/power_supply/BAT?*)" ]; then
  echo " 󱟩 "
fi

for battery in /sys/class/power_supply/BAT?*; do
  # If non-first battery, print a space separator.
  [ -n "${capacity+x}" ] && printf " "

  capacity="$(cat "$battery/capacity" 2>&1)"
  case "$(cat "$battery/status" 2>&1)" in
    "Full") status="󰁹 " ;;
    "Discharging") 
      case 1 in
        $(( capacity >= 98 )) ) status="󰁹 " ;;
        $(( capacity >= 90 )) ) status="󰂂 " ;;
        $(( capacity >= 80 )) ) status="󰂁 " ;;
        $(( capacity >= 70 )) ) status="󰂀 " ;;
        $(( capacity >= 60 )) ) status="󰁿 " ;;
        $(( capacity >= 50 )) ) status="󰁾 " ;;
        $(( capacity >= 40 )) ) status="󰁽 " ;;
        $(( capacity >= 30 )) ) status="󰁼 " ;;
        $(( capacity >= 20 )) ) status="󰁻 " ;;
        $(( capacity >= 10 )) ) status="󰁺 " ;;
        *) status="󰂎 " ;;
      esac
    ;;
    "Charging")
      case 1 in
        $(( capacity >= 98 )) ) status="󰂅 " ;;
        $(( capacity >= 90 )) ) status="󰂋 " ;;
        $(( capacity >= 80 )) ) status="󰂊 " ;;
        $(( capacity >= 70 )) ) status="󰢞 " ;;
        $(( capacity >= 60 )) ) status="󰂉 " ;;
        $(( capacity >= 50 )) ) status="󰢝 " ;;
        $(( capacity >= 40 )) ) status="󰂈 " ;;
        $(( capacity >= 30 )) ) status="󰂇 " ;;
        $(( capacity >= 20 )) ) status="󰂆 " ;;
        $(( capacity >= 10 )) ) status="󰢜 " ;;
        *) status="󰢟 " ;;
      esac
    ;;
    "Not charging") status="󰂃 " ;;
    "Unknown") status="󰂑 " ;;
    *) exit 1 ;;
  esac

  # Check if battery level is below 5%
  if [ "$capacity" -lt 5 ]; then
    echo "Battery level is critically low. Initiating shutdown..."
    sudo shutdown -h now
  fi

  printf "  %s%d%%  " "$status" "$capacity"
done


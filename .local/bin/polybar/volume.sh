#!/bin/sh

vol="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

[ "$vol" != "${vol%\[MUTED\]}" ] && echo "󰖁" && exit

vol="${vol#Volume: }"

split() {
  IFS=$2
  set -- $1
  printf '%s' "$@"
}

vol="$(printf "%.0f" "$(split "$vol" ".")")"

if [ "$((vol % 2))" -ne 0 ]; then
  vol=$((vol + 1))
  wpctl set-volume @DEFAULT_AUDIO_SINK@ "${vol}%"
fi

case 1 in
  $((vol >= 50)) ) icon="󰕾 " ;;
  $((vol >= 25)) ) icon="󰖀 " ;;
  $((vol >= 1)) ) icon="󰕿 " ;;
  * ) echo "󰖁" && exit ;;
esac

echo " $icon$vol%"

#!/bin/sh

if nmcli d | grep -Eq '\bgsm\s+connected\b'; then
  wwanicon="󰣸"
else
  wwanicon="󰣼"
fi

if [ "$(cat /sys/class/net/wlan0/operstate 2>/dev/null)" = 'up' ]; then
  wifiicon="󰖩"
elif [ "$(cat /sys/class/net/wlan0/operstate 2>/dev/null)" = 'down' ]; then
  wifiicon="󱛅"
else
  wifiicon="󰖪"
fi

if [ "$(cat /sys/class/net/e*/operstate 2>/dev/null)" = 'up' ]; then
  ethericon="󰱓"
else
  ethericon="󰅛"
fi

if [ "$wwanicon" = '󰣸' ]; then
  printf " %s " "$wwanicon"
elif [ "$ethericon" = '󰱓' ]; then
  printf " %s " "$ethericon"
else
  printf " %s " "$wifiicon"
fi

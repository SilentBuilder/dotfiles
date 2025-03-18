#!/bin/sh

# Wifi
if [ "$(cat /sys/class/net/wlan0/operstate 2>/dev/null)" = 'up' ]; then
  wifiicon="󰖩"
elif [ "$(cat /sys/class/net/wlan0/operstate 2>/dev/null)" = 'down' ]; then
  wifiicon="󱛅"
else
  wifiicon="󰖪"
fi

# Ethernet
if [ "$(cat /sys/class/net/e*/operstate 2>/dev/null)" = 'up' ]; then
  ethericon="󰱓"
else
  ethericon="󰅛"
fi

if [ "$ethericon" = '󰱓' ]; then
  printf " %s " "$ethericon"
else
  printf " %s " "$wifiicon"
fi

# printf "%s%s\n" "$wifiicon" "$ethericon"

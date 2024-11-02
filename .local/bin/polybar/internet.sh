#!/bin/sh

# Wifi
if [ "$(cat /sys/class/net/w*/operstate 2>/dev/null)" = 'up' ]; then
  wifiicon="󰖩"
elif [ "$(cat /sys/class/net/w*/operstate 2>/dev/null)" = 'down' ]; then
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
  printf "%s\n" "$ethericon"
else
  printf "%s\n" "$wifiicon"
fi

# printf "%s%s\n" "$wifiicon" "$ethericon"

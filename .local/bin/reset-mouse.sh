#!/bin/sh

if [ "$EUID" -ne 0 ]; then
  exit 1
fi

sudo modprobe -r psmouse
sudo modprobe psmouse

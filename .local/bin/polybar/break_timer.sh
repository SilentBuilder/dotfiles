#!/usr/bin/env bash
statefile=/tmp/break_timer_end

[[ -f $statefile ]] || { printf "\n"; exit 0; }

end=$(<"$statefile")
now=$(date +%s)
remain=$((end-now))

if (( remain <= 0 )); then
  rm -f "$statefile"
  printf "\n"
  exit 0
fi

printf "󰄉 %02d:%02d\n" $((remain/60)) $((remain%60))

#!/bin/sh

base_dir="$HOME/.hidden/Notes/Struct/Plans"
files=("R.org" "R-0001.org" "R-0002.org" "R-0003.org" "R-0004.org" "R-0005.org" \
       "R-0006.org" "R-0007.org" "R-0008.org" "R-0009.org" "R-0010.org" "R-0011.org" \
       "R-0012.org" "R-0013.org" "R-0014.org" "R-0015.org" "R-0016.org" "R-0017.org")

for file in "${files[@]}"; do
  file_path="$base_dir/$file"

  sed -i 's/\[X\]/[ ]/g' "$file_path"
  sed -i 's/\[-\]/[ ]/g' "$file_path"
  sed -i 's/\[\([0-9]\+\)\/\([0-9]\+\)\]/[0\/\2]/g' "$file_path"
  sed -i 's/DONE/TODO/g' "$file_path"
  sed -i '/^CLOSED: /d' "$file_path"
done

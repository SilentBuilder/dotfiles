#!/bin/sh

base_dir="$HOME/Documents/Personal/Notes/Struct"
files=("Morning.org" "Afternoon.org" "Evening.org" "Night.org")

for file in "${files[@]}"; do
    file_path="$base_dir/$file"

    sed -i 's/\[X\]/[ ]/g' "$file_path"
    sed -i 's/\[-\]/[ ]/g' "$file_path"
    sed -i 's/\[\([0-9]\+\)\/\([0-9]\+\)\]/[0\/\2]/g' "$file_path"
    sed -i 's/DONE/TODO/g' "$file_path"
done

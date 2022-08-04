#!/bin/bash

## Start off by setting shell options / getting consts.
shopt -s nullglob
declare -r style_dir=$(realpath $(dirname "$0"))
declare -r output_file="$style_dir/../style.css"

mkdir "$style_dir/out"
rm "$style_dir/out/*.css" || true

for in_file in "$style_dir"/*.scss; do
	declare out_file=$(echo "$in_file" | perl -p -e 's/\.scss$/.css/g' -)
	sass --no-source-map "$in_file" "$out_file"
    mv "$out_file" out/
done;
for in_file in "$style_dir"/*.css; do
    cp "$in_file" out/
done;

## Compile CSS to a single file.
((ls "$style_dir"/out/*.css > /dev/null 2>&1) && cat "$style_dir"/out/*.css > "$output_file") || touch "$output_file"
cssbeautify "$output_file" > "$output_file".tmp
mv "$output_file".tmp "$output_file"

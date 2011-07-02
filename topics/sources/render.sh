#!/bin/bash

inkscape --help &>/dev/null || {
  echo "This script requires inkscape but it's not installed. Aborting." >&2
  exit
}

list=$(ls *.svg)

if [ ! -d "render" ] && [ ! -e "render" ]; then
  mkdir "render"
else
  echo "Found a file called 'render'. Cannot continue."
  echo "Please delete or rename this file/folder."
  exit
fi

for item in $list; do
  inkscape --file="$item" --export-png="render/`echo $item | sed 's/svg/png/'`" > /dev/null &
done

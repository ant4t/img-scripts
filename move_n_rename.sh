#!/bin/sh
imgdir=/Volumes/Untitled/DCIM/
destdir=/Volumes/Untitled/fuji/
backupdirs=(
/Volumes/0_ANTONIO/fuji/
/Volumes/1_ANTONIO/fuji/
)

#create destination directory if it doesnt exist
if [[ ! -d $destdir ]]; then
  mkdir "$destdir"
  echo "Created $destdir"
fi

echo "Sorting images into directories based on captured time (UTC)"
source move_img.sh "$imgdir" "$destdir"

echo "Renaming images based on captured time (UTC)"
source rename.sh "$destdir"

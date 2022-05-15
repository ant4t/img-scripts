#!/bin/sh
imgdir=/Volumes/NO' 'NAME/DCIM/
destdir=/Volumes/NO' 'NAME/sony/
backupdirs=(
/Volumes/0_ANTONIO/sony/
/Volumes/ANTONIO_S/sony/
)

#create destination directory if it doesnt exist
if [[ ! -d $destdir ]]; then
  mkdir "$destdir"
  echo "Created $destdir"
fi

echo "Sorting images into directories based on captured time (UTC)"
. move_img.sh "$imgdir" "$destdir"

echo "Renaming images based on captured time (UTC)"
. rename.sh "$destdir"

echo "Backing up images"
for directory in ${backupdirs[@]}
do
  if [[ -d $directory ]]; then
    start_time=`date +%s`
    echo "Backup directory: $directory"
    rsync -aq -P "$destdir" "$directory"
    end_time=`date +%s`
    echo "Execution time for backup is `expr $end_time - $start_time` s"
  else
    echo "Invalid directory $directory"
  fi
done
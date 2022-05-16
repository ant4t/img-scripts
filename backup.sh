#!/bin/sh
imgdir=/Volumes/Untitled/DCIM/
camera_dirs=(
/Volumes/Untitled/SONY_ILCE-7M3
/Volumes/Untitled/FUJIFILM_X-T3
)
backupdirs=(
/Volumes/0_ANTONIO/
/Volumes/1_ANTONIO/
)


echo "backup.sh: Sorting images into directories based on captured time (UTC) and cameras"
source sort_img_by_camera.sh "$imgdir"

echo "backup.sh: Renaming images based on captured time (UTC)"
for directory in ${camera_dirs[@]}
do
  if [[ -d $directory ]]; then
    source rename.sh "$directory"
  else
    echo "backup.sh: Invalid directory $directory"
  fi
done

echo "backup.sh: Backing up images"
for source_dir in ${camera_dirs[@]}
do
  if [[ -d $source_dir ]]; then
    start_time=`date +%s`
    echo "Source directory: $source_dir"
    for dest_dir in ${backupdirs[@]}
    do
      if [[ -d $dest_dir ]]; then
        echo "Backup directory: $dest_dir"
        rsync -aq -P "$source_dir" "$dest_dir"
      else
        echo "backup.sh: Invalid backup directory $source_dir"
      fi
    done
    end_time=`date +%s`
    echo "backup.sh: Execution time for backup is `expr $end_time - $start_time` s"
  else
    echo "backup.sh: Invalid source directory $source_dir"
  fi
done
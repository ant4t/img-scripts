#!/bin/sh
start_time=`date +%s`
if [[ -z $1 ]]; then
  imgdir=/Volumes/Untitled/DCIM/
else
  imgdir=$1
fi

if [[ -z $2 ]]; then
  destdir="$imgdir"
else
  destdir=$2
fi

if [[ -d $imgdir && -d $destdir ]]; then
  exiftool -r -d "$destdir"/%Y/%Y_%m '-Directory<FileModifyDate' '-Directory<CreateDate' '-Directory<DateTimeOriginal' -ext raf -ext jpg -ext jpeg -ext arw -ext cr2 "$imgdir"
else
  echo "Invalid directory $imgdir or $destdir"
fi

end_time=`date +%s`
echo "Execution for arranging imgages time is `expr $end_time - $start_time` s"
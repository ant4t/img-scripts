#!/bin/sh
start_time=`date +%s`
if [[ -z $1 ]]; then
  imgdir=/Volumes/Untitled/DCIM/
else
  imgdir=$1
fi

if [[ -d /Volumes/Untitled ]]; then
  exiftool -if '$filename !~ /^\./' -r -d %Y/%Y_%m '-Directory</Volumes/Untitled/${make;}_${model;}/$FileModifyDate' '-Directory</Volumes/Untitled/${make;}_${model;}/$CreateDate' '-Directory</Volumes/Untitled/${make;}_${model;}/$DateTimeOriginal' -ext raf -ext jpg -ext jpeg -ext arw -ext cr2 "$imgdir"
else
  echo "sort_img_by_camera.sh: Invalid directory $imgdir or /Volumes/Untitled"
fi

end_time=`date +%s`
echo "sort_img_by_camera.sh: Execution time for arranging imgages by cameras is `expr $end_time - $start_time` s"
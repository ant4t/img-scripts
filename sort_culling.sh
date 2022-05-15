#!/bin/sh
start_time=`date +%s`
if [[ -z $1 ]]; then
  imgdir=/data/data/com.termux/files/home/storage/pictures/Culling
else
  imgdir=$1
fi

if [[ -d $imgdir ]]; then
  imgcount=`find "$imgdir" -maxdepth 1 -type f -iname '*.jpg' -o -iname '*.jpeg'| wc -l`
  i=0
  while [[ imgcount -ge 100 ]]; do
    echo "Image count in $imgdir is $imgcount"
    echo "Moving to $imgdir/a$i"
    mkdir -p "$imgdir/a$i"
    mv `find "$imgdir" -maxdepth 1 -type f -iname '*.jpg' -o -iname '*.jpeg'| sort | head -100` "$imgdir/a$i"
    imgcount=`find "$imgdir" -maxdepth 1 -type f -iname '*.jpg' -o -iname '*.jpeg'| wc -l`
    i=$((i+1))
    if [[ i -ge 10 ]]; then
      i=0
    fi
  done
  if [[ imgcount -gt 0 ]]; then
    echo "Image count in $imgdir is $imgcount"
    echo "Moving to $imgdir/a$i"
    mkdir -p "$imgdir/a$i"
    mv `find "$imgdir" -maxdepth 1 -type f -iname '*.jpg' -o -iname '*.jpeg'` "$imgdir/a$i"
  fi
else
  echo "Invalid directory $imgdir"
fi
end_time=`date +%s`
echo "Execution time for sorting images in $imgdir is `expr $end_time - $start_time` s"
#!/bin/sh
start_time=`date +%s`
if [[ -z $1 ]]; then
  imgdir=/Users/antonio/photos
else
  imgdir=$1
fi

if [[ -d $imgdir ]]; then
  exiftool -if '$filename !~ /^\./' -r -d %Y%m%d_%H%M%S%%-c.%%e '-FileName<${filemodifydate}' '-FileName<${createdate}' '-FileName<${datetimeoriginal}' -ext raf -ext jpg -ext jpeg -ext arw "$imgdir"
else
  echo "Invalid directory $imgdir"
fi
end_time=`date +%s`
echo "Execution time for renaming images is `expr $end_time - $start_time` s"
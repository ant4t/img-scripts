IMG_DIR=/Volumes/Untitled/DCIM
find "$IMG_DIR" -name "*.JPG"|while read fname; do
  filename=$(basename "$fname")
  filename="${filename%.*}"
  echo "$filename"

done
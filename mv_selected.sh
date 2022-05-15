IMG_DIR=/Volumes/Untitled/DCIM
DEST_DIR=/Volumes/Untitled/SELECTED

mkdir -p "$DEST_DIR"

find "$IMG_DIR" -name "*.JPG"|while read fname; do

  filename=$(basename "$fname")
  filename="${filename%.*}"

  find "$IMG_DIR" \( -name "$filename.ARW" -or -name "$filename.RAF" \) -exec mv {} "$DEST_DIR" \;
done

find "$IMG_DIR" -name "*.JPG" -exec mv {} "$DEST_DIR" \;
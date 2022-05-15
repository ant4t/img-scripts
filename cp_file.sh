IMG_DIR=/Volumes/Untitled/DCIM
DEST_DIR=/Users/antonio/photos

for f in /Users/antonio/jpg_to_be_transferred/*.JPG; do

  filename=$(basename "$f")
  filename="${filename%.*}"

  find "$IMG_DIR" \( -name "$filename.ARW" -or -name "$filename.RAF" \) -exec cp -n {} "$DEST_DIR" \;
done
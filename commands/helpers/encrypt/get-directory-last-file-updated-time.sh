local fileName=$(get-directory-last-file-updated)
local updateTime=$(get-file-updated-time "$fileName")
if [ -z "$updateTime" ]; then
  echo "0"
else
  echo "$updateTime"
fi
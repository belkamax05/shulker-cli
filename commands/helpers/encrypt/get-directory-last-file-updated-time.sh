local dirPath="$1"
if [ -z "$dirPath" ]; then
  echo-error "Directory path is required."
  return $CODE_ERROR
fi
local prefix="$(format-cmd 'get-directory-last-file-updated-time')"
local fileName=$(get-directory-last-file-updated $dirPath)
local updateTime=$(get-file-updated-time "$fileName")
if [ -z "$updateTime" ]; then
  echo "0"
else
  echo "$updateTime"
fi
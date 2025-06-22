local dirPath="$1"
if [ -z "$dirPath" ]; then
  echo-error "Directory path is required."
  return $CODE_ERROR
fi
echo-debug "!!!get-directory-last-file-updated-time $@"
local prefix="$(format-cmd 'get-directory-last-file-updated-time')"
echo-debug "$prefix Getting last file updated time for directory..."
local fileName=$(get-directory-last-file-updated $dirPath)
echo-debug "$prefix Getting last file updated time for directory: $fileName"
local updateTime=$(get-file-updated-time "$fileName")
echo-debug "$prefix Last file updated time: $updateTime"
if [ -z "$updateTime" ]; then
  echo "0"
else
  echo "$updateTime"
fi
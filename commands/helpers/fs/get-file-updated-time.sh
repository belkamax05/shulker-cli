# get-file-updated-time
local filePath="$1"
if [ -z "$filePath" ]; then
  echo "Error: No file path provided."
  exit 1
fi
local updateTime=$(stat -c %Y "$filePath" 2>/dev/null)
if [ $? -ne 0 ]; then
  echo "Error: Could not retrieve updated time for file '$filePath'."
  exit 1
fi
if [ -z "$updateTime" ]; then
  echo "0"
else
  echo "$updateTime"
fi
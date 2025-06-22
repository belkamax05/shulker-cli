local sourceDir="$1"
local targetFile="$2"

local hashFile="$targetFile.hash"
local currentHash=$(get-directory-updated-token "$sourceDir")

echo "$currentHash" > "$hashFile"
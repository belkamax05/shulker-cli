local fileName="$1"

local preffix=$(format-cmd 'source-if-exists')
local fileNameFormatted=$(format-args "$fileName")

if [ -f "$fileName" ]; then
    source "$fileName"
    trace-add "$preffix Sourced $fileNameFormatted."
else
    echo-error "$preffix File $fileNameFormatted does not exist, skipping source"
fi
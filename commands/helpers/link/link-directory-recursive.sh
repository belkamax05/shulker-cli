local directoryFrom="$1"
local directoryTo="$2"

local preffix=$(format-cmd 'link-directory-recursive')
local directoryFromFormatted=$(format-args "$directoryFrom")
local directoryToFormatted=$(format-args "$directoryTo")

shift 2
echo-debug "$preffix Link directory recursively from $directoryFromFormatted to $directoryToFormatted"
each-file-recursive "$directoryFrom" "link-file-recursive-mapper" "$directoryFrom" "$directoryTo" "--other-args" "$@"
echo-debug "$preffix Link from $directoryFromFormatted to $directoryToFormatted completed"
trace-add "$preffix Linked directory $directoryFromFormatted to $directoryToFormatted with args: $(format-args "$@")"
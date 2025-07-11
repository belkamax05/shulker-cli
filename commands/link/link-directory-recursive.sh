local directoryFrom="$1"
local directoryTo="$2"

local prefix=$(format-cmd 'link-directory-recursive')
local directoryFromFormatted=$(format-args "$directoryFrom")
local directoryToFormatted=$(format-args "$directoryTo")

shift 2
echo-debug "$prefix Link directory recursively from $directoryFromFormatted to $directoryToFormatted"
each-file-recursive "$directoryFrom" "link-file-recursive-mapper" "$directoryFrom" "$directoryTo" "--other-args" "$@"
trace-add "$prefix Linked directory $directoryFromFormatted to $directoryToFormatted with args: $(format-args "$@")"
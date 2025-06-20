local directoryFrom="$1"
local directoryTo="$2"
shift 2
echo-debug "Link directory recursively from $COLOR_ARGS$directoryFrom$STYLE_RESET to $COLOR_ARGS$directoryTo$STYLE_RESET"
each-file-recursively "$directoryFrom" "link-file-recursive-mapper" "$directoryFrom" "$directoryTo" "--other-args" "$@"
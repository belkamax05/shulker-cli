local directoryFrom="$1"
local directoryTo="$2"
shift 2
echo-info "Linking home directory from $COLOR_ARGS$directoryFrom$STYLE_RESET to $COLOR_ARGS$directoryTo$STYLE_RESET"

each-file-recursively "$directoryFrom" "link-file-recursive-mapper" "$directoryFrom" "$directoryTo" "--other-args" "$@"
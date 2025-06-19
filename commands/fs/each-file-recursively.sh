local root_dir="$1"
local command="$2"
shift 2
find "$root_dir" -type f -print0 | sort -z | while IFS= read -r -d $'\0' file; do
    echo-debug "${COLOR_CYAN}[each-file-recursively]${STYLE_RESET} Processing file: $COLOR_ARGS$file$STYLE_RESET"
    eval "$command" "$file" "$@"
done
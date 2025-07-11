local root_dir="$1"
local command="$2"

local prefix=$(format-cmd 'each-sh-recursive')

shift 2
find "$root_dir" -type f -name "*.sh" -print0 | sort -z | while IFS= read -r -d $'\0' file; do
    echo-verbose-debug "$prefix Processing file: $(format-args "$file")"
    eval "$command" "$file" "$@"
done
trace-add "$prefix Processed all files in directory: $(format-args "$root_dir") with command: $(format-args "$command")"
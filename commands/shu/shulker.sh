local cmd="$1"
if [[ -n "$cmd" ]]; then
    shift
fi

local shuCmd="shu-${cmd}"

# echo "Executing command: $shuCmd with arguments: $@"
if ! type "$shuCmd" &>/dev/null; then
    echo-error "Command '$shuCmd' not found. Please check your Shulker CLI installation."
    return $CODE_ERROR
fi
eval "$shuCmd" "$@"

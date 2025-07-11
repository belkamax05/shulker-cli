local currentCmd="$1"
if [[ -n "$currentCmd" ]]; then
    shift
fi

local shuCmdFunction="shu-${currentCmd}"

# echo "Executing command: $shuCmd with arguments: $@"
if ! type "$shuCmdFunction" &>/dev/null; then
    # echo-error "Command '$shuCmdFunction' not found. Please check your Shulker CLI installation."
    shu-run $currentCmd "$@"
    return $CODE_ERROR
fi
eval "$shuCmdFunction" "$@"

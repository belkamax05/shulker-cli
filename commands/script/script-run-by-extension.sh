local prefix="$(format-cmd "script-run-by-extension")"
local ext="$1"
local pathToCmd="$2"
local runner="script-run-$ext"
shift 2
if [[ $pathToCmd == *.$ext ]]; then
    echo-debug "$prefix Script $(format-args "$ext") at $(format-args "$pathToCmd") with args: $(format-args "$@")"
    $runner "$pathToCmd" "$@"
    return $?
fi
if [[ -f "$pathToCmd.$ext" ]]; then
    echo-debug "$prefix Script $(format-args "$ext") at $(format-args "$pathToCmd.$ext") with args: $(format-args "$@")"
    $runner "$pathToCmd.$ext" "$@"
    return $?
fi
return $CODE_NOT_FOUND
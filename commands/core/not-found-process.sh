local command=$1
local isAtLeast3Args=false
if [[ $# -ge 3 ]]; then
    isAtLeast3Args=true
fi
shift 1
local restArgs=$@
local prefix="$(format-cmd "not-found-process")"

if [[ $isAtLeast3Args == true ]]; then
    ai $command $restArgs
    return $?
fi

echo-debug "$prefix Command $(format-cmd "$command") not found. Args: $(format-args "${restArgs[@]}")"
return $CODE_NOT_FOUND

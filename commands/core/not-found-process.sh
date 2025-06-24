local command=$1
shift 1
local restArgs=$@
local prefix="$(format-cmd "not-found-process")"

echo-debug "$prefix Command $(format-cmd "$command") not found. Args: $(format-args "${restArgs[@]}")"
return $CODE_NOT_FOUND

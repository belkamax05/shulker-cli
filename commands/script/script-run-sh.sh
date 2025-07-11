local prefix="$(format-cmd "script-run-sh")"
local scriptPath="$1"
shift
echo-debug "$prefix Running Shell script $(format-args "$scriptPath") with args: $(format-args "$@")"
source "$scriptPath" $@
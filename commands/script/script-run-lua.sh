local prefix="$(format-cmd "script-run-lua")"
local scriptPath="$1"
shift
echo-debug "$prefix Running Lua script $(format-args "$scriptPath") with args: $(format-args "$@")"
x-lua "$scriptPath" $@
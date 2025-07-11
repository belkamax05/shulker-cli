local prefix="$(format-cmd "script-run-zsh")"
local scriptPath="$1"
shift
echo-debug "$prefix Running ZShell script $(format-args "$scriptPath") with args: $(format-args "$@")"
source "$scriptPath" $@
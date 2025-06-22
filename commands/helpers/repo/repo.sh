local commandName=$1
shift 1
local fnName="repo-${commandName}"
if ! type "$fnName" &>/dev/null; then
    echo-error "Command '$(format-args "$commandName")' not found in $(format-cmd 'repo') helper."
    return $CODE_ERROR
fi
$fnName "$@"
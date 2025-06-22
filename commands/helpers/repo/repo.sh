local commandName=$1
shift 1
local fnName="repo-${commandName}"
if type "$fnName" &>/dev/null; then
    $fnName "$@"
else
    git "$commandName" "$@"
fi

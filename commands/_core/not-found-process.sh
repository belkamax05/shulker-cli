local command=$1
# local isAtLeast3Args=false
# if [[ $# -ge 3 ]]; then
#     isAtLeast3Args=true
# fi
shift 1
local prefix="$(format-cmd "not-found-process")"

#? cehck if can be run as script, and if not-found returned, continue looking forward
local returnCode=$CODE_NOT_FOUND
script-run "$PWD/$command" $@
returnCode=$?
if [[ $returnCode -ne $CODE_NOT_FOUND ]]; then
    echo-debug "$prefix Command $(format-cmd "$command") found and executed successfully."
    return $returnCode
fi


#? if 3 or more words are passed, assume the command is a valid AI command
# if [[ $isAtLeast3Args == true ]]; then
#     ai $command $restArgs
#     return $?
# fi

echo-debug "$prefix Command $(format-cmd "$command") not found. Args: $(format-args "$@")"
return $CODE_NOT_FOUND

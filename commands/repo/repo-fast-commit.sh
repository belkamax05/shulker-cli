local message=$1
local preffix="$(format-cmd 'repo-fast-commit')"
if [[ -z "$message" ]]; then
    local newMessage=$(x-gum input --placeholder "Commit message")
    if [[ -z "$newMessage" ]]; then
        echo-error "Commit message is required."
        return $CODE_ERROR
    fi
    message="$newMessage"
fi
echo-info "$preffix Fast commit with message: $(format-args "$message")"
git commit --no-verify -m "$1" ${@:2}
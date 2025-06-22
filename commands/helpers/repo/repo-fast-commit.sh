local message=$1
if [[ -z "$message" ]]; then
    local newMessage=$(__gum input --placeholder "Commit message")
    if [[ -z "$newMessage" ]]; then
        echo-error "Commit message is required."
        return $CODE_ERROR
    fi
    message="$newMessage"
fi
git commit --no-verify -m "$1" ${@:2}
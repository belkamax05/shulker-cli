if ! command-exists jq; then
    x-brew install jq
fi
jq $@
return $?

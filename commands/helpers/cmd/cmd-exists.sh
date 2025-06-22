local commandName="$1"
if ! command -v "$commandName" &> /dev/null; then
    return $CODE_ERROR
else
    return $CODE_OK
fi
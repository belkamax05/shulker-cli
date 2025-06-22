local dirPath="$1"
if [[ ! -d "$dirPath" ]]; then
    mkdir -p "$dirPath"
    if [[ $? -ne 0 ]]; then
        echo-error "Failed to create directory '$(format-args "$dirPath")'."
        return $CODE_ERROR
    fi
    return $CODE_SUCCESS
fi
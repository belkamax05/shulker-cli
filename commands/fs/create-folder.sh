local dirPath="$1"
local dirPathFormatted="$(format-args "$dirPath")"
if [[ ! -d "$dirPath" ]]; then
    mkdir -p "$dirPath"
    if [[ $? -ne 0 ]]; then
        echo-error "Failed to create directory '$dirPathFormatted'."
        return $CODE_ERROR
    fi
    echo-debug "Created directory: $dirPathFormatted"
    return $CODE_SUCCESS
fi
echo-debug "Directory already exists: $dirPathFormatted"
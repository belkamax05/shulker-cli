local linkPath="$1"
if [[ ! -L "$linkPath" ]]; then
    echo "Error: $linkPath is not a symbolic link."
    return $CODE_ERROR
fi
local targetPath=$(readlink "$linkPath")
if [[ -z "$targetPath" ]]; then
    echo "Error: Could not resolve the target of the link $linkPath."
    return $CODE_ERROR
fi
echo "$targetPath"
return $CODE_SUCCESS
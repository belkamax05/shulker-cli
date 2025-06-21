local sourceDir="$1"
local targetFile="$2"

local preffix=$(format-cmd 'compile-commands-directory-cached')
local sourceDirFormatted=$(format-args "$sourceDir")
local targetFileFormatted=$(format-args "$targetFile")

if [[ ! -d "$sourceDir" ]]; then
    compile-commands-directory "$sourceDir" "$targetFile"
    save-compiled-directory-hash "$sourceDir" "$targetFile"
    trace-add "$preffix Compiled $sourceDirFormatted to file: $targetFileFormatted"
    return $CODE_OK
fi

local hashFile="$targetFile.hash"
local currentHash=$(get-directory-hash "$sourceDir")

if [[ -f "$hashFile" ]]; then
    local previousHash=$(cat "$hashFile")
    if [[ "$currentHash" == "$previousHash" ]]; then
        trace-add "$preffix No changes detected in $sourceDirFormatted, skipping compilation."
        return $CODE_OK
    fi
fi

compile-commands-directory "$sourceDir" "$targetFile"
save-compiled-directory-hash "$sourceDir" "$targetFile"
trace-add "$preffix Compiled $sourceDirFormatted to file: $targetFileFormatted"
return $CODE_OK
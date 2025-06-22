local sourceDir="$1"
local targetFile="$2"

local preffix=$(format-cmd 'compile-commands-directory-cached')
local sourceDirFormatted=$(format-args "$sourceDir")
local targetFileFormatted=$(format-args "$targetFile")

if [[ ! -d "$sourceDir" ]]; then
    echo-debug "$preffix Source directory does not exist: $sourceDirFormatted"
    return $CODE_OK
fi

if [[ ! -f "$targetFile" ]]; then
    compile-commands-directory "$sourceDir" "$targetFile"
    save-compiled-directory-hash "$sourceDir" "$targetFile"
    trace-add "$preffix Compiled $sourceDirFormatted to file: $targetFileFormatted"
    return $CODE_OK
fi

local hashFile="$targetFile.hash"

if is-watch; then
    if [[ -f "$hashFile" ]]; then
        local previousHash=$(cat "$hashFile")
        local currentHash=$(get-directory-hash "$sourceDir")
        if [[ "$currentHash" != "$previousHash" ]]; then
            compile-commands-directory "$sourceDir" "$targetFile"
            save-compiled-directory-hash "$sourceDir" "$targetFile"
            trace-add "$preffix Compiled $sourceDirFormatted to file: $targetFileFormatted"
            return $CODE_OK
        fi
    fi
fi

trace-add "$preffix No changes detected in $sourceDirFormatted, skipping compilation."

return $CODE_OK
local sourceDir="$1"
local targetFile="$2"

local prefix=$(format-cmd 'compile-commands-directory-cached')
local sourceDirFormatted=$(format-args "$sourceDir")
local targetFileFormatted=$(format-args "$targetFile")

echo-debug "$prefix Compiling commands directory: $sourceDirFormatted to file: $targetFileFormatted"

if [[ ! -d "$sourceDir" ]]; then
    echo-debug "$prefix Source directory does not exist: $sourceDirFormatted"
    return $CODE_OK
fi

if [[ ! -f "$targetFile" ]]; then
    trace-add "$prefix Target file missing, compiling $sourceDirFormatted to $targetFileFormatted"
    compile-commands-directory "$sourceDir" "$targetFile"
    save-compiled-directory-hash "$sourceDir" "$targetFile"
    trace-add "$prefix Compiled $sourceDirFormatted to file: $targetFileFormatted"
    return $CODE_OK
fi

local hashFile="$targetFile.hash"

if is-watch; then
    echo-debug "$prefix Watch mode is enabled, checking for changes in $sourceDirFormatted"
    if [[ -f "$hashFile" ]]; then
        local previousHash=$(cat "$hashFile")
        echo-debug "$prefix Previous hash for $sourceDirFormatted: $previousHash"
        local currentHash=$(get-directory-updated-token "$sourceDir")
        echo-debug "$prefix Current hash for $sourceDirFormatted: $currentHash"
        if [[ "$currentHash" != "$previousHash" ]]; then
            compile-commands-directory "$sourceDir" "$targetFile"
            save-compiled-directory-hash "$sourceDir" "$targetFile"
            trace-add "$prefix Compiled $sourceDirFormatted to file: $targetFileFormatted"
            return $CODE_OK
        fi
    fi
fi

trace-add "$prefix No changes detected in $sourceDirFormatted, skipping compilation."

return $CODE_OK
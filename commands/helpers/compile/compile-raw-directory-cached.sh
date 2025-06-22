local sourceDir="$1"
local targetFile="$2"

local prefix=$(format-cmd 'compile-raw-directory-cached')
local sourceDirFormatted=$(format-args "$sourceDir")
local targetFileFormatted=$(format-args "$targetFile")

if [[ ! -d "$sourceDir" ]]; then
    echo-debug "$prefix Source directory does not exist: $sourceDirFormatted"
    return $CODE_OK
fi

if [[ ! -f "$targetFile" ]]; then
    compile-raw-directory "$sourceDir" "$targetFile"
    save-compiled-directory-hash "$sourceDir" "$targetFile"
    trace-add "$prefix Compiled $sourceDirFormatted to file: $targetFileFormatted"
    return $CODE_OK
fi

local hashFile="$targetFile.hash"

if is-watch; then
    if [[ -f "$hashFile" ]]; then
        local previousHash=$(cat "$hashFile")
        local currentHash=$(get-directory-updated-token "$sourceDir")
        if [[ "$currentHash" != "$previousHash" ]]; then
            compile-raw-directory "$sourceDir" "$targetFile"
            save-compiled-directory-hash "$sourceDir" "$targetFile"
            echo-debug "$prefix Changes detected in $sourceDirFormatted, recompiling to $targetFileFormatted. Old hash: $previousHash, New hash: $currentHash"
            trace-add "$prefix Compiled $sourceDirFormatted to file: $targetFileFormatted"
            return $CODE_OK
        fi
    fi
fi

trace-add "$prefix No changes detected in $sourceDirFormatted, skipping compilation."
return $CODE_OK
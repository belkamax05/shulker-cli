local sourceDir="$1"
local targetFile="$2"
local targetFileDir=$(dirname "$targetFile")

local prefix=$(format-cmd 'compile-commands-directory')
local sourceDirFormatted=$(format-args "$sourceDir")
local targetFileFormatted=$(format-args "$targetFile")

if [[ ! -d "$sourceDir" ]]; then
    echo-debug "$prefix Source directory does not exist: $sourceDirFormatted"
    return $CODE_OK
fi

compile-commands-directory-mapper() {
    local file="$1"
    if [[ -f "$file" ]]; then
        local command_name=$(basename "$file" .sh)
        echo-verbose-debug "$prefix Add command: $(format-args "$command_name"))"
        local fileContent=$(cat "$file")
        if is-command-unwrapped "$command_name"; then
            echo "$fileContent" >> "$targetFile"
        else
            echo "${command_name}() {
    $fileContent
}" >> "$targetFile"
        fi
    fi
}

mkdir -p "$targetFileDir"
rm -f "$targetFile"
each-sh-recursive "$sourceDir" "compile-commands-directory-mapper"
echo-debug "$prefix Compiled commands from directory: $sourceDirFormatted to file: $targetFileFormatted"
trace-add "$prefix Compiled $sourceDirFormatted to file: $targetFileFormatted"
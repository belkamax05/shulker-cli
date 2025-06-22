local sourceDir="$1"
local targetFile="$2"

local preffix=$(format-cmd 'source-if-exists')
local sourceDirFormatted=$(format-args "$sourceDir")
local targetFileFormatted=$(format-args "$targetFile")

if [[ ! -d "$sourceDir" ]]; then
    echo-debug "$preffix Source directory does not exist: $sourceDirFormatted"
    return $CODE_OK
fi

local files_list=()
compile-raw-directory-mapper() {
    local file="$1"
    if [[ -f "$file" ]]; then
        echo-verbose-debug "$preffix Add file: $(format-args "$file")"
        files_list+=("$file")
        source "$file"
    fi
}

each-sh-recursive "$sourceDir" "compile-raw-directory-mapper"
awk 'FNR==1 && NR!=1 {print ""} {print}' "${files_list[@]}" > "$targetFile"
trace-add "$preffix Compiled $sourceDirFormatted to file: $targetFileFormatted"
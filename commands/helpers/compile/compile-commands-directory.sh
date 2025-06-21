local sourceDir="$1"
local targetFile="$2"
local targetFileDir=$(dirname "$targetFile")

local preffix=$(format-cmd 'compile-commands-directory')
local sourceDirFormatted=$(format-args "$sourceDir")
local targetFileFormatted=$(format-args "$targetFile")

compile-commands-directory-mapper() {
    local file="$1"
    if [[ -f "$file" ]]; then
        local command_name=$(basename "$file" .sh)
        echo-verbose-debug "$preffix Add command: $(format-args "$command_name"))"
        # Read the content of the file
        local fileContent=$(cat "$file")
        
        local is_unwrapped=false
        [[ $command_name == -* ]] && is_unwrapped=true
        
        #? When starts with "-", do not wrap it into a function
        [[ $is_unwrapped == true ]] && echo "$fileContent" >> "$targetFile"
        #? Create the function definition
        [[ $is_unwrapped == false ]] && echo "${command_name}() {
    $fileContent
}" >> "$targetFile"
    fi
}

mkdir -p "$targetFileDir"
rm -f "$targetFile"
each-sh-recursive "$sourceDir" "compile-commands-directory-mapper"
trace-add "$preffix Compiled $sourceDirFormatted to file: $targetFileFormatted"
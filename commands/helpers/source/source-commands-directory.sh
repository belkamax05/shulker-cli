local sourceDir="$1"
local targetFile="$2"
local targetFileDir=$(dirname "$targetFile")

local preffix="$(format-cmd 'source-commands-directory')"
local sourceDirFormatted=$(format-args "$sourceDir")

source-commands-directory-mapper() {
    local file="$1"
    if [[ -f "$file" ]]; then
        local command_name=$(basename "$file" .sh)
        echo-verbose-debug "$preffix Add command: $command_name"
        # Read the content of the file
        local fileContent=$(cat "$file")
        
        local is_unwrapped=false
        [[ $command_name == -* ]] && is_unwrapped=true
        
        #? When starts with "-", do not wrap it into a function
        [[ $is_unwrapped == true ]] && eval "$fileContent"
        #? Create the function definition
        [[ $is_unwrapped == false ]] && eval "${command_name}() {
    $fileContent
}"
    fi
}

each-sh-recursive "$sourceDir" "source-commands-directory-mapper"
echo-debug "$preffix Sourced dir $sourceDirFormatted"
trace-add "$preffix Sourced dir $sourceDirFormatted"
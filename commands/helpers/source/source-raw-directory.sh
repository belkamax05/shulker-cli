local sourceDir="$1"
local targetFile="$2"
local targetFileDir=$(dirname "$targetFile")

local preffix="$(format-cmd 'source-raw-directory')"

source-raw-directory-mapper() {
    local file="$1"
    if [[ -f "$file" ]]; then
        local fileNameFormatted=$(format-args "$file")
        echo-debug "$preffix Sourcing file: $fileNameFormatted"
        source "$file"
        trace-add "$preffix Sourced file $fileNameFormatted"
    fi
}

each-sh-recursive "$sourceDir" "source-raw-directory-mapper"
trace-add "$preffix Sourced dir $(format-args "$sourceDir")"
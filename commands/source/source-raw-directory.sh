local sourceDir="$1"
local targetFile="$2"
local targetFileDir=$(dirname "$targetFile")

local prefix="$(format-cmd 'source-raw-directory')"

source-raw-directory-mapper() {
    local file="$1"
    if [[ -f "$file" ]]; then
        local fileNameFormatted=$(format-args "$file")
        echo-debug "$prefix Sourcing file: $fileNameFormatted"
        source "$file"
        trace-add "$prefix Sourced file $fileNameFormatted"
    fi
}

each-sh-recursive "$sourceDir" "source-raw-directory-mapper"
trace-add "$prefix Sourced dir $(format-args "$sourceDir")"
local filePath="$1"
local fileName=$(basename "$filePath")
local fileDir=$(dirname "$filePath")

local directoryFrom="$2"
local directoryTo="$3"

local fromRelativePath="${filePath#$directoryFrom/}"

local preffix="$(format-cmd 'link-file-recursive-mapper')"

shift 3

echo-verbose-debug "$preffix. File: $(format-args "$fromRelativePath"), Dir: $(format-args "$fileDir"). Rest args: $@"

echo-verbose-debug "$preffix FromDir: $(format-args "$directoryFrom"), ToDir: $(format-args "$directoryTo")"

local fromFilePath="$directoryFrom/$fromRelativePath"
local toFilePath="$directoryTo/$fromRelativePath"

echo-verbose-debug "$preffix FromFilePath: $(format-args "$fromFilePath"), ToFilePath: $(format-args "$toFilePath")"

if ! file-is-link "$toFilePath"; then
    link-file "$fromFilePath" "$toFilePath" "$@"
    return $CODE_SUCCESS
else
    local linkPointingTo=$(link-pointing-to "$toFilePath")
    echo-verbose-debug "$(format-args "$toFilePath") already a link, points to: $(format-args "$linkPointingTo")"
    if [ "$linkPointingTo" != "$fromFilePath" ]; then
        echo-info "$preffix Linking $(format-args "$toFilePath")} to $(format-args "$fromFilePath")"
        rm -f "$toFilePath"
        link-file "$fromFilePath" "$toFilePath" "$@"
        return $CODE_SUCCESS
    fi
    return $CODE_ERROR
fi

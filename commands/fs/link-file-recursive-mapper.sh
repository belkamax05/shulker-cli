local filePath="$1"
local fileName=$(basename "$filePath")
local fileDir=$(dirname "$filePath")

local directoryFrom="$2"
local directoryTo="$3"

local fromRelativePath="${filePath#$directoryFrom/}"

shift 3

echo-verbose-debug "${COLOR_CYAN}[link-file-recursive-mapper]${STYLE_RESET}. File: ${COLOR_ARGS}$fromRelativePath${STYLE_RESET}, Dir: ${COLOR_ARGS}$fileDir${STYLE_RESET}. Rest args: $@"

echo-verbose-debug "FromDir: ${COLOR_ARGS}$directoryFrom${STYLE_RESET}, ToDir: ${COLOR_ARGS}$directoryTo${STYLE_RESET}"

local fromFilePath="$directoryFrom/$fromRelativePath"
local toFilePath="$directoryTo/$fromRelativePath"

echo-verbose-debug "FromFilePath: ${COLOR_ARGS}$fromFilePath${STYLE_RESET}, ToFilePath: ${COLOR_ARGS}$toFilePath${STYLE_RESET}"

if ! file-is-link "$toFilePath"; then
    link-file "$fromFilePath" "$toFilePath" "$@"
    return $CODE_SUCCESS
else
    local linkPointingTo=$(link-pointing-to "$toFilePath")
    echo-verbose-debug "${COLOR_YELLOW}$toFilePath${STYLE_RESET} already a link, points to: ${COLOR_YELLOW}$linkPointingTo${STYLE_RESET}"
    if [ "$linkPointingTo" != "$fromFilePath" ]; then
        echo-info "Linking ${COLOR_YELLOW}$toFilePath${STYLE_RESET} to ${COLOR_YELLOW}$fromFilePath${STYLE_RESET}"
        rm -f "$toFilePath"
        link-file "$fromFilePath" "$toFilePath" "$@"
        return $CODE_SUCCESS
    fi
    return $CODE_ERROR
fi

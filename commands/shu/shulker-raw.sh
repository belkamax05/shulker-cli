echo-debug() {
    #? do nothing, will be overriden
}
source-as-function() {
    local file="$1"
    echo-debug "[shulker-raw] Sourcing file $file as function"
    local command_name=$(basename "$file" .sh)
    local fileContent=$(cat "$file")
    local is_unwrapped=false
    [[ $command_name == -* ]] && is_unwrapped=true
    #? When starts with "-", do not wrap it into a function
    [[ $is_unwrapped == true ]] && eval "$fileContent"
    #? Create the function definition
    [[ $is_unwrapped == false ]] && eval "${command_name}() {
    $fileContent
}"
}

#? Each of this function can be dependent on each other, they are sourced in any order, but in next command they all need to be initialized
for fnFile in \
    "helpers/echo/echo-info" \
    "helpers/is/is-debug" \
    "helpers/echo/echo-debug" \
    "helpers/echo/echo-verbose-debug" \
    "helpers/is/is-verbose" \
    "helpers/source/source-commands-directory" \
    "helpers/fs/each-sh-recursive" \
    "helpers/color/hex-to-rgb" \
    "helpers/color/color-rgb" \
    "helpers/color/color-hex" \
    "helpers/fs/create-folder" \
    "helpers/format/format-cmd" \
    "helpers/format/format-args"; do
    source-as-function "$SHULKER_DIR/commands/$fnFile.sh"
done

source "$SHULKER_DIR/configs/colors.sh"

#? This are directory imports in initial load, they also could be in any order, because used outside of this file
for cmdDir in \
    "helpers" \
    "shu" \
    "install"; do
    source-commands-directory "$SHULKER_DIR/commands/$cmdDir"
done

trace-add "[shulker-raw] Essential functions loaded"

source-raw-directory "$SHULKER_DIR/configs"

trace-add "[shulker-raw] Configs loaded"

echo-debug "[shulker-raw] Shulker raw loaded"
trace-add "[shulker-raw] Shulker CLI raw commands loaded"
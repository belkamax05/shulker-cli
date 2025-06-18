find "$SHULKER_DIR/commands" -type f -name "*.sh" -print0 | sort -z | while IFS= read -r -d $'\0' file; do
    if [[ -f "$file" ]]; then
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
    fi
done

#? Folder "configs" loads each file source, and concatenates them into a single file
local files_list=()
for file in $(find "$SHULKER_DIR/configs" -type f -name "*.sh" -print0 | sort -z); do
    if [[ -f "$file" ]]; then
        is-verbose && echo-debug "Add file: $file"
        files_list+=("$file")
        source "$file"
    fi
done
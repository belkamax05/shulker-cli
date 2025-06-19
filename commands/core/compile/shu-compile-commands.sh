#? Reads $SHULKER_DIR/commands files and add them as functions to "core".
#? Meaning you don't have to wrap each as "function", rather use it's inner body directly.
echo-debug "Compiling Shulker CLI commands..."
#? Folder "core" loads each file source, and concatenates them into a single file
find "$SHULKER_DIR/commands" -type f -name "*.sh" -print0 | sort -z | while IFS= read -r -d $'\0' file; do
    if [[ -f "$file" ]]; then
        local command_name=$(basename "$file" .sh)
        echo-verbose-debug "Add command: $command_name"
        # Read the content of the file
        local fileContent=$(cat "$file")
        
        local is_unwrapped=false
        [[ $command_name == -* ]] && is_unwrapped=true
        
        #? When starts with "-", do not wrap it into a function
        [[ $is_unwrapped == true ]] && echo "$fileContent" >> "$SHULKER_DIST/commands.sh"
        #? Create the function definition
        [[ $is_unwrapped == false ]] && echo "${command_name}() {
    $fileContent
}" >> "$SHULKER_DIST/commands.sh"
    fi
done
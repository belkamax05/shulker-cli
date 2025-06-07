#? Reads $SHULKER_DIR/commands files and add them as functions to "core".
#? Meaning you don't have to wrap each as "function", rather use it's inner body directly.
__compile_commands() {
    __echo_debug "Compiling Shulker CLI commands..."
    #? Folder "core" loads each file source, and concatenates them into a single file
    find "$SHULKER_DIR/commands" -type f -name "*.sh" -print0 | sort -z | while IFS= read -r -d $'\0' file; do
        if [[ -f "$file" ]]; then
            command_name=$(basename "$file" .sh)
            __echo_debug "Add command: $command_name"
            # Read the content of the file
            command_content=$(cat "$file")
            # Create the function definition
            echo "${command_name}() {
  $(cat "$file")
}" >> "$SHULKER_DIST/commands.sh"
        fi
    done
}

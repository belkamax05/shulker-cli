__compile_core() {
    #? Folder "core" loads each file source, and concatenates them into a single file
    local files_list=()
    for file in $(find "$SHULKER_DIR/core" -type f -name "*.sh" -print0 | sort); do
        if [[ -f "$file" ]]; then
            is-verbose && echo-debug "Add file: $file"
            files_list+=("$file")
            source "$file"
        fi
    done
    awk 'FNR==1 && NR!=1 {print ""} {print}' "${files_list[@]}" > "$SHULKER_DIST/core.sh"
}
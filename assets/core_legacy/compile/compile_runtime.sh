__compile_runtime() {
    #? Folder "runtime" loads each file source, and concatenates them into a single file
    local files_list=()
    for file in $(find "$SHULKER_DIR/runtime" -type f -name "*.sh" -print0 | sort -z); do
        if [[ -f "$file" ]]; then
            echo-verbose-debug "Add file: $file"
            files_list+=("$file")
            source "$file"
        fi
    done
    awk 'FNR==1 && NR!=1 {print ""} {print}' "${files_list[@]}" > "$SHULKER_DIST/runtime.sh"
}

each-sh-recursive() {
    local root_dir="$1"
    local command="$2"
    shift 2
    find "$root_dir" -type f -name "*.sh" -print0 | sort -z | while IFS= read -r -d $'\0' file; do
        eval "$command" "$file" "$@"
    done
}


source-commands-directory-mapper() {
    local file="$1"
    if [[ -f "$file" ]]; then
        local command_name=$(basename "$file" .sh)
        local fileContent=$(cat "$file")
        if is-command-unwrapped "$command_name"; then
            eval "$fileContent"
        else
            eval "${command_name}() {
    $fileContent
}"
        fi
    fi
}

source-commands-directory() {
    local sourceDir="$1"
    local targetFile="$2"
    local targetFileDir=$(dirname "$targetFile")
    each-sh-recursive "$sourceDir" "source-commands-directory-mapper"
}

core-load-from-source() {
    source-commands-directory "$SHULKER_DIR/commands"
}

#? Source this file from your .zshrc anywhere
__echo_debug() {
    [[ $SHULKER_DEBUG == true ]] && echo "🐞 $@"
}
__echo_error() {
    echo "$COLOR_ERROR$STYLE_BOLD❌ Error:$STYLE_RESET $@"
}
__echo_debug "Starting Shulker CLI initialization..."
__echo_error() {
    echo "ERROR: $1" >&2
}
__START_TIME=$(date +%s%3N)
__CURRENT_FILE=${(%):-%N}
#! Essentials for Shulker CLI
SHULKER_DIR=$(realpath $(dirname $__CURRENT_FILE))
SHULKER_DIST="$SHULKER_DIR/dist"
#! Essentials end

__NEED_TO_COMPILE=""
__REPO_HASH_FILE_PATH="$SHULKER_DIST/.shulker"
#? Gets all files update hash except the dist directory. Meaning if any file change, will recompile
__REPO_HASH=$(find "$SHULKER_DIR" -type f -not -path "$SHULKER_DIST/*" -print0 | sort -z | while IFS= read -r -d $'\0' file; do
    realpath "$file" | sed 's/\r$//' #? Remove DOS line endings
    cat "$file" #? Include file content
done | md5sum | cut -d' ' -f1)

if [[ ! -f $__REPO_HASH_FILE_PATH ]]; then
    __NEED_TO_COMPILE="Hash file not found. Shulker needs to be compiled for the first time."
fi

if [[ -f $__REPO_HASH_FILE_PATH ]]; then
    __REPO_HASH_FILE=$(cat "$__REPO_HASH_FILE_PATH")
    if [[ "$__REPO_HASH" != "$__REPO_HASH_FILE" ]]; then
        __NEED_TO_COMPILE="Shulker needs to be recompiled due to changes in the source files. Old hash: $__REPO_HASH_FILE, New hash: $__REPO_HASH"
    fi
fi

if [[ ! -f "$SHULKER_DIST/shulker.sh" ]]; then
    __NEED_TO_COMPILE="Shulker has not been compiled yet. Compiling now..."
fi

if [[ "$__NEED_TO_COMPILE" != "" ]]; then
    __echo_debug "$__NEED_TO_COMPILE"
    if [[ -d "$SHULKER_DIR/dist" ]]; then
        rm -rf "$SHULKER_DIR/dist"
    fi
    mkdir -p "$SHULKER_DIR/dist"
    source "$SHULKER_DIR/compile.sh"
    touch "$__REPO_HASH_FILE_PATH"
    echo "$__REPO_HASH" > "$__REPO_HASH_FILE_PATH"
else
    __echo_debug "Shulker is up to date. No need to recompile."
fi

if [[ ! -f "$SHULKER_DIST/shulker.sh" ]]; then
    __echo_error "Shulker file not found in dist directory. Please ensure the compilation was successful."
    return 1
else
    source "$SHULKER_DIST/shulker.sh"
fi

__END_TIME=$(date +%s%3N)
__ELAPSED_TIME=$((__END_TIME - $__START_TIME))
__echo_debug "Shulker boot $__ELAPSED_TIME in milliseconds. Located at $SHULKER_DIR"
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

__CURRENT_FILE=${(%):-%N}
__NEED_TO_COMPILE=""
__RECOMPILED=false
#! Essentials for Shulker CLI
SHULKER_DIR=$(realpath $(dirname $__CURRENT_FILE))
SHULKER_DIST="$SHULKER_DIR/dist"
SHULKER_HASH_PATH="$SHULKER_DIST/.shulker"
__get_current_hash() {
    local current_hash=$(find "$SHULKER_DIR" -type f -not -path "$SHULKER_DIST/*" -print0 | sort -z | while IFS= read -r -d $'\0' file; do
        realpath "$file" | sed 's/\r$//' #? Remove DOS line endings
        cat "$file" #? Include file content
    done | md5sum | cut -d' ' -f1)
    echo "$current_hash"
}
#? Gets all files update hash except the dist directory. Meaning if any file change, will recompile
__recompile() {
    if [[ -d "$SHULKER_DIR/dist" ]]; then
        rm -rf "$SHULKER_DIR/dist"
    fi
    mkdir -p "$SHULKER_DIR/dist"
    source "$SHULKER_DIR/compile.sh"
    touch "$SHULKER_HASH_PATH"
    echo "$(__get_current_hash)" > "$SHULKER_HASH_PATH"
    source "$SHULKER_DIST/shulker.sh"
    __RECOMPILED=true
}
[[ ! -f "$SHULKER_DIST/shulker.sh" ]] && __recompile
[[ $__RECOMPILED == false ]] && source "$SHULKER_DIST/shulker.sh"
__START_TIME=$(__get_time_ms)
#! Essentials end

# if not recompiled, check if we need to recompile
if [[ "$__RECOMPILED" == false ]]; then
    if [[ ! -f $SHULKER_HASH_PATH ]]; then
        __NEED_TO_COMPILE="Hash file not found. Shulker needs to be compiled for the first time."
    fi

    if [[ -f $SHULKER_HASH_PATH ]]; then
        __REPO_HASH_FILE=$(cat "$SHULKER_HASH_PATH")
        __REPO_HASH_VALUE=$(__get_current_hash)
        if [[ "$__REPO_HASH_VALUE" != "$__REPO_HASH_FILE" ]]; then
            __NEED_TO_COMPILE="Shulker needs to be recompiled due to changes in the source files. Old hash: $__REPO_HASH_FILE, New hash: $__REPO_HASH_VALUE"
        fi
    fi
fi

if [[ "$__NEED_TO_COMPILE" != "" ]]; then
    __echo_debug "$__NEED_TO_COMPILE"
    __recompile
fi

__END_TIME=$(__get_time_ms)
__ELAPSED_TIME=$((__END_TIME - $__START_TIME))
__echo_debug "Shulker boot $__ELAPSED_TIME in milliseconds. Located at $SHULKER_DIR"
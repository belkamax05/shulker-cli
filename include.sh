#? Source this file from your .zshrc
__CURRENT_FILE=${(%):-%N}
# #! Essentials for Shulker CLI
SHULKER_DIR=$(realpath $(dirname $__CURRENT_FILE))
SHULKER_DIST="$SHULKER_DIR/.shulker"
SHULKER_BUNDLE_PATH="$SHULKER_DIST/shulker.sh"
# #! Essentials end
SHU_BUNDLE_UPDATED=false
SHU_SKIP_INCLUDE=false

#if SHU_LAST_TRACE_TIME defined
if [[ -n "$SHU_LAST_INCLUDE_TIME" ]]; then
    current_time=$(get-time-ms)
    elapsed_time=$(($current_time - $SHU_LAST_INCLUDE_TIME))
    if [[ $elapsed_time -lt 2000 ]]; then
        trace-add "$(format-success "Shulker CLI already included $(format-args "$elapsed_time")$(format-success "ms ago")")"
        SHU_SKIP_INCLUDE=true
    fi
fi

if [[ $SHU_SKIP_INCLUDE == false ]]; then
    if [[ -f "$SHULKER_BUNDLE_PATH" ]]; then
        source "$SHULKER_BUNDLE_PATH"
        prefix=$(format-cmd 'include')
        trace-add "$prefix Shulker bundle included from cache"
    else
        #? sources essentials needed for compilation below
        # source "$SHULKER_DIR/core-minimal.sh"
        find "$SHULKER_DIR/core" -type f -name "*.sh" -print0 | sort -z | while IFS= read -r -d $'\0' file; do
            echo "Sourcing $file for the first time"
            source "$file"
        done
        core-load-from-source
        prefix=$(format-cmd 'include')
        trace-add "$prefix Shulker bundle included from raw source"
    fi
fi

precompile-repo-root "$SHULKER_DIR" "$SHULKER_DIST"
compile-precompiled-bundle "$SHULKER_DIST" "$SHULKER_BUNDLE_PATH"

if [[ $SHU_BUNDLE_UPDATED == true ]]; then
    source "$SHULKER_BUNDLE_PATH"
fi

trace-add "$prefix $(format-success 'Shulker CLI started')"
SHU_LAST_INCLUDE_TIME=$(get-time-ms)
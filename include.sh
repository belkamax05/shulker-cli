#? Source this file from your .zshrc
__CURRENT_FILE=${(%):-%N}
# #! Essentials for Shulker CLI
SHULKER_DIR=$(realpath $(dirname $__CURRENT_FILE))
SHULKER_DIST="$SHULKER_DIR/.shulker"
SHULKER_BUNDLE_PATH="$SHULKER_DIST/shulker.sh"
# #! Essentials end
SHU_BUNDLE_UPDATED=false
if [[ -f "$SHULKER_BUNDLE_PATH" ]]; then
    source "$SHULKER_BUNDLE_PATH"
    trace-add "Shulker bundle included from cache"
else
    #? sources essentials needed for compilation below
    source "$SHULKER_DIR/commands/shu/shulker-raw.sh"
fi

create-folder "$SHULKER_DIST"
precompile-repo-root "$SHULKER_DIR" "$SHULKER_DIST"
compile-precompiled-bundle "$SHULKER_DIST" "$SHULKER_BUNDLE_PATH"

if [[ $SHU_BUNDLE_UPDATED == true ]]; then
    source "$SHULKER_BUNDLE_PATH"
fi

trace-add "$(format-cmd 'include') ${COLOR_SUCCESS}Shulker CLI started${STYLE_RESET}"
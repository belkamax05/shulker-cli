#? Source this file from your .zshrc
__CURRENT_FILE=${(%):-%N}
# #! Essentials for Shulker CLI
SHULKER_DIR=$(realpath $(dirname $__CURRENT_FILE))
SHULKER_DIST="$HOME/.local/share/shulker"
SHULKER_HASH_PATH="$SHULKER_DIST/.shulker.hash"
SHULKER_BUNDLE_PATH="$SHULKER_DIST/shulker.sh"
# #! Essentials end
if [[ -f "$SHULKER_BUNDLE_PATH" ]]; then
    source "$SHULKER_BUNDLE_PATH"
    trace-add "Shulker bundle included from cache"
else
    #? sources essentials needed for compilation below
    source "$SHULKER_DIR/commands/shu/shulker-raw.sh"
fi

shu-validate-precompile
shu-validate-bundle

trace-add "Shulker CLI started"
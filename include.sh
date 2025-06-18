#? Source this file from your .zshrc
shu-call() {
    local filePath="$SHULKER_DIR/commands/$1.sh"
    local functionName=$(basename "$filePath" .sh)
    local fileContent=$(cat "$filePath")
    shift #? Remove the first argument (the command name)
    eval "${functionName}() {
$fileContent
}"
    $functionName "$@"
}
__CURRENT_FILE=${(%):-%N}
# #! Essentials for Shulker CLI
SHULKER_DIR=$(realpath $(dirname $__CURRENT_FILE))
SHULKER_DIST="$SHULKER_DIR/dist"
SHULKER_HASH_PATH="$SHULKER_DIST/.shulker"
SHULKER_BUNDLE_PATH="$SHULKER_DIST/shulker.sh"
# #! Essentials end
if [[ -f "$SHULKER_BUNDLE_PATH" ]]; then
    source "$SHULKER_BUNDLE_PATH"
    trace-add "Shulker bundle included from cache"
else
    shu-call "core/shu-include"
fi
if [[ ! -d "$SHULKER_DIST" ]]; then
    mkdir -p "$SHULKER_DIST"
fi
if shu-get-need-recompile; then
    shu-compile
    source "$SHULKER_BUNDLE_PATH"
    trace-add "Shulker bundle included after recompile"
fi

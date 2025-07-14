#? Source this file from your .zshrc
__CURRENT_FILE=${(%):-%N}
__CURRENT_DIR=$(realpath $(dirname $__CURRENT_FILE))
source-directory-flat "$SHULKER_DIR/runtime-interactive"
echo-trace-project "shulker-cli [zshrc]" "$__CURRENT_DIR"

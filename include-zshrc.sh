#? Source this file from your .zshrc
__CURRENT_FILE=${(%):-%N}
__CURRENT_DIR=$(realpath $(dirname $__CURRENT_FILE))
boot-zshrc
echo-trace-project "shulker-cli [zshrc]" "$__CURRENT_DIR"

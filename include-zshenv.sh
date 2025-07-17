#? Source this file from your .zshrc
__CURRENT_FILE=${(%):-%N}
__CURRENT_DIR=$(realpath $(dirname $__CURRENT_FILE))

SHULKER_DIR=$__CURRENT_DIR

source "$SHULKER_DIR/functions/_configure/configure-functions"
configure-functions "$SHULKER_DIR/functions"

SHU_START_TIME=$(get-time-ms)

configure-globals
configure-exports
configure-brew
configure-hooks
configure-paths

config-emit

export PATH="$PATH:$SHULKER_DIR/bin"

echo-trace-project "shulker-cli [zshenv]" "$__CURRENT_DIR"

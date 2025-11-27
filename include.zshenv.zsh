#? Source this file from your .zshrc
__CURRENT_FILE=${(%):-%N}
__CURRENT_DIR=$(realpath $(dirname $__CURRENT_FILE))

SHULKER_CLI_DIR=$__CURRENT_DIR

echo "cli-legacy 2"


autoload-dir "$SHULKER_CLI_DIR/functions"

configure-globals
configure-exports
configure-brew
configure-hooks
configure-paths
configure-nvm
override-nvm-load

config-emit

path-prepend "$HOME/.nvm/versions/node/v20.14.0/bin"

echo-trace-project "shulker-cli [zshenv]" "$__CURRENT_DIR"

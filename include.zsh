#? Source this file from your .zshrc
__CURRENT_FILE=${(%):-%N}
__CURRENT_DIR=$(realpath $(dirname $__CURRENT_FILE))

echo "cli-legacy 1"

configure-zap
configure-alias
configure-autosuggestions
configure-fzf

configure-not-found

path-prepend "$HOME/.nvm/versions/node/v20.14.0/bin"

echo-trace-project "shulker-cli [zshrc]" "$__CURRENT_DIR"

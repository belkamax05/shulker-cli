#? Source this file from your .zshrc
__CURRENT_FILE=${(%):-%N}
__CURRENT_DIR=$(realpath $(dirname $__CURRENT_FILE))

configure-zap
configure-alias
configure-autosuggestions
configure-fzf
configure-prompt
configure-nvm
configure-not-found

override-nvm-load

echo-trace-project "shulker-cli [zshrc]" "$__CURRENT_DIR"

#? Source this file from your .zshrc
__CURRENT_FILE=${(%):-%N}
__CURRENT_DIR=$(realpath $(dirname $__CURRENT_FILE))

configure-zap
configure-alias
configure-autosuggestions
configure-fzf
configure-prompt
configure-not-found

export PATH="$HOME/.nvm/versions/node/v20.14.0/bin:$PATH"

echo-trace-project "shulker-cli [zshrc]" "$__CURRENT_DIR"

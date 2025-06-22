if [[ ! -f "$HOME/.local/share/zap/zap.zsh" ]]; then
    zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
fi
source "$HOME/.local/share/zap/zap.zsh"
trace-add "$(format-cmd '__plug') zap sourced"
__plug() {
    plug "$@"
}
__plug "$@"
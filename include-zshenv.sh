#? Source this file from your .zshrc
__CURRENT_FILE=${(%):-%N}
__CURRENT_DIR=$(realpath $(dirname $__CURRENT_FILE))

SHULKER_DIR=$__CURRENT_DIR

boot-source() {
    source "$SHULKER_DIR/boot/$1.sh"
    trace-add "Boot '$(format-args "boot/$1.sh")' completed"
}

boot-zshenv() {
    boot-source "functions"
    local bootTasks=("lua")
    for bootTask in "${bootTasks[@]}"; do
        boot-source "$bootTask"
    done
}
boot-zshrc() {
    local bootTasks=("configure" "runtime")
    for bootTask in "${bootTasks[@]}"; do
        boot-source "$bootTask"
    done
}

boot-zshenv
echo-trace-project "shulker-cli [zshenv]" "$__CURRENT_DIR"

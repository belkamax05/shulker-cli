#? Source this file from your .zshrc
__CURRENT_FILE=${(%):-%N}
__CURRENT_DIR=$(realpath $(dirname $__CURRENT_FILE))
# #! Essentials for Shulker CLI
SHULKER_DIR=$__CURRENT_DIR
# #! Essentials end
SHU_BUNDLE_UPDATED=false
SHU_SKIP_INCLUDE=false

source "$SHULKER_DIR/boot/functions.sh"
SHU_START_TIME=$(get-time-ms)
SHU_LAST_TRACE_TIME=$SHU_START_TIME
BOOT_TASKS=("lua" "configure" "runtime")
for bootTask in "${BOOT_TASKS[@]}"; do
    source "$SHULKER_DIR/boot/$bootTask.sh"
    trace-add "$__PREFIX Boot '$(format-args "boot/$bootTask.sh")' completed"
done

SHU_LAST_INCLUDE_TIME=$(get-time-ms)
echo-trace-project "shulker-cli" "$__CURRENT_DIR"

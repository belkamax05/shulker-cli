__PREFIX="$(format-cmd 'configure')"

# Define configuration tasks
CONFIG_TASKS=("exports" "brew" "alias" "zap" "autosuggestions" "autoload" "paths" "fzf" "prompt")

# Execute each configuration task
for configureTask in "${CONFIG_TASKS[@]}"; do
    configure-$configureTask
    trace-add "$__PREFIX Task '$(format-args "configure-$configureTask")' completed"
done
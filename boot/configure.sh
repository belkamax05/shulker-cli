boot-configure() {
    local prefix="$(format-cmd 'configure')"
    # Define configuration tasks
    local configTasks=("exports" "brew" "alias" "zap" "nvm" "autosuggestions" "autoload" "paths" "fzf" "prompt")

    # Execute each configuration task
    for configureTask in "${configTasks[@]}"; do
        configure-$configureTask
        trace-add "$prefix Task '$(format-args "configure-$configureTask")' completed"
    done
}
boot-configure
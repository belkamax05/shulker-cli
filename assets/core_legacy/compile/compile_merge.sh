#? Joins "core" & "commands" into a single file, so it can be used as a part of Shulker CLI.
__compile_merge() {
    cat "$SHULKER_DIST/core.sh" "$SHULKER_DIST/commands.sh" "$SHULKER_DIST/configs.sh" "$SHULKER_DIST/runtime.sh" > "$SHULKER_DIST/shulker.sh"
    chmod +x "$SHULKER_DIST/shulker.sh"
    rm "$SHULKER_DIST/core.sh" "$SHULKER_DIST/commands.sh" "$SHULKER_DIST/configs.sh" "$SHULKER_DIST/runtime.sh"
    if [[ -f "$SHULKER_DIST/shulker.sh" ]]; then
        echo-success "Shulker CLI compiled successfully at $SHULKER_DIST/shulker.sh"
    else
        echo-error "Failed to compile Shulker CLI."
        return $CODE_ERROR
    fi
}
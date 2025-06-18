#? Joins "core" & "commands" into a single file, so it can be used as a part of Shulker CLI.
cat "$SHULKER_DIST/commands.sh" "$SHULKER_DIST/configs.sh" "$SHULKER_DIST/runtime.sh" > "$SHULKER_BUNDLE_PATH"
chmod +x "$SHULKER_BUNDLE_PATH"
rm "$SHULKER_DIST/commands.sh" "$SHULKER_DIST/configs.sh" "$SHULKER_DIST/runtime.sh"
if [[ -f "$SHULKER_BUNDLE_PATH" ]]; then
    echo-success "Shulker CLI compiled successfully at $SHULKER_BUNDLE_PATH"
else
    echo-error "Failed to compile Shulker CLI."
    return $CODE_ERROR
fi
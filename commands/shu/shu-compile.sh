#? This file is not intended to be sourced directly, but rather compiled and used as a part of Shulker CLI. See "include.sh" instead
# compile-commands-directory-cached "$SHULKER_DIR/commands" "$SHULKER_DIST/precompile/commands.sh"
# compile-raw-directory-cached "$SHULKER_DIR/configs" "$SHULKER_DIST/precompile/configs.sh"
# compile-raw-directory-cached "$SHULKER_DIR/runtime" "$SHULKER_DIST/precompile/runtime.sh"

#? Joins "core" & "commands" into a single file, so it can be used as a part of Shulker CLI.
cat "$SHULKER_DIST/precompile/commands.sh" "$SHULKER_DIST/precompile/configs.sh" "$SHULKER_DIST/precompile/runtime.sh" > "$SHULKER_BUNDLE_PATH"
chmod +x "$SHULKER_BUNDLE_PATH"
if [[ -f "$SHULKER_BUNDLE_PATH" ]]; then
    echo-success "Shulker CLI compiled successfully at $SHULKER_BUNDLE_PATH"
else
    echo-error "Failed to compile Shulker CLI."
    return $CODE_ERROR
fi

touch "$SHULKER_HASH_PATH"
echo "$(shu-current-hash)" > "$SHULKER_HASH_PATH"

return $CODE_SUCCESS
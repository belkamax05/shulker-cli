#? Joins "core" & "commands" into a single file, so it can be used as a part of Shulker CLI.
cat "$SHULKER_DIST/precompile/commands.sh" "$SHULKER_DIST/precompile/runtime.sh" > "$SHULKER_BUNDLE_PATH"
chmod +x "$SHULKER_BUNDLE_PATH"
if [[ -f "$SHULKER_BUNDLE_PATH" ]]; then
    echo-success "Shulker CLI compiled successfully at $SHULKER_BUNDLE_PATH"
else
    echo-error "Failed to compile Shulker CLI."
    return $CODE_ERROR
fi

local shulkerHashPath="$SHULKER_DIST/.shulker.hash"
touch "$shulkerHashPath"
echo "$(shu-current-hash)" > "$shulkerHashPath"

return $CODE_SUCCESS
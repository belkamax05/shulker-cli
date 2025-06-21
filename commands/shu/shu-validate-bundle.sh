#! old
# if shu-require-recompile; then
#     shu-compile
#     shu-source-bundle
#     trace-add "Shulker bundle included after recompile"
# fi

#! new
local preffix="$(format-cmd 'shulker-validate-bundle')"
trace-add "Shulker new bundle starting"
local allHashesConcat=""
# local allFilesConcat=""

precompile-fileHash-mapper() {
    local filePath="$1"
    local hashFilePath=$filePath.hash
    echo-debug "$preffix Add file hash to bundle: $(format-args "$filePath")"
    local fileHash=$(cat "$hashFilePath")
    allHashesConcat+="$fileHash"
}
precompile-bundler-mapper() {
    local filePath="$1"
    echo-debug "$preffix Add file to bundle: $(format-args "$filePath")"
    local content="$(cat "$filePath")"
    # allFilesConcat+="$content"
    echo "$content" >> "$SHULKER_BUNDLE_PATH"
}
save-all-hashes() {
    echo "$allHashesConcat" > "$SHULKER_BUNDLE_PATH.hash"
}

each-sh-recursive "$SHULKER_DIST/precompile" "precompile-fileHash-mapper" #! needs to be sorted by param

bundle-all-files() {
    # > "$SHULKER_BUNDLE_PATH" #? Clear the bundle file
    rm -f "$SHULKER_BUNDLE_PATH" #? Clear the bundle file
    touch "$SHULKER_BUNDLE_PATH" #? Create the bundle file if it doesn't exist
    each-sh-recursive "$SHULKER_DIST/precompile" "precompile-bundler-mapper" #! needs to be sorted by param
    # echo "$allFilesConcat" > "$SHULKER_BUNDLE_PATH"
    save-all-hashes
}

local currentHashName="$SHULKER_BUNDLE_PATH.hash"
if [[ ! -f "$SHULKER_BUNDLE_PATH" ]]; then
    echo-info "$preffix Shulker bundle not found. Recompiling"
    #!!!
    bundle-all-files
    trace-add "$preffix Shulker bundle not found. Recompiled"
    return $CODE_SUCCESS
fi
if [[ ! -f "$currentHashName" ]]; then
    echo-info "$preffix Shulker bundle hash file not found. Recompiling"
    #!!!
    bundle-all-files
    trace-add "$preffix Shulker bundle hash file not found. Recompiled"
    return $CODE_SUCCESS
fi
local currentHash=$(cat "$currentHashName")
if [[ -z "$currentHash" ]]; then
    echo-info "$preffix No bundle hash found. Recompiling"
    #!!!
    bundle-all-files
    trace-add "$preffix No bundle hash found. Recompiled"
    return $CODE_SUCCESS
fi
if [[ $currentHash != $allHashesConcat ]]; then
    echo-info "$preffix Shulker bundle hash mismatch. Recompiling"
    #!!!
    bundle-all-files
    trace-add "$preffix Shulker bundle hash mismatch. Recompiled"
    return $CODE_SUCCESS
fi
trace-add "$preffix Shulker bundle path: $SHULKER_BUNDLE_PATH"
#! old
# if shu-require-recompile; then
#     shu-compile
#     shu-source-bundle
#     trace-add "Shulker bundle included after recompile"
# fi

#! new
local preffix="$(format-cmd 'shulker-validate-bundle')"
trace-add "$preffix Shulker new bundle starting"
local allHashesConcat=""
# local allFilesConcat=""

precompile-fileHash-mapper() {
    local filePath="$1"
    local hashFilePath=$filePath.hash
    echo-debug "$preffix Add hash for bundle: $(format-args "$filePath")"
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
    local msg=$1
    echo-info "$preffix $msg"
    # > "$SHULKER_BUNDLE_PATH" #? Clear the bundle file
    rm -f "$SHULKER_BUNDLE_PATH" #? Clear the bundle file
    touch "$SHULKER_BUNDLE_PATH" #? Create the bundle file if it doesn't exist
    each-sh-recursive "$SHULKER_DIST/precompile" "precompile-bundler-mapper" #! needs to be sorted by param
    # echo "$allFilesConcat" > "$SHULKER_BUNDLE_PATH"
    save-all-hashes
    trace-add "$preffix $msg completed"
}

local currentHashName="$SHULKER_BUNDLE_PATH.hash"
if [[ ! -f "$SHULKER_BUNDLE_PATH" ]]; then
    bundle-all-files "bundle not found."
    return $CODE_SUCCESS
fi
if [[ ! -f "$currentHashName" ]]; then
    bundle-all-files "hash not found."
    return $CODE_SUCCESS
fi
local currentHash=$(cat "$currentHashName")
if [[ -z "$currentHash" ]]; then
    bundle-all-files "hash is empty."
    return $CODE_SUCCESS
fi
if [[ $currentHash != $allHashesConcat ]]; then
    bundle-all-files "hash mismatch."
    return $CODE_SUCCESS
fi
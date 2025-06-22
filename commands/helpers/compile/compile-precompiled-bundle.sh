local distDir=$1
local bundlePath=$2
local preffix="$(format-cmd 'compile-precompiled-bundle')"

local allHashesConcat=""
precompile-fileHash-mapper() {
    local filePath="$1"
    local hashFilePath=$filePath.hash
    echo-debug "$preffix Add hash for bundle: $(format-args "$filePath")"
    local fileHash=$(cat "$hashFilePath")
    allHashesConcat+="$fileHash"
}
each-sh-recursive "$distDir/precompile" "precompile-fileHash-mapper"

precompile-bundler-mapper() {
    local filePath="$1"
    echo-debug "$preffix Add file to bundle: $(format-args "$filePath")"
    local content="$(cat "$filePath")"
    # allFilesConcat+="$content"
    echo "$content" >> "$bundlePath"
}
bundle-all-files() {
    local msg=$1
    echo-info "$preffix $msg"
    rm -f "$bundlePath" #? Clear the bundle file
    touch "$bundlePath" #? Create the bundle file if it doesn't exist
    each-sh-recursive "$distDir/precompile" "precompile-bundler-mapper"
    echo "$allHashesConcat" > "$bundlePath.hash"
    trace-add "$preffix $msg completed"
    SHU_BUNDLE_UPDATED=true
}

local currentHashName="$bundlePath.hash"
if [[ ! -f "$bundlePath" ]]; then
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

trace-add "$preffix bundle is compiled"
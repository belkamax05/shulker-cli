local bundleFile="$SHULKER_DIST/shulker.sh"
if [[ ! -f $bundleFile ]]; then
    echo-info "Shulker bundle not found. Shulker needs to be recompiled."
    return $CODE_SUCCESS
fi
local hashFile=$SHULKER_HASH_PATH
if [[ ! -f $hashFile ]]; then
    echo-info "Hash file not found. Shulker needs to be recompiled."
    return $CODE_SUCCESS
fi
local repoHashFile=$(cat "$SHULKER_HASH_PATH")
local repoHashValue=$(shu-get-current-hash)
if [[ "$repoHashValue" != "$repoHashFile" ]]; then
    echo-info "Shulker needs to be recompiled due to changes in the source files. Old hash: $repoHashFile, New hash: $repoHashValue"
    return $CODE_SUCCESS
fi

return $CODE_ERROR